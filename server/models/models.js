const sequelize = require('../db');
const { DataTypes } = require('sequelize');

const Users = sequelize.define(
  "users",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    login: { type: DataTypes.STRING, allowNull: false, unique: true },
    password: { type: DataTypes.STRING, allowNull: false },
    f_name: { type: DataTypes.STRING, allowNull: false },
    s_name: { type: DataTypes.STRING, allowNull: false },
    l_name: { type: DataTypes.STRING, allowNull: false },
    //role_id
  }
);

const Post = sequelize.define(
  "posts",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    //user_id
    title: { type: DataTypes.STRING, allowNull: false },
    description: { type: DataTypes.STRING, allowNull: false },
    price_total: { type: DataTypes.STRING, allowNull: false },
    r_pered: { type: DataTypes.STRING, allowNull: false },
    r_bez: { type: DataTypes.STRING, allowNull: false },
    r_nas: { type: DataTypes.STRING, allowNull: false },
    r_ras: { type: DataTypes.STRING, allowNull: false },
    //img_id
  }
)
const Images = sequelize.define(
  "images",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    path: { type: DataTypes.STRING, allowNull: false },
    //post_id
  }
)



Users.hasMany(Post);
Post.belongsTo(Users);

Post.hasOne(Images);
Images.belongsTo(Post);


module.exports = {
  Users,
  Post,
  Images
}