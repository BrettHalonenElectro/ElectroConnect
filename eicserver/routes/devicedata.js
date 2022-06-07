const express = require("express");
const DeviceData = require("../models/devicedata.model");
const router = express.Router();
let middleware = require("../middleware");

router.route("/getmostrecentdata").get((req, res) => {
    DeviceData.findOne().sort({ time: -1 }).limit(1).exec(function(err, res){
        console.log(res);
        return res;
        
    });
   
});


router.route("/getData").get((req, res) => {
    DeviceData.findOne().sort([['time', -1]]).exec((err, foundData) => {
        if (err) {
          console.log(err)
        } else {
          res.send(foundData)
        }
      })
});



router.route("/adddata").post((req, res) => {
    console.log("inside the register");
    const data = new DeviceData({
      temperature: req.body.temperature,
    //   timestamp: Datetime.Now,
    });
    data
      .save()
      .then(() => {
        console.log("user registered");
        res.status(200).json({ msg: "User Successfully Registered" });
      })
      .catch((err) => {
        res.status(403).json({ msg: err });
      });
});

module.exports = router;