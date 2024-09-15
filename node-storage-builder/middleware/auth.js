// include controllers
const jwt = require('jsonwebtoken')

exports.auth = async (req,res,next) => {
   
    try {
        
        const token = await req.headers.authorization.split(' ')[1]

        if(token == '') {
            res.json({respond: {
                status: "failed", 
                response: "Authorization access token null"
            }})
        } else {
            jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, decoded) => {
                if(err) {
                    res.json({respond : {status:"forbidden", response: "Token not verified"}})
                } else {

                    req.sessionLogin = token
                    
                    req.UserCode = decoded.UserCode
                    req.UserType = decoded.UserType 
                    req.RoleCode = decoded.RoleCode
                    req.RoleType = decoded.RoleType
                    req.RoleName = decoded.RoleName
                    req.AccountType = decoded.AccountType
                    req.CompanyCode = decoded.CompanyCode
                   
                    const request = req.body
                    if(request.hasOwnProperty('filter')) {
                        req.where = request.filter
                    } else {
                        req.where = {}
                    }
                    
                    next()
                }
            })
        }
    } catch (error) {
        res.json({respond : {status:'forbidden', response: 'not Authorization'}})
    }
}