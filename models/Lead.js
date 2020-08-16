const mongoose = require('mongoose');
const validator = require('validator')

const LeadSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true
  },
  phoneno: {
    type: String
  },
  mobilizerid: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Mobilizer'
  },
  gender: {
    type: String
  },
  age: {
    type: Number
  },
  region: {
    type: String
  },
  interested: {
    type: Boolean,
    default: false
  },
  date: {
    type: Date,
    default: Date.now
  }
});

const Lead = mongoose.model('Lead', LeadSchema);

module.exports = Lead;
