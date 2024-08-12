const User = require('../models/userModel');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const nodemailer = require('nodemailer');

exports.createUser = async (req, res) => {
  try {
    const { username, password, email, contact_number, role } = req.body;
    const hashedPassword = await bcrypt.hash(password, 10);
    const user = await User.create({ username, password: hashedPassword, email, contact_number, role });
    res.status(201).json(user);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getUser = async (req, res) => {
  try {
    const user = await User.findByPk(req.params.userId);
    if (user) {
      res.json(user);
    } else {
      res.status(404).json({ error: 'User not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.updateUser = async (req, res) => {
  try {
    const { username, email, contact_number, role } = req.body;
    const user = await User.findByPk(req.params.userId);
    if (user) {
      user.username = username;
      user.email = email;
      user.contact_number = contact_number;
      user.role = role;
      await user.save();
      res.json(user);
    } else {
      res.status(404).json({ error: 'User not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.deleteUser = async (req, res) => {
  try {
    const user = await User.findByPk(req.params.userId);
    if (user) {
      await user.destroy();
      res.json({ message: 'User deleted successfully' });
    } else {
      res.status(404).json({ error: 'User not found' });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Login User
exports.loginUser = async (req, res) => {
  const { email, password } = req.body;

  try {
      const user = await User.findOne({ where: { email } });

      if (!user) {
          return res.status(404).json({ error: 'User not found' });
      }

      const isMatch = await bcrypt.compare(password, user.password);

      if (!isMatch) {
          return res.status(400).json({ error: 'Invalid credentials' });
      }

      const token = jwt.sign({ userId: user.user_id }, process.env.JWT_SECRET, { expiresIn: '1h' });

      res.json({ token, user: { id: user.user_id, username: user.username, email: user.email, role: user.role } });
  } catch (error) {
      res.status(500).json({ error: error.message });
  }
};

exports.forgotPassword = async (req, res) => {
  const { email } = req.body;

  try {
      const user = await User.findOne({ where: { email } });

      if (!user) {
          return res.status(404).json({ error: 'User not found' });
      }

      const resetToken = jwt.sign({ userId: user.user_id }, process.env.JWT_SECRET, { expiresIn: '1h' });

      const transporter = nodemailer.createTransport({
          service: 'gmail',
          auth: {
              user: process.env.EMAIL_USER,
              pass: process.env.EMAIL_PASS,
          },
      });

      const mailOptions = {
          from: process.env.EMAIL_USER,
          to: user.email,
          subject: 'Password Reset Request',
          text: `You requested a password reset. Click this link to reset your password: http://localhost:3000/reset-password?token=${resetToken}`,
      };

      await transporter.sendMail(mailOptions);

      res.json({ message: 'Password reset email sent successfully' });
  } catch (error) {
      res.status(500).json({ error: error.message });
  }
};
