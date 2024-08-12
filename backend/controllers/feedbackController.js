const Feedback = require('../models/feedbackModel');

exports.createFeedback = async (req, res) => {
  const { user_id, order_id, rating, comment } = req.body;

  try {
    const feedback = await Feedback.create({
      user_id,
      order_id,
      rating,
      comment,
    });
    res.status(201).json(feedback);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getFeedbacks = async (req, res) => {
  try {
    const feedbacks = await Feedback.findAll();
    res.json(feedbacks);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getFeedback = async (req, res) => {
  try {
    const feedback = await Feedback.findByPk(req.params.feedbackId);
    if (feedback) {
      res.json(feedback);
    } else {
      res.status(404).json({ error: 'Feedback not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.updateFeedback = async (req, res) => {
  const { rating, comment } = req.body;

  try {
    const feedback = await Feedback.findByPk(req.params.feedbackId);
    if (feedback) {
      feedback.rating = rating;
      feedback.comment = comment;
      await feedback.save();
      res.json(feedback);
    } else {
      res.status(404).json({ error: 'Feedback not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.deleteFeedback = async (req, res) => {
  try {
    const feedback = await Feedback.findByPk(req.params.feedbackId);
    if (feedback) {
      await feedback.destroy();
      res.json({ message: 'Feedback deleted successfully' });
    } else {
      res.status(404).json({ error: 'Feedback not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
