const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Shipping = sequelize.define('Shipping', {
  shipping_id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  order_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  address: {
    type: DataTypes.TEXT,
    allowNull: false,
  },
  courier: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  tracking_number: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  status: {
    type: DataTypes.STRING,
    allowNull: false,
    validate: {
      isIn: [['pending', 'shipped', 'delivered']],
    },
  },
  created_at: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
}, {
  timestamps: false,
});

module.exports = Shipping;
