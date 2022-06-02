const express = require("express");
const router = express.Router();
const Profile = require("../models/profile.model");
const middleware = require("../middleware");
const multer = require("multer");
const path = require("path");
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./uploads");
  },
  filename: (req, file, cb) => {
    cb(null, req.decoded.username + ".jpg");
  },
});

router.route("/add").post(middleware.checkToken, (req, res) => {
    const profile = Profile({
      username: req.decoded.username,
      name: req.body.name,
    });
    profile
      .save()
      .then(() => {
        return res.json({ msg: "profile successfully stored" });
      })
      .catch((err) => {
        return res.status(400).json({ err: err });
      });
  });


  router.route("/checkProfile").get(middleware.checkToken, (req, res) => {
    Profile.findOne({ username: req.decoded.username }, (err, result) => {
      if (err) return res.json({ err: err });
      else if (result == null) {
        return res.json({ status: false, username: req.decoded.username });
      } else {
        return res.json({ status: true, username: req.decoded.username });
      }
    });
  });

  router.route("/update").patch(middleware.checkToken, async (req, res) => {
    let profile = {};
    await Profile.findOne({ username: req.decoded.username }, (err, result) => {
      if (err) {
        profile = {};
      }
      if (result != null) {
        profile = result;
      }
    });
    Profile.findOneAndUpdate(
      { username: req.decoded.username },
      {
        $set: {
          name: req.body.name ? req.body.name : profile.name,
        },
      },
      { new: true },
      (err, result) => {
        if (err) return res.json({ err: err });
        if (result == null) return res.json({ data: [] });
        else return res.json({ data: result });
      }
    );
  });
  module.exports = router;