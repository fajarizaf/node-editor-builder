'use strict';

module.exports = (sequelize, DataTypes) => {
  const Theme = sequelize.define('Theme', {
    theme_author:{
        type: DataTypes.INTEGER(11),
        allowNull: false
    },
    theme_category:{
        type: DataTypes.INTEGER(11),
        allowNull: false
    },
    theme_type:{
      type: DataTypes.STRING(10)
    },
    theme_editor:{
        type: DataTypes.STRING(100)
    },
    theme_name: {
      type:DataTypes.STRING(100)
    },
    theme_desc: {
      type:DataTypes.TEXT,
    },
    theme_cover: {
        type:DataTypes.STRING(100)
    },
    theme_link: {
        type:DataTypes.STRING(100)
    },
  }, {});
  Theme.associate = function(models) {
    Theme.belongsTo(models.Theme_author, {foreignKey: 'theme_author', as: 'author'})
    Theme.belongsTo(models.Theme_categori, {foreignKey: 'theme_category', as: 'category'})
  };
  return Theme;
};
