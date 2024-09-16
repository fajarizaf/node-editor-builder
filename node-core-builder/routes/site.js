// middleware call
const { verifyToken } = require('../middleware/verifyToken')

// include controllers
const apicall = require("../controllers/call")
const DOMAIN = require("../controllers/cont-domain")
const SERVER = require("../controllers/cont-server")
const SITE = require("../controllers/cont-site")
const { NodeSSH } = require('node-ssh')

//include lib

const site = app => { 

    // step 01
    app.post('/site/create/subdomain' , verifyToken , async (req,res) => {

        try {
            
            var nDomain = await DOMAIN.create_subdomain(req)
            
            res.json({status: 'success', response: nDomain})
            
        } catch(error) {

            res.send({status: 'failed', response: error})

        }

    })

    // step 02
    app.post('/site/create/database' , verifyToken , async (req,res) => {

        try {

            // create db for domain
            createDB = await DOMAIN.create_database(req)
            
            res.json({status: 'success', response: createDB})
            
        } catch(error) {

            res.send({status: 'failed', response: error})

        }

    })

    // step 03
    app.post('/site/generate/ssl' , verifyToken , async (req,res) => {

        try {

            var nCMS = await DOMAIN.install_ssl_lets_encrypt(req , req.body.domain_name)
            
            res.json({status: 'success', response: nCMS})
            
        } catch(error) {

            res.send({status: 'failed', response: error})

        }

    })


    // step 04
    app.post('/site/install/cms' , verifyToken , async (req,res) => {

        try {
            
            var domain = await apicall.service('GET', req.server_host+'/api/v2/domains/'+req.body.domain_id, req)
            
            if(domain) {

                var site = await SITE.get_site(req.body.domain_id)
                var install = await SERVER.install_cms(req,domain,site)

                if(install.respond.status == 'success') {
                    res.json({status: 'success', response: 'install cms', result: install.respond.response})
                } else {
                    res.json({status: 'failed', response: 'install cms', result: install.respond.response})
                }

            } else {

                res.json({status: 'failed', response: 'domain id not found'})

            }

        } catch(error) {

            res.send({status: 'failed', response: error})

        }

    })


    // step 05
    app.post('/site/setup/cms' , verifyToken , async (req,res) => {

        try {
            
            var domain = await apicall.service('GET', 'https://nodebuilder.id:8443/api/v2/domains/'+req.body.domain_id, req)
            var setup = await SERVER.setup_cms(req,domain)

            if(setup.respond.status == 'success') {
                res.json({status: 'success', response: 'setup cms', result: setup.respond.response})
            } else {
                res.json({status: 'failed', response: 'setup cms', result: setup.respond.response})
            }

        } catch(error) {

            res.send({status: 'failed', response: error})

        }

    })



    
    

}

module.exports = site