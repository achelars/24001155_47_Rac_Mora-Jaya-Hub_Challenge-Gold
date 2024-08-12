const Order = require('../models/orderModel');
const OrderItem = require('../models/orderItemModel');

exports.createOrder = async (req, res) => {
  const { user_id, total_price, status, items } = req.body;

  try {
    const order = await Order.create({
      user_id,
      total_price,
      status,
    });

    const orderItems = items.map(item => ({
      order_id: order.order_id,
      product_id: item.product_id,
      quantity: item.quantity,
      customization_requests: item.customization_requests,
    }));

    await OrderItem.bulkCreate(orderItems);

    res.status(201).json(order);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getOrders = async (req, res) => {
  try {
    const orders = await Order.findAll();
    res.json(orders);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getOrder = async (req, res) => {
  try {
    const order = await Order.findByPk(req.params.orderId);
    if (order) {
      const orderItems = await OrderItem.findAll({ where: { order_id: order.order_id } });
      res.json({ order, items: orderItems });
    } else {
      res.status(404).json({ error: 'Order not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.updateOrder = async (req, res) => {
  const { status, total_price, items } = req.body;

  try {
    const order = await Order.findByPk(req.params.orderId);
    if (order) {
      order.status = status;
      order.total_price = total_price;
      await order.save();

      await OrderItem.destroy({ where: { order_id: order.order_id } });
      const orderItems = items.map(item => ({
        order_id: order.order_id,
        product_id: item.product_id,
        quantity: item.quantity,
        customization_requests: item.customization_requests,
      }));

      await OrderItem.bulkCreate(orderItems);

      res.json(order);
    } else {
      res.status(404).json({ error: 'Order not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.deleteOrder = async (req, res) => {
  try {
    const order = await Order.findByPk(req.params.orderId);
    if (order) {
      await order.destroy();
      res.json({ message: 'Order deleted successfully' });
    } else {
      res.status(404).json({ error: 'Order not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
