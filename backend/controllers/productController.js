const Product = require('../models/productModel');

exports.createProduct = async (req, res) => {
  try {
    const { name, description, price, category, material, images, base_length } = req.body;
    const product = await Product.create({ name, description, price, category, material, images, base_length });
    res.status(201).json(product);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getProducts = async (req, res) => {
  try {
    const products = await Product.findAll();
    res.json(products);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getProduct = async (req, res) => {
  try {
    const product = await Product.findByPk(req.params.productId);
    if (product) {
      res.json(product);
    } else {
      res.status(404).json({ error: 'Product not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.updateProduct = async (req, res) => {
  try {
    const { name, description, price, category, material, images, base_length } = req.body;
    const product = await Product.findByPk(req.params.productId);
    if (product) {
      product.name = name;
      product.description = description;
      product.price = price;
      product.category = category;
      product.material = material;
      product.images = images;
      product.base_length = base_length;
      await product.save();
      res.json(product);
    } else {
      res.status(404).json({ error: 'Product not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.deleteProduct = async (req, res) => {
  try {
    const product = await Product.findByPk(req.params.productId);
    if (product) {
      await product.destroy();
      res.json({ message: 'Product deleted successfully' });
    } else {
      res.status(404).json({ error: 'Product not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
