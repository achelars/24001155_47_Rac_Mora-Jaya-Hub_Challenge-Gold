const express = require('express');
const router = express.Router();
const paymentController = require('../controllers/paymentController');

router.post('/', paymentController.createPayment);
router.get('/', paymentController.getPayments);
router.get('/:paymentId', paymentController.getPayment);
router.put('/:paymentId', paymentController.updatePayment);
router.delete('/:paymentId', paymentController.deletePayment);

module.exports = router;
