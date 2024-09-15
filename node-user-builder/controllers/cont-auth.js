//include model
const models = require('../models')
const UserCredential = models.UserCredential
const UserProfile = models.UserProfile


//include lib
var md5 = require('md5')
var jwt = require('jsonwebtoken')


// controller login with email
exports.Login = (data) => new Promise((resolve, reject) => {

    UserCredential.findOne({
        where: {
            UserLogin : data.email
        },
        include: [
            { 
                model: UserProfile, as: 'usr_profile', 
                attributes : [
                    'ContactName', 
                ]
            }
        ]
    })
    .then((respond) => {

        console.log(respond)
        
        if(respond != '') {
            
            if(md5(data.password) == respond.PasswordLogin) {
                const dataUser = respond.usr_profile


                if(respond.FgActive == 'Y') {

                    const UserCode    =  respond.UserCode
                    const UserName    =  dataUser.ContactName

                    // generate access token
                    const accessToken = jwt.sign({UserCode,UserName}, process.env.ACCESS_TOKEN_SECRET, {
                        expiresIn: '24h'
                    })

                    resolve(
                        convertToJson({
                            respond: { 
                                status: 'success',
                                UserCode: UserCode,
                                UserName: UserName,
                                accessToken: accessToken
                            }
                        })
                    )

                } else {
                    resolve(
                        convertToJson({
                            respond: {
                                status: 'failed',
                                response: 'Akun telah di nonaktifkan'
                            }
                        })
                    )
                }

            } else {

                resolve(
                    convertToJson({
                        respond: {
                            status: 'failed',
                            response: 'Password yang anda masukan salah'
                        } 
                    })
                )

            }

        } else {

            resolve(
                convertToJson({
                    respond: {
                        status: 'failed',
                        response: 'Email Tidak Terdaftar'
                    } 
                })
            )

        }
    })
    .catch((e) => {

        resolve(
            convertToJson({
                respond: {
                    status: 'error',
                    response: e.message
                }
            })
        )

    })
})


exports.changepass = (data, usercode) => new Promise((resolve, reject) => {
   
    const newpass = md5(data.new_password)

    UserCredential.update({PasswordLogin: newpass}, {
        where: {
            UserCode: usercode
        }
    })
    .then((respond) => {
        if(respond != '') {
            resolve(
                convertToJson({
                    respond: {
                        status: 'success',
                        response: 'Perubahan password telah berhasil dilakukan'
                    } 
                })
            )  
        } else {
            resolve(
                convertToJson({
                    respond: {
                        status: 'failed',
                        response: 'Perubahan password gagal dilakukan'
                    } 
                })
            )  
        }
    })
    .catch((e) => {
        resolve(
            convertToJson({
                respond: {
                    status: 'error',
                    response: e
                }
            })
        )
    })

})



exports.updateToken = (UserCode,rtoken) => new Promise((resolve, reject) => {
   
    UserCredential.update({rtoken:rtoken}, {
        where: {
            UserCode: UserCode
        }
    })
    .then((respond) => {
        if(respond != '') {
            resolve(
                convertToJson({
                    respond: {
                        status: 'success',
                        response: 'Update Token Berhasil Dilakukan'
                    } 
                })
            )  
        } else {
            resolve(
                convertToJson({
                    respond: {
                        status: 'failed',
                        response: 'Update Token Gagal Dilakukan'
                    } 
                })
            )  
        }
    })
    .catch((e) => {
        resolve(
            convertToJson({
                respond: {
                    status: 'error',
                    response: e
                }
            })
        )
    })

})

function convertToJson(strings) {
    let string = JSON.stringify(strings)
    return JSON.parse(string)
}