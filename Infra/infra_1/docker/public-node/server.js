const express = require('express');
const axios = require('axios');
const app = express();

const PRIVATE_EC2_IP = process.env.PRIVATE_EC2_IP || '127.0.0.1';

app.get('/', async (req, res) => {
  try {
    const response = await axios.get(`http://${PRIVATE_EC2_IP}:5000/data`);
    res.send(`<h1>Response:</h1><pre>${JSON.stringify(response.data)}</pre>`);
  } catch (err) {
    res.status(500).send("Error calling private service");
  }
});

app.listen(80, () => console.log('Listening on port 80'));
