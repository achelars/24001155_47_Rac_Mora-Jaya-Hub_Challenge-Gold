const express = require('express');
const router = express.Router();
const communicationController = require('../controllers/communicationController');

router.post('/', communicationController.createCommunication);
router.get('/', communicationController.getCommunications);
router.get('/:communicationId', communicationController.getCommunication);
router.put('/:communicationId', communicationController.updateCommunication);
router.delete('/:communicationId', communicationController.deleteCommunication);

module.exports = router;
