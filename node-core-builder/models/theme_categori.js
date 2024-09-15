'use strict';
module.exports = (sequelize, DataTypes) => {
  const Theme_categori = sequelize.define('Theme_categori', {
    categori_theme_name:{
        type: DataTypes.STRING(100)
    }
  }, {});
  Theme_categori.associate = function(models) {
    Theme_categori.hasOne(models.Theme,  {foreignKey: 'theme_category', as: 'theme_category'})
  };
  return Theme_categori;
};