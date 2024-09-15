const express = require('express')
require('dotenv').config()
const app = express()
const bodyParser = require('body-parser')
const cookieParser = require('cookie-parser')
const sequelize = require('./models/').sequelize
const cors = require('cors')

app.use(cors({credentials:true, origin:[process.env.CORS_LOCAL,process.env.CORS_STAGING,process.env.CORS_PROD]}))

app.use(bodyParser.json())
app.use(cookieParser())
app.set("trust proxy", true)

require('./routes/server')(app)
require('./routes/portal')(app)
require('./routes/domain')(app)
require('./routes/site')(app)
require('./routes/theme')(app)
require('./routes/customer')(app)
require('./routes/wordpress')(app)
    

sequelize.sync().then(function(){
    const PORT = process.env.PORT || 3010;
    app.listen(PORT, () => {
      console.log('Server udah running sekarang')
    })
}, function(err){
    // catch error here
    console.log(err);
});
