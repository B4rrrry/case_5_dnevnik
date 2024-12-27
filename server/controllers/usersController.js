const { Users, Basket, Roles, BasketItems, Orders, OrderList } = require('../models/models');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const ApiError = require('../error/ApiError');

const generateJwt = (login, id, basketId) => {
  return jwt.sign({ login, id, basketId }, process.env.JWT_SECRET_KEY, { expiresIn: "1h" });
}

class UsersConroller {

  async create(req, res, next) {
    try {
      const { login, password, fName, sName, lName, roleId = 1 } = req.body; //1 - user 2 - ADMIN

      if (!login || !password || !fName || !sName || !lName) {
        return next(ApiError.badRequest("Не заполнены необходимые поля"));
      }

      const hashPassword = bcrypt.hashSync(password, 5);

      const user = await Users.create({ login, password: hashPassword, f_name: fName, s_name: sName, l_name: lName });

      const basket = await Basket.create({ userId: user.id });

      const token = generateJwt(login, user.id, basket.id);

      return res.json(token);
    } catch (e) {
      return next(ApiError.badRequest(e.message));
    }
  }

  async check(req, res) {
    const token = generateJwt(req.user.login, req.user.id)
    return res.json(token)

  }

  async login(req, res, next) {
    const { login, password } = req.body;

    if (!login || !password) {
      return next(ApiError.badRequest("Не заполнен логин или пароль"));
    }


    const user = await Users.findOne({ where: { login } });
    if (!user) {
      return next(ApiError.badRequest("Неверный логин"));
    }
    const comparePassword = bcrypt.compareSync(password, user.password);



    if (!comparePassword) {
      return next(ApiError.badRequest("Неправильный пароль"));
    }
    const token = generateJwt(user.login, user.id);

    return res.json(token);

  }


  async getAll(req, res, next) {

    const users = await Users.findAll();

    return res.json(users);
  }

  async getOne(req, res, next) {
    const { id } = req.params;

    if (!id) {
      return next(ApiError.badRequest("Не введен id пользователя"));
    }

    const user = await Users.findOne({ where: { id } });
    return res.json({ user });

  }

}

module.exports = new UsersConroller();