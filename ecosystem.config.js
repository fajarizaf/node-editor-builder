module.exports = {
    apps : [
      {
        name   : "node-core-builder:3010",
        script : "./node-core-builder/server.js",
        watch  : ["./node-core-builder/server.js"],
        env: {
            "PORT": 3010,
            "PLESK_HOSTNAME": "https://rizabuilder.my.id:8443",
            "PLESK_USERNAME": "admin",
            "PLESK_PASSWORD": "Adayanghilang123@",
            "ACCESS_TOKEN_SECRET": "asdasd3324sddfas23asdsgghzxvsdfaswrwrrwrwer",
            "REFRESH_TOKEN_SECRET": "456wrwsdfrthdffghxcbxdfgeertetxcvcvsdfgeerrt",
            "CORS_LOCAL":"http://localhost:3000",
            "CORS_STAGING":"https://welos.vercel.app",
            "CORS_PROD":"https://penulis.vercel.app"
        }
      },
      {
        name   : "node-user-builder:3011",
        script : "./node-user-builder/server.js",
        watch  : ["./node-user-builder/server.js"],
        env: {
            "PORT": 3011,
            "ACCESS_TOKEN_SECRET": "asdasd3324sddfas23asdsgghzxvsdfaswrwrrwrwer",
            "REFRESH_TOKEN_SECRET": "456wrwsdfrthdffghxcbxdfgeertetxcvcvsdfgeerrt",
            "CORS_LOCAL":"http://localhost:3000",
            "CORS_STAGING":"https://welos.vercel.app",
            "CORS_PROD":"https://penulis.vercel.app"
        }
      },
      {
        name   : "node-storage-builder:3012",
        script : "./node-storage-builder/server.js",
        watch  : false,
        env: {
            "PORT": 3012,
            "ACCESS_TOKEN_SECRET": "asdasd3324sddfas23asdsgghzxvsdfaswrwrrwrwer",
            "REFRESH_TOKEN_SECRET": "456wrwsdfrthdffghxcbxdfgeertetxcvcvsdfgeerrt",
            "CORS_LOCAL":"http://localhost:3000",
            "CORS_STAGING":"https://welos.vercel.app",
            "CORS_PROD":"https://penulis.vercel.app"
        }
      }
    ]
  }
  