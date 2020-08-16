const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt')
const mobilizerAuth = require('../config/mobilizerAuth');

// Load Manager Model
const Mobilizer = require('../models/Mobilizer');
const Lead = require('../models/Lead');

router.post('/register', async(req, res) => {
    try{
        const mobilizer = new Mobilizer(req.body)
        const token = await mobilizer.generateAuthToken();
        mobilizer.password = await bcrypt.hash(mobilizer.password,8);
        await mobilizer.save()
        res.status(201).send({mobilizeremail: mobilizer.email,token})
    } catch(e) {
        console.log(e);
        res.status(400);
    }
})

router.post('/login', async(req, res) => {
    try{
        const user = await Mobilizer.findByCredintials(req.body.email, req.body.password)
        const token = await user.generateAuthToken()
        res.send({manageremail: user.email, token: token})
    } catch(e){
        console.log(e)
        res.status(400).send(e)
    }
})

router.get('/leads', mobilizerAuth, async(req, res) => {
    try{
        const leadList = await Lead.find({mobilizerid: req.user._id});
        res.send({leadList});
    } catch(e) {
        console.log(e);
        res.send({error: "some error occured"})
    }
})

router.post('/addLead', mobilizerAuth, async(req, res) => {
    try{
        const newLead = new Lead(req.body);
        newLead.save();
        res.send({save: "success", id: newLead._id})
    } catch(e){
        console.log(e);
        res.send({error: "some error occured"})
    }
})

router.get('/addinterested/:leadid', mobilizerAuth, async(req, res) => {
    try{
        await Lead.findByIdAndUpdate(req.params.leadid, {interested: true});
        res.send({success: true});
    } catch(e) {
        console.log(e);
        res.send({error: "some error occured"})
    }
})

module.exports = router;