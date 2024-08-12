const Communication = require('../models/communicationModel');

exports.createCommunication = async (req, res) => {
  const { order_id, message } = req.body;

  try {
    const communication = await Communication.create({
      order_id,
      message,
    });
    res.status(201).json(communication);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getCommunications = async (req, res) => {
  try {
    const communications = await Communication.findAll();
    res.json(communications);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getCommunication = async (req, res) => {
  try {
    const communication = await Communication.findByPk(req.params.communicationId);
    if (communication) {
      res.json(communication);
    } else {
      res.status(404).json({ error: 'Communication record not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.updateCommunication = async (req, res) => {
  const { message } = req.body;

  try {
    const communication = await Communication.findByPk(req.params.communicationId);
    if (communication) {
      communication.message = message;
      await communication.save();
      res.json(communication);
    } else {
      res.status(404).json({ error: 'Communication record not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.deleteCommunication = async (req, res) => {
  try {
    const communication = await Communication.findByPk(req.params.communicationId);
    if (communication) {
      await communication.destroy();
      res.json({ message: 'Communication record deleted successfully' });
    } else {
      res.status(404).json({ error: 'Communication record not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
