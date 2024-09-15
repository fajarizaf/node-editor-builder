const swaggerAutogen = require('swagger-autogen')({openapi: '3.0.0'})

const options = {
    info: {
        version: '1.0.0',
        title: 'Storage API',
        description: "Pembuatan dokumentasi API ini berdasarkan standar spesifikasi OpenAPI 3.0. Dari sisi developer atau pengembang aplikasi, dengan di buatkannya dokumentasi ini diharapkan akan dapat mempermudah dalam proses pengembangan aplikasi portal admin mettaDC untuk saat ini atau kedepannya nanti.",  
        contact: {
            email: "Fajar Riza Fauzi",
        },  
    },
    host: 'http://202.145.0.38:4001',
    schemes:['http'],
    servers: [
        {
            url: 'http://202.145.0.38:4001',
            description: "( staging )"
        }
    ],
    components: {
        securitySchemes: {
            bearerAuth: {
                type: 'http',
                scheme: 'bearer',
                bearerFormat: 'JsonWebToken - accessToken value'
            },
        }
    },
    definitions: {}


}
  
const outputFile = './swagger_output.json'
const endpointsFiles = [
    './routes/upload.js',
    
]

swaggerAutogen(outputFile, endpointsFiles, options)