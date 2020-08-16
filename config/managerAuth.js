const jwt = require('jsonwebtoken');
const Manager = require('../models/Manager');

const auth = async (req, res, next) => {
    try{
        const token = req.header('Authorization').replace('Bearer ','')
        const decoded = jwt.verify(token, 'moveFastandBreakThings')
        const user = await Manager.findOne({_id: decoded._id, 'tokens.token': token})

        if(!user){
            throw new Error()
        }
        req.token = token
        req.user = user
        next()
    } catch(e){
        console.log(e)
        res.status(401).send({error: 'Please authenticate'})
    }
}

module.exports = auth