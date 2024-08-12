const express = require('express');
const path = require('path');
const sequelize = require('./config/db');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());


app.use(express.static(path.join(__dirname, '../frontend/public')));


app.use('/api/users', require('./routes/userRoutes'));


app.use('/api/products', require('./routes/productRoutes'));


app.use('/api/orders', require('./routes/orderRoutes'));


app.use('/api/payments', require('./routes/paymentRoutes'));


app.use('/api/shipping', require('./routes/shippingRoutes'));


app.use('/api/communications', require('./routes/communicationRoutes'));


app.use('/api/feedback', require('./routes/feedbackRoutes'));

sequelize.sync().then(() => {
  app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
  });
}).catch(error => {
  console.error('Unable to connect to the database:', error);
});
