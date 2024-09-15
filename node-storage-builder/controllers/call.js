const axios = require("axios").default;

// controller call verifyToken
exports.verifyToken = (token) => new Promise((resolve, reject) => {
    
    axios.request({
        method: 'POST',
        url:'http://localhost:2000/auth/vtoken',
        maxRedirects: 0,
        data: {
            accessToken: token
        }
    }).then(res => {
        resolve(res.data)
    }).catch( e => {
        reject({
            status:'failed', 
            response:'contact backend administrator'
        })
    })

})

function convertToJson(strings) {
    let string = JSON.stringify(strings)
    return JSON.parse(string)
}


