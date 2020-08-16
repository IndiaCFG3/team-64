const mongoose = require('mongoose');
const validator = require('validator')

const MoblizerSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true
  },
  email: {
    type: String,
    unique: true,
    required: true,
    trim: true,
    lowercase: true,
    validate(value){
      if(!validator.isEmail(value)) {
        throw new Error('Email is invalid')
      }
    }
  },
  phoneno: {
    type: String
  },
  password: {
    type: String,
    required: true,
    trim: true
  },
  managerid: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Manager'
  },
  date: {
    type: Date,
    default: Date.now
  }
});

const Mobilizer = mongoose.model('Mobilizer', MoblizerSchema);

module.exports = Mobilizer;
