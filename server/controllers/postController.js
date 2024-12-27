const { Post, Images, } = require('../models/models');
const ApiError = require('../error/ApiError');
const uuid = require('uuid');
const path = require('path');
class PostController {

  async create(req, res, next) {
    try {
      const { user_id, title, description, totalPrice, rPered, rBez, rNas, rRas } = req.body;
      if (!user_id || !title || !description || !totalPrice || !rPered || !rBez || !rNas || !rRas || !req.files) {
        return next(ApiError.badRequest('Не заполнены необходимые поля'))
      }
      //const files = req.files.img_id;
      //console.log(file.name, ';fiel')

      /*   const fileArr = file.name.split('.');
        const fileName = uuid.v4() + '.' + fileArr[fileArr.length - 1]; */

      const newPost = await Post.create({ userId: user_id, title, description, price_total: totalPrice, r_pered: rPered, r_bez: rBez, r_nas: rNas, r_ras: rRas })
     
      if (req.files.img_id.length) {
        const files = req.files.img_id.map(file => {
          const fileArr = file.name.split('.');
          const fileName = uuid.v4() + '.' + fileArr[fileArr.length - 1];
          file.mv(path.resolve(__dirname, '..', 'static', 'posts_img', fileName));
          const imageForPost = Images.create({ postId: newPost.id, path: fileName });
        })
      } else {
        const file = req.files.img_id;
        const fileArr = file.name.split('.');
        const fileName = uuid.v4() + '.' + fileArr[fileArr.length - 1];
        file.mv(path.resolve(__dirname, '..', 'static', 'posts_img', fileName));
        const imageForPost = Images.create({ postId: newPost.id, path: fileName });

      }


      return res.json(newPost);
    } catch (e) {
      return next(ApiError.badRequest(e.message));
    }
  }

  async getAll(req, res, next) {
    const posts = await Post.findAll();
    const images = await Images.findAll();

    return res.json({ posts, images });
  }

  async getOne(req, res, next) {
    const { id } = req.params;
    const post = await Post.findOne({ where: { id: id } });
    const images = await Images.findAll({ where: { postId: id } });

    return res.json({ post, images });
  }

  async editBook(req, res, next) {
    const { title, description, author, categoryId, yearWritting, price, id } = req.body;
    if (!title || !description || !author || !categoryId || !yearWritting || !price || !id) {
      return next(ApiError.badRequest('Не заполнены необходимые поля'))
    }
    const newBook = await Books.update({ title, description, author, categoryId, yearWritting, price }, { where: { id } })
  }

}

module.exports = new PostController();