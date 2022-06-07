const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const DeviceData = Schema({
  temperature: {
    type: Number,
    required: true,
  },
  time: {
      type: Date,
      default: Date.now,
  },
  
});

module.exports = mongoose.model("DeviceData", DeviceData);