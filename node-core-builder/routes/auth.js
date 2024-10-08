// middleware call
const { verifyToken } = require('../middleware/verifyToken')

// include controllers
const authentication = require('../controllers/cont-auth')
const user = require('../controllers/cont-user')
const apicall = require("../controllers/call")

const auth = app => {

    // login non OTP
    app.post('/auth/login', async (req, res) => {

        try {

            const login = await authentication.Login(req.body)

            if (login.respond.status == 'success') {

                const updateToken = await authentication.updateToken(login.respond.UserCode, login.respond.accessToken)

                if (updateToken.respond.status == 'success') {

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
                        }
                    }

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

    // forgotpass
    app.post('/auth/changepass', async (req, res) => {

        try {
            const cek = await user.cekVerifyCode(req.body.vcode)

            if (cek.respond.status == 'success') {
                const process = await authentication.changepass(req.body, cek.respond.UserCode)

                if (process.respond.status == 'success') {

                    // log activity
                    const getuser = await user.DetailUser(cek.respond.UserCode)
                    const createlog = await user.createLogs(cek.respond.UserCode, getuser.respond.data.ContactName, 'auth/changepass', req)

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
    app.get('/auth/get/pass', verifyToken, async (req, res) => {

        try {

            const password = await user.getPassword(req.query.UserCode)
            res.send(password)

        } catch (error) {
            res.json(error)
        }

    })

}

module.exports = auth