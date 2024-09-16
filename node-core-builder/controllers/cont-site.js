const axios = require("axios").default;
const nodebase64 = require('nodejs-base64-converter')

// models
const models = require('../models');
const Site = models.Site


exports.get_site = (domain_id) => new Promise((resolve, reject) => {

    Site.findOne({
        where: {
            domain_id: domain_id
        }
    })
    .then((respond) => {
        if(respond != '') {
            resolve(convertToJson({
                respond: {
                    status: 'success',
                    data: respond
                }
            }))
        } else {
            resolve(convertToJson({respond:{status:'failed',response: 'site not found'}}))
        }

    })
    .catch((e) => {
        reject(
            convertToJson(
                {respond: {status: 'error',response: e.message}}
            )
        )
    })

})

function convertToJson(strings) {
    let string = JSON.stringify(strings)
    return JSON.parse(string)
}
