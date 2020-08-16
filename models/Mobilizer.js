const mongoose = require('mongoose');
const validator = require('validator')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

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
  rank: {
    type: Number
  },
  region: {
    type: String
  },
  successpercentage: {
    type: Number
  },
  tokens: [{token: {
    type: String,
    required: true
  }}],

  date: {
    type: Date,
    default: Date.now
  }
});

MoblizerSchema.methods.generateAuthToken = async function(){
  const user = this
  const token = jwt.sign({_id: user._id.toString()}, 'moveFastandBreakThings')
  user.tokens = user.tokens.concat({token: token})
  await user.save()
  return token
}

MoblizerSchema.statics.findByCredintials = async (email, password) => {
  const user = await Mobilizer.findOne({ email: email})
  if(!user){
      throw new Error('Unable to login')
  }
  
  const isMatch = await bcrypt.compare(password, user.password)

  if(!isMatch){
      throw new Error('unable to login')
  }

    return user
}


const Mobilizer = mongoose.model('Mobilizer', MoblizerSchema);

module.exports = Mobilizer;
