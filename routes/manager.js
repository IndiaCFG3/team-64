const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt')
const managerAuth = require('../config/managerAuth');   

// Load Manager Model
const Mobilizer = require('../models/Mobilizer');
const Leads = require('../models/Lead');
const Manager = require('../models/Manager');

router.post('/register', async(req, res) => {
    try{
        let manager = new Manager(req.body)
        let token = await manager.generateAuthToken();
        manager.password = await bcrypt.hash(manager.password,8);
        await manager.save()
        res.status(201).send({manageremail: manager.email,token})
    } catch(e) {
        console.log(e);
        res.status(400);
    }
})

router.post('/login', async(req, res) => {
    try{
        const user = await Manager.findByCredintials(req.body.email, req.body.password)
        const token = await user.generateAuthToken()
        res.send({manageremail: user.email, token: token})
    } catch(e){
        console.log(e)
        res.status(400).send(e)
    }
})

// send the array of mobilizers under the manager
router.get('/mobilizerlist', managerAuth, async (req, res) => {
    try{
        let mobilezerList = await Mobilizer.find({managerid: req.user._id});
        res.send({mobilezerList});
    } catch(e){
        console.log(e);
        res.send({error: "some error occured"})
    }  
})

// send the details of the mobalizers
router.get('/mobilizerDetail/:id', managerAuth, async (req, res) => {
    
    try{
        let mobilizerDetails = await Mobilizer.findOne({_id: req.params.id});
        res.send({mobilizerDetails});
    } catch(e){
        console.log(e);
        res.send({error: "some error occured"})
    }  
    
})

// send the mobalizers in the given region
router.get('/mobilizerlist/regionbased/:region', managerAuth, async(req, res) => {
    try{
        let mobilezerListbyRegion = await Mobilizer.find({managerid: req.user._id, region: req.params.region});
        res.send({mobilezerListbyRegion});
    } catch(e){
        console.log(e);
        res.send({error: "some error occured"})
    }  
})

// assign mobalizers to leads in the given region
router.get('/assignMobilizer/:mobid/:region', managerAuth, async(req, res) => {
    try{
        await Leads.updateMany({region: req.params.region}, {mobilizerid: req.params.mobid});
        res.send({update: "sucess"});
    } catch(e){
        console.log(e);
        res.send({error: "some error occured"})
    }  
})

module.exports = router;


// progress percentage