const express = require('express')
require('dotenv').config()
const app = express()
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser')

const cors = require('cors')

const env = process.env.NODE_ENV || 'development';
const config = require(__dirname + '/config/config.json')[env];

app.use(cors({
  credentials:true, 
  origin:[process.env.url_frond_local_1,process.env.url_frond_local_2,process.env.url_frond_local_3,process.env.url_frond_staging_1, process.env.url_frond_staging_2, process.env.url_frond_prod_1,process.env.url_frond_prod_2]
}))

app.use(express.static('public'))

app.use(bodyParser.json())
app.use(cookieParser())


// public routes
require('./routes/upload')(app)

const PORT = process.env.PORTS || 3012;

  app.listen(PORT, () => {
    console.log('Server udah running sekarang')
  }).on('error', function(err){
      console.log('on error handler');
      console.log(err);
  });



