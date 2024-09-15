

// models
const models = require('../models')
const Theme = models.Theme
const Author = models.Theme_author
const Categori = models.Theme_categori


exports.list = (req) => new Promise((resolve, reject) => {

    Theme.findAll({
        attributes:['theme_code','theme_name','theme_desc','theme_editor','theme_link','theme_cover'],
    })
    .then((respond) => {
        if(respond) {
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


exports.detail = (req, theme_code) => new Promise((resolve, reject) => {

    Theme.findOne({
        where: {
            theme_code:theme_code
        },
        attributes:['theme_code','theme_name','theme_desc','theme_editor','theme_link','theme_cover'],
        include: [
            {
                model: Author, as: 'author',
                required : true,
                attributes:['author_theme_name','author_slug'],
            },
            {
                model: Categori, as: 'category',
                required : true,
                attributes:['categori_theme_name'],
            }
        ]
    })
    .then((respond) => {
        if(respond) {
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