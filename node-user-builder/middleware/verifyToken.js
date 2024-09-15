// include controllers
const jwt = require('jsonwebtoken')

exports.verifyToken = async (req,res,next) => {
    try {

        const gettoken = req.headers.authorization.split(' ')[1]
        
        const token = await gettoken.replaceAll('"', '');

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
                    
                    next()

                }
            })
        }
    } catch (error) {
        res.json({respond : {status:'forbidden', response: 'No Authorization'}})
    }
}