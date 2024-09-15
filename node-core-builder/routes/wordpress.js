// middleware call
const { verifyToken } = require('../middleware/verifyToken')

// include controllers
const WORDPRESS = require("../controllers/cont-wordpress")

//include lib

const wordpress = app => {


    app.get('/wordpress' , verifyToken , async (req,res) => {

        try {
            var execute = await WORDPRESS.get(req)
            
            res.json({status: 'success', response: execute})
            
        } catch(error) {

            res.send({status: 'failed', response: error})

        }

    })


    app.get('/wordpress/list' , verifyToken , async (req,res) => {

        try {
            var execute = await WORDPRESS.list(req)
            
            res.json({status: 'success', response: execute})
            
        } catch(error) {

            res.send({status: 'failed', response: error.message})

        }

    })

}

module.exports = wordpress