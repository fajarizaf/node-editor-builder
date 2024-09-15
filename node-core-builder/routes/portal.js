// middleware call
const { verifyToken } = require('../middleware/verifyToken')

// include controllers
const apicall = require("../controllers/call")
const DOMAIN = require("../controllers/cont-domain")
const WORDPRESS  = require("../controllers/cont-wordpress")
const SITE = require("../controllers/cont-site")

//include lib

const portal = app => { 


    app.post('/portal/generate/subdomain' , verifyToken , async (req,res) => {

        try {
            
            var nDomain = await DOMAIN.create_subdomain(req)
            
            res.json({status: 'success', response: nDomain})
            
        } catch(error) {

            res.send({status: 'failed', response: error})

        }

    })


    app.post('/portal/generate/cms/' , verifyToken , async (req,res) => {

        try {

            var site = await DOMAIN.get_site(req.body.site_id)

            if(site.respond.status == 'success') {

              var nCMS = await WORDPRESS.install(req, site.respond.data.domain_name)

              res.json(nCMS)
              
            } else {

              res.json(site)

            } 
            
        } catch(error) {

            res.send({status: 'failed', response: error})

        }

    })


    app.post('/portal/generate/cms/progress' , verifyToken , async (req,res) => {

      try {

          var nCMS = await WORDPRESS.progress_install(req)
          
          res.json({status: 'success', response: nCMS})
          
      } catch(error) {

          res.send({status: 'failed', response: error})

      }

  })


    app.post('/portal/generate/ssl' , verifyToken , async (req,res) => {

        try {

            var nCMS = await DOMAIN.install_ssl_lets_encrypt(req , req.body.domain_name)
            
            res.json({status: 'success', response: nCMS})
            
        } catch(error) {

            res.send({status: 'failed', response: error})

        }

    })


    app.post('/portal/generate/theme/' , verifyToken , async (req,res) => {

        try {

            // get data site
            var site =  await SITE.detail(req, req.body.site_id)
            
            // get vhosts domain
            var domain = await apicall.service('GET', req.server_host+'/api/v2/domains/'+site.respond.data.domain_id, req)

            var data = {
                server_host : req.server_ssh_host,
                theme_id : req.body.theme_id,
                vhosts: domain.www_root,
                ftp_login: req.server_ssh_user,
                ftp_password: req.server_ssh_pass
            }

            console.log(data)

            // generate starter template
            var execute = await WORDPRESS.starter_templates_ssh(data)
            
            res.json({status: 'success', response: execute})
            
        } catch(error) {

            res.send({status: 'failed', response: error})

        }

    })

    app.post('/portal/theme/install' , verifyToken , async (req,res) => {

      try {

          // generate starter template
          
          var execute = await WORDPRESS.install_theme(req)
          
          res.json({status: 'success', response: execute})
          
      } catch(error) {

          res.send({status: 'failed', response: error})

      }

  })

    app.post('/portal/plugin/install' , verifyToken , async (req,res) => {

      try {

          var execute = await WORDPRESS.install_plugin(req)
          
          res.json({status: 'success', response: execute})
          
      } catch(error) {

          res.send({status: 'failed', response: error})

      }

    })


    app.post('/portal/plugin/activate' , verifyToken , async (req,res) => {

      try {

          var execute = await WORDPRESS.activated_plugin(req)
          
          res.json({status: 'success', response: execute})
          
      } catch(error) {

          res.send({status: 'failed', response: error})

      }

    })


    
    

}

module.exports = portal