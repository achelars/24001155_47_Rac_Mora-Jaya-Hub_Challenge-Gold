const midtransClient = require('midtrans-client');

const snap = new midtransClient.Snap({
  isProduction: false,
  serverKey: process.env.MIDTRANS_SERVER_KEY,
});

const createTransaction = async (orderId, grossAmount, customerDetails) => {
  try {
    const transaction = await snap.createTransaction({
      transaction_details: {
        order_id: orderId,
        gross_amount: grossAmount,
      },
      customer_details: customerDetails,
    });
    return transaction;
  } catch (error) {
    console.error(error);
    throw error;
  }
};

module.exports = createTransaction;
