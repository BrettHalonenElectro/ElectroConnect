const express = require("express");
const mongoose = require("mongoose");
const port = process.env.PORT || 4000;
const app = express();

//const URI = "mongodb+srv://BrettHalo:<password>@cluster0.zrezzra.mongodb.net/?retryWrites=true&w=majority"

mongoose.connect(
  "mongodb+srv://BrettHalo:BrettHalo@cluster0.zrezzra.mongodb.net/?retryWrites=true&w=majority",
  {
    //useNewUrlParser: true,
    //useCreateIndex: true,
    //useUnifiedTopology: true,
  }
);

const connection = mongoose.connection;
connection.once("open", () => {
  console.log("MongoDb connected");
});

//middleware
app.use("/uploads", express.static("uploads"));
app.use(express.json());
const userRoute = require("./routes/user");
app.use("/user", userRoute);

const devicedataRoute = require("./routes/devicedata");
app.use("/devicedata", devicedataRoute);

const userdeviceRoute = require("./routes/userdevice");
app.use("/userdevice", userdeviceRoute);

const profileRoute = require("./routes/profile");
app.use("/profile", profileRoute);

data = {
  msg: "Welcome on DevStack Blog App development YouTube video series",
  info: "This is a root endpoint",
  Working: "Documentations of other endpoints will be release soon :)",
  request:
    "Hey if you did'nt subscribed my YouTube channle please subscribe it",
};

app.route("/").get((req, res) => res.json(data));

app.listen(port, "0.0.0.0", () =>
  console.log(`welcome your listinnig at port ${port}`)
);
