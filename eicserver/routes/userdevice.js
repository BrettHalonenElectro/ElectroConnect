const express = require("express");
const UserDevice = require("../models/userdevice.model");
const router = express.Router();
const middleware = require("../middleware");






router.route("/add").post(middleware.checkToken, (req, res) => {
    const userdevice = UserDevice({
      username: req.decoded.username,
      devicemodel: req.body.devicemodel,
      kwrating: req.body.kwrating,
      phaserating: req.body.phaserating,
      powerrating: req.body.powerrating,
    });
    userdevice
      .save()
      .then(() => {
        return res.json({ msg: "device successfully stored" });
      })
      .catch((err) => {
        return res.status(400).json({ err: err });
      });
  });



module.exports = router;






