const express = require('express');
const router = express.Router();
const feedbackController = require('../controllers/feedbackController');

router.post('/', feedbackController.createFeedback);
router.get('/', feedbackController.getFeedbacks);
router.get('/:feedbackId', feedbackController.getFeedback);
router.put('/:feedbackId', feedbackController.updateFeedback);
router.delete('/:feedbackId', feedbackController.deleteFeedback);

module.exports = router;
