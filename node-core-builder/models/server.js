'use strict';
module.exports = (sequelize, DataTypes) => {
  const Server = sequelize.define('Server', {
    ip_address:{
      type: DataTypes.STRING(90)
    },
    ipv4:{
      type: DataTypes.STRING(90)
    },
    ipv6:{
      type: DataTypes.STRING(90)
    },
    host_name:{
        type: DataTypes.STRING(20),
        allowNull: true,
    },
    plesk_username: {
      type:DataTypes.STRING(30),
      allowNull: true
    },
    plesk_password: {
      type:DataTypes.STRING(30),
      allowNull: true
    },
    ssh_host: {
      type:DataTypes.STRING(30),
      allowNull: true
    },
    ssh_user: {
      type:DataTypes.STRING(30),
      allowNull: true
    },
    ssh_password: {
      type:DataTypes.STRING(30),
      allowNull: true
    },
    server_status: {
        type:DataTypes.STRING(30)
    }
  }, {});
  Server.associate = function(models) {

  };
  return Server;
};
