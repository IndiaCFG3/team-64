const express = require('express');
const app = express();

app.use(express.json())

require('dotenv').config();

// Connect to MongoDB
const dbConnect = require('./config/dbConnect');
dbConnect();

// Routes
app.use('/manager', require('./routes/manager'));
app.use('/mobilizer', require('./routes/mobilizer'));

// Starting server
const PORT = process.env.PORT || 3001;
app.listen(PORT, console.log(`Server started on port ${PORT}`));
