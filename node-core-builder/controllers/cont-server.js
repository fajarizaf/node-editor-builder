const axios = require("axios").default;
const nodebase64 = require('nodejs-base64-converter')

// models
const models = require('../models');
const { NodeSSH } = require("node-ssh");
const Server = models.Server
const Site = models.Site

exports.ips = (req) => new Promise((resolve, reject) => {
    
    const headers = {
        'Content-Type': 'application/json',
         Accept: 'application/json',
         "Cache-Control": "no-cache",
        'Authorization': `Basic ${nodebase64.encode(req.plesk_username+':'+req.plesk_password)}`,
    }

    axios.request({
        method: 'GET',
        url: req.server_host+'/api/v2/server/ips',
        maxRedirects: 0,
        responseType:'json',
        headers: headers
    }).then(res => {
        resolve(res.data)
    }).catch( e => {
        reject({
            status:'failed', 
            response: e.message
        })
    })

})


exports.get_available_hosting = () => new Promise((resolve, reject) => {

    Server.findOne({
        where: {
            server_status: 'available'
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
            resolve(convertToJson({respond:{status:'failed',response: 'server hosting not found'}}))
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


exports.install_cms = (req,domain,site) => new Promise((resolve, reject) => {

    const client = require('scp2')

    client.scp(require('path').resolve('./')+'/cms/latest.zip', {

        host: req.base_domain_name,
        username: req.server_ssh_user,
        password: req.server_ssh_pass,
        path: domain.www_root

    }, function(err) {

            if (err) {

                reject(
                    convertToJson(
                        {respond: {status: 'failed',response:  err}}
                    )
                )

            } else {

                const ssh = new NodeSSH()
    
                ssh.connect({
                    host: req.base_domain_name,
                    username: req.server_ssh_user,
                    password: req.server_ssh_pass,
                })
                .then(function() {

                    // Command
                    ssh.execCommand('unzip latest.zip', { cwd:domain.www_root }).then(function(result) {

                        if(result.stderr == '') {
                                resolve(
                                    convertToJson(
                                        {respond: {status: 'success',response: result.stdout}}
                                    )
                                )
                        } else {
                                reject(
                                    convertToJson(
                                        {respond: {status: 'failed',response:  result.stderr}}
                                    )
                                )
                        }

                    })

                }) 

            }
            
            
    });

})



exports.setup_cms = (req,domain) => new Promise((resolve, reject) => {

    const ssh = new NodeSSH()
        
    ssh.connect({
        host: req.base_domain_name,
        username: req.server_ssh_user,
        password: req.server_ssh_pass,
    })
    .then(function() {

        // Command
        ssh.execCommand('/opt/plesk/php/7.4/bin/php cli.php install module=index host=127.0.0.1 user=fajarizaf password=Adayanghilang123@ database='+req.body.db_name+' admin[email]='+req.body.email_login+' admin[password]='+req.body.pass_login+'', { cwd:domain.www_root }).then(function(result) {

            if(result.stderr == '') {
                resolve(
                    convertToJson(
                        {respond: {status: 'success',response: result.stdout}}
                    )
                )
            } else {
                reject(
                    convertToJson(
                        {respond: {status: 'failed',response:  result.stderr}}
                    )
                )
            }

        })

        res.send({status: 'success', response: 'install cms'})

    }) 

})





function convertToJson(strings) {
    let string = JSON.stringify(strings)
    return JSON.parse(string)
}
