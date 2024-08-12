const Shipping = require('../models/shippingModel');

exports.createShipping = async (req, res) => {
  const { order_id, address, courier, tracking_number, status } = req.body;

  try {
    const shipping = await Shipping.create({
      order_id,
      address,
      courier,
      tracking_number,
      status,
    });
    res.status(201).json(shipping);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getShippings = async (req, res) => {
  try {
    const shippings = await Shipping.findAll();
    res.json(shippings);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getShipping = async (req, res) => {
  try {
    const shipping = await Shipping.findByPk(req.params.shippingId);
    if (shipping) {
      res.json(shipping);
    } else {
      res.status(404).json({ error: 'Shipping record not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.updateShipping = async (req, res) => {
  const { address, courier, tracking_number, status } = req.body;

  try {
    const shipping = await Shipping.findByPk(req.params.shippingId);
    if (shipping) {
      shipping.address = address;
      shipping.courier = courier;
      shipping.tracking_number = tracking_number;
      shipping.status = status;
      await shipping.save();
      res.json(shipping);
    } else {
      res.status(404).json({ error: 'Shipping record not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.deleteShipping = async (req, res) => {
  try {
    const shipping = await Shipping.findByPk(req.params.shippingId);
    if (shipping) {
      await shipping.destroy();
      res.json({ message: 'Shipping record deleted successfully' });
    } else {
      res.status(404).json({ error: 'Shipping record not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
