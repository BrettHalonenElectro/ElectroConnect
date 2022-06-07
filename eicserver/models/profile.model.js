const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Profile = Schema(
  {
    username: {
      type: String,
      required: true,
      unique: true,
    },
    
  },
  
);

module.exports = mongoose.model("Profile", Profile);