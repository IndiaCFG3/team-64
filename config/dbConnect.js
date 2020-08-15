const mongoose = require("mongoose");

const dbConnect = () => {
    mongoose
        .connect(
            process.env.mongoURI,{
                useNewUrlParser: true,
                useUnifiedTopology: true,
                useFindAndModify: false,
                useCreateIndex: true
            }
        )
        .then(() => console.log('MongoDB Connected'))
        .catch(err => console.log(err));
}

module.exports = dbConnect;