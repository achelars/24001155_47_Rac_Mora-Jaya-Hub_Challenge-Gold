const axios = require('axios');

const rajaOngkirAPI = axios.create({
  baseURL: 'https://api.rajaongkir.com/starter',
  headers: { 'key': process.env.RAJAONGKIR_API_KEY },
});

const calculateShippingCost = async (origin, destination, weight, courier) => {
  try {
    const response = await rajaOngkirAPI.post('/cost', {
      origin,
      destination,
      weight,
      courier,
    });
    return response.data.rajaongkir.results;
  } catch (error) {
    console.error(error);
    throw error;
  }
};

module.exports = calculateShippingCost;
