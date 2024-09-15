// include model
const models = require('../models')
const UserProfile = models.UserProfile
const UserCredential = models.UserCredential
const Role = models.Role

// include lib
const md5 = require('md5')
var generator = require('generate-password');

// add new user
exports.register = (data, usercode) => new Promise((resolve, reject) => {
    
    UserProfile.create({
        UserCode: usercode,
        ContactName: data.name,
        Email: data.email,
    })
    .then((respond) => {
        
        const dataCredential = {
            UserCode: usercode,
            UserLogin: data.email
        }

        resolve(
            convertToJson({
                respond: {
                    status: 'success',
                    response: 'Register new account',
                    data: {
                        dataCredential
                    }
                }
            })
        )
            
    })
    .catch((e) => {
        resolve(
            convertToJson(
                {respond: {status: 'errors', response: e.message}}
            )
        )
    })

})


exports.register_credential = (register, data) => new Promise((resolve, reject) => {
    
    const verifyCode = this.generatedToken()
    
    UserCredential.create({
        UserCode: register.UserCode,
        UserLogin: register.UserLogin,
        PasswordLogin: md5(data.password),
        FgVerified: 1,
        FgActive: 'Y',
        VerifyCode: verifyCode
    })
    .then((respond) => {
        resolve(
            convertToJson({
                respond: {
                    status: 'success',
                    response: 'Create Customer Login',
                    vcode: verifyCode
                }
            })
        )
    })
    .catch((e) => {
        resolve(
            convertToJson(
                {respond: {status: 'error', response: e.message}}
            )
        )
    })

})


exports.cekVerifyCode = (vcode) => new Promise((resolve, reject) => {
    UserCredential.findOne({
        where: {
            VerifyCode: vcode
        }
    })
    .then((respond) => {
        if(respond != null) {
            resolve(
                convertToJson({
                    respond: {
                        status: 'success',
                        UserCode: respond.UserCode
                    } 
                })
            )
        } else {
            resolve(
                convertToJson({
                    respond: {
                        status: 'failed',
                        response: 'Kode Validasi perubahan password telah expired, silahkan request reset password kembali'
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


exports.verification = (data) => new Promise((resolve, reject) => {
    UserCredential.findAll({
        where: {
            UserCode: data.UserCode
        },
        attributes : [
            'VerifyCode','UserLogin'
        ],
        include: [
            { 
                model: UserProfile, as: 'usr_profile', 
                attributes : [
                    'ContactName','Email'
                ]
            }   
        ]
    })
    .then((respond) => {
        
        if(respond != '') {
            
            if(data.vcode == respond[0].VerifyCode) {

                resolve(
                    convertToJson({
                        respond: {
                            status: 'success',
                            response: 'Valid Kode Verifikasi',
                            name: respond[0].usr_profile.ContactName,
                            email: respond[0].usr_profile.Email,
                            userlogin: respond[0].UserLogin,
                        }
                    })
                )

            } else {

                resolve(
                    convertToJson({
                        respond: {
                            status: 'failed',
                            response: 'Invalid Kode Verifikasi'
                        }
                    })
                )

            }

        } else {

            resolve(
                convertToJson({
                    respond: {
                        status: 'failed',
                        response: 'Verifikasi kustomer invalid'
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


exports.removeVerifiedCode = (usercode) => new Promise((resolve, reject) => {
    
    UserCredential.update({VerifyCode: 0}, {
        where: {
            UserCode: usercode
        }
    })
    .then((respond) => {
        resolve(
            convertToJson({
                respond: {
                    status: 'success'
                } 
            })
        )  
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


exports.cekUserEmail = (email) => new Promise((resolve, reject) => {
   
    UserProfile.findOne( {
        where: {
            Email: email
        }
    })
    .then((respond) => {
        if(respond != null) {
            resolve(
                convertToJson({
                    respond: {
                        status: 'success',
                        UserCode:respond.UserCode,
                        ContactName:respond.ContactName,
                        Email:respond.Email
                    } 
                })
            )  
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


exports.forgotpass = (usercode) => new Promise((resolve, reject) => {

    const verifyCode = this.generatedToken()

    UserCredential.update({VerifyCode: verifyCode},{
        where: {
            UserCode:usercode
        }
    })
    .then((respond) => {
        if(respond != '') {
            resolve(
                convertToJson({
                    respond: {
                        status: 'success',
                        response: 'Email reset password telah kami kirimkan ke alamat email anda',
                        vcode: verifyCode
                    } 
                })
            )  
        } else {
            resolve(
                convertToJson({
                    respond: {
                        status: 'failed',
                        response: 'Generate Token'
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



exports.DetailUser = (UserCode) => new Promise((resolve, reject) => {
    UserProfile.findOne({
        where: {
            UserCode: UserCode
        },
        attributes : [
            'UserCode','ContactName','Email','CountryCode','Address','ZipCode','Phone','MobilePhone'
        ],
        include: [
            { 
                model: UserCredential, as: 'usr_credential',
                required : true,
                attributes : [
                    'FgActive'
                ]
            }
        ]         
    })
    .then((res) => {
        if(res != null) {
            resolve(
                convertToJson({
                    respond: {
                        status: 'success',
                        response : 'Data User Found',
                        data: res
                    }
                })
            )
        } else {
            resolve(
                convertToJson({
                    respond: {
                        status: 'failed',
                        response: 'Data User tidak ditemukan'
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


exports.getByEmail = (UserCode) => new Promise((resolve, reject) => {
    UserProfile.findOne({
        where: {
            UserCode: UserCode
        },
        attributes : [
            'UserCode','ContactName','Email','CountryCode','Address','ZipCode','Phone','MobilePhone'
        ],
        include: [
            { 
                model: UserCredential, as: 'usr_credential',
                required : true,
                attributes : [
                    'FgActive'
                ]
            }

        ]         
    })
    .then((res) => {
        if(res != null) {
            resolve(
                convertToJson({
                    respond: {
                        status: 'success',
                        response : 'Data User Found',
                        data: res
                    }
                })
            )
        } else {
            resolve(
                convertToJson({
                    respond: {
                        status: 'failed',
                        response: 'Data User tidak ditemukan'
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


exports.UpdateUser = (data,usercode) => new Promise((resolve, reject) => {
  
    UserProfile.update(
        {
            ContactName: data.ContactName,
            Phone: data.Phone,
        },
        {
        where: {
            UserCode: usercode
        }
    })
    .then((res) => {
        resolve(
            convertToJson({
                respond: {
                    status: 'success',
                    response: 'update user'
                } 
            })
        )  
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


exports.UpdateCredential = (data,usercode,status) => new Promise((resolve, reject) => {

    UserCredential.update(
        {
            FgActive: status
        },
        {
        where: {
            UserCode: usercode
        }
    })
    .then((res) => {
        resolve(
            convertToJson({
                respond: {
                    status: 'success',
                    response: 'update credential user berhasil dilakukan'
                } 
            })
        )  
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


exports.Generate_UserCode = () => new Promise((resolve, reject) => {
    
    UserProfile.findAndCountAll()
    .then((respond) => {
        
        if(respond != null) {

            var number = respond.count + 1
            var code = 'USR'+number

            resolve (
                convertToJson({
                    respond: {
                        status: 'success',
                        UserCode: code
                    } 
                })
            )

        } else {
            resolve (
                convertToJson({
                    respond: {
                        status: 'failed',
                        response: 'Generated UserCode',
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


exports.getPassword = (UserCode) => new Promise((resolve, reject) => {
    UserCredential.findOne({
        where: {
            UserCode: UserCode
        }
    })
    .then((respond) => {
        if(respond != null) {
            resolve(respond.PasswordLogin)
        } else {
            resolve(
                convertToJson({
                    respond: {
                        status: 'failed',
                        response: 'Kode Validasi perubahan password telah expired, silahkan request reset password kembali'
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


exports.GetCountryPrimaryAccount = (usercode) => {
    return UserProfile.findOne({
        where: {
            UserCode:usercode
        }
    }) 
}

exports.generatedToken = () => {
    var token = generator.generate({
        length: 25,
        numbers: true
    });
    return token
}

exports.generatedPass = () => {
    var password = generator.generate({
        length: 15,
        numbers: true
    });
    return password
}

function padLeadingZeros(num, size) {
    var s = num+"";
    while (s.length < size) s = "0" + s;
    return s;
}


function convertToJson(strings) {
    let string = JSON.stringify(strings)
    return JSON.parse(string)
}