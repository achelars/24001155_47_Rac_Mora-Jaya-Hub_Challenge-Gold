const Payment = require('../models/paymentModel');

exports.createPayment = async (req, res) => {
  const { order_id, status, proof_of_payment, transaction_id } = req.body;

  try {
    const payment = await Payment.create({
      order_id,
      status,
      proof_of_payment,
      transaction_id,
    });
    res.status(201).json(payment);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getPayments = async (req, res) => {
  try {
    const payments = await Payment.findAll();
    res.json(payments);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getPayment = async (req, res) => {
  try {
    const payment = await Payment.findByPk(req.params.paymentId);
    if (payment) {
      res.json(payment);
    } else {
      res.status(404).json({ error: 'Payment not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.updatePayment = async (req, res) => {
  const { status, proof_of_payment, transaction_id } = req.body;

  try {
    const payment = await Payment.findByPk(req.params.paymentId);
    if (payment) {
      payment.status = status;
      payment.proof_of_payment = proof_of_payment;
      payment.transaction_id = transaction_id;
      await payment.save();
      res.json(payment);
    } else {
      res.status(404).json({ error: 'Payment not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.deletePayment = async (req, res) => {
  try {
    const payment = await Payment.findByPk(req.params.paymentId);
    if (payment) {
      await payment.destroy();
      res.json({ message: 'Payment deleted successfully' });
    } else {
      res.status(404).json({ error: 'Payment not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
