const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const UserDevice = Schema({
  username: {
    type: String,
    required: true,
    unique: true,
  },  
  devicemodel: {
    type: String,
    required: true,
  },
  kwrating: {
    type: Number,
    required: true,
  },
  phaserating: {
    type: String,
    required: true,
  },
  powerrating: {
    type: Number,
    required: true,
  },
  
});

module.exports = mongoose.model("UserDevice", UserDevice);