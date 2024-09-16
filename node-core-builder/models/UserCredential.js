'use strict';
module.exports = (sequelize, DataTypes) => {
  const UserCredential = sequelize.define('UserCredential', {
    UserCode:{
        type: DataTypes.STRING(30),
        allowNull: false,
        validate: {
            notEmpty:true
        }
    },
    UserLogin: {
      type:DataTypes.STRING(50),
      allowNull: false,
      validate: {
        notEmpty:true
      }
    },
    PasswordLogin: {
        type:DataTypes.TEXT,
        allowNull: true,
        validate: {
          notEmpty:false
        }
    },
    VerifyCode: {
      type:DataTypes.STRING(45),
      validate: {
          notEmpty:false
      }
    },
    FgVerified: {
      type:DataTypes.INTEGER(1),
      validate: {
          notEmpty:false
      }
    },
    FgActive: {
      type:DataTypes.CHAR(1),
      allowNull: true
    },
  }, {});
  UserCredential.associate = function(models) {  
    UserCredential.belongsTo(models.UserProfile, {foreignKey: 'UserCode', as: 'usr_profile'})
  };
  return UserCredential;
};
