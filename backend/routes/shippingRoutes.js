const express = require('express');
const router = express.Router();
const shippingController = require('../controllers/shippingController');

router.post('/', shippingController.createShipping);
router.get('/', shippingController.getShippings);
router.get('/:shippingId', shippingController.getShipping);
router.put('/:shippingId', shippingController.updateShipping);
router.delete('/:shippingId', shippingController.deleteShipping);

module.exports = router;
