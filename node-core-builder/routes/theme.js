

// include controllers
const SITE = require("../controllers/cont-site")
const THEME = require("../controllers/cont-theme")
//include lib

const theme = app => {

    app.get('/theme' , async (req,res) => {

        try {

            var content = await THEME.list(req)
            
            res.json(content)
            
        } catch(error) {

            res.send({status: 'failed', response: error})

        }

    })

    app.get('/theme/detail' , async (req,res) => {

        try {
            
            var theme_code = req.query.theme_code
            var content = await THEME.detail(req, theme_code)
            
            res.json(content)
            
        } catch(error) {

            res.send({status: 'failed', response: error.message})

        }

    })
    
}

module.exports = theme