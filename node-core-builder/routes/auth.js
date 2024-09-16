// middleware call
const { verifyToken } = require('../middleware/verifyToken')

// include controllers
const authentication = require('../controllers/cont-auth')
const user = require('../controllers/cont-user')
const apicall = require("../controllers/call")

const auth = app => {
 
    // login non OTP
    app.post('/auth/login', async (req,res) => {

        try {

            const login = await authentication.Login(req.body)

            if(login.respond.status == 'success') {
                
                const updateToken = await authentication.updateToken(login.respond.UserCode,login.respond.accessToken)
                
                if(updateToken.respond.status == 'success') {

                    res.cookie('refreshToken', login.respond.refreshToken, {
                        httpOnly: true,
                        maxAge: 24 * 60 * 60 * 1000
                    })

                    const output = { 
                        respond: {
                            status: "success", 
                            accessToken: login.respond.accessToken,
                            data: {
                                user_id: login.respond.UserCode,
                                user_name: login.respond.UserName,
                            }
                        }}
                        
                    res.send(output)
                } else {
                    res.send(updateToken)
                }
                
            } else {

                res.send(login)
            }
            
        } catch (error) {

            res.send(error)
        }

    })   
    
    
    // login non OTP
    app.post('/auth/register', async (req,res) => {

        try {

            const exist = await user.cekUserEmail(req.body.email)

            if(exist.respond.status == 'failed') {

                const UserCode = await user.Generate_UserCode()

                const register = await user.register(req.body, UserCode.respond.UserCode)
                
                if(register.respond.status == 'success') {

                    user.register_credential(register.respond.data.dataCredential, req.body)
                    
                    res.send(register)
                    
                } else {

                    res.send(register)
                }

            } else {
                res.send({respond: {status: "failed", response: "Email telah terdaftar"}})
            }
            
        } catch (error) {

            res.send({respond: {status: "error", response: error}})
        }

    })   

    
    // logout
    app.post('/auth/logout', verifyToken ,  async (req,res) => {

        try {
            const Logout = await authentication.updateToken(req.UserCode,'0')
            if(Logout.respond.status == 'success') {


                res.clearCookie('refreshToken')
                res.send({respond: {status: "success", response: "Logout Berhasil Dilakukan"}})
            } else {
                res.send(Logout)
            }
        } catch (error) {
            res.json(error)
        }

    })


    // forgotpass customer
    app.post('/auth/forgotpass', async (req,res) => {
        
        try {

            const cek = await user.cekUserEmail(req.body.email)
            
            if(cek.respond.status == 'success') {
                const proces = await user.forgotpass(cek.respond.UserCode)
                if(proces.respond.status == 'success') {

                    // log activity
                    const getuser = await user.DetailUser(cek.respond.UserCode)
                    const createlog =  await user.createLogs(cek.respond.UserCode,getuser.respond.data.ContactName,'auth/forgotpass', req)

                    dataEmail = {
                        action: 'Forgot Password',
                        send_to: cek.respond.Email,
                        name: cek.respond.ContactName,
                        vcode: proces.respond.vcode
                    }
                                
                    // kirim email user aktivasi
                    const send = await apicall.services('POST', dataEmail, process.env.URL_EMAIL_SERVICES)
                    
                    res.send(proces)
                } else {
                    res.send(proces)
                }
            } else {
                res.json({respond: {status: 'failed', response: 'Email tidak terdaftar'}})
            }
            
        } catch (error) {
            res.json(error)
        }
 
    })

    // forgotpass
    app.post('/auth/changepass', async (req,res) => {

        try {
            const cek = await user.cekVerifyCode(req.body.vcode)
            
            if(cek.respond.status == 'success') {
                const process = await authentication.changepass(req.body, cek.respond.UserCode)
                console.log(process)
                if(process.respond.status == 'success') {

                    // log activity
                    const getuser = await user.DetailUser(cek.respond.UserCode)
                    const createlog =  await user.createLogs(cek.respond.UserCode,getuser.respond.data.ContactName,'auth/changepass', req)

                    const remove = await user.removeVerifiedCode(cek.respond.UserCode)

                    res.send(process)
                } else {
                    res.send(process)
                }
            } else {
                res.send(cek)
            }
            
        } catch (error) {
            res.json(error)
        }

    })


    // get password
    app.get('/auth/get/pass', verifyToken ,  async (req,res) => {

        try {
            
            const password = await user.getPassword(req.query.UserCode)
            res.send(password)

        } catch (error) {
            res.json(error)
        }

    })

}

module.exports = auth