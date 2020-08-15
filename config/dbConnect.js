const mongoose = require("mongoose");
// require("dotenv");

const dbConnect = () => {
    mongoose
        .connect(
            process.env.mongoURI,
            { useNewUrlParser: true ,useUnifiedTopology: true}
        )
        .then(() => console.log('MongoDB Connected'))
        .catch(err => console.log(err));
}

module.exports = dbConnect;