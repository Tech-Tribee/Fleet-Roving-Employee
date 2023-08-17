const express = require("express")
const mongoose = require("mongoose")
const bodyParser = require("body-parser")
require("dotenv").config();

const authRouter = require("./routes/auth")

const PORT = 3001;
const app = express();
const DB = process.env.DB;

 
app.use(bodyParser.json());
app.use(authRouter);


mongoose.connect(DB).then(() => {
    console.log("Connection is successful");
}).catch(e => {
    console.log(e);
})

app.listen(PORT, "0.0.0.0", () => {
    console.log(`server is running on port => ${PORT}`);
})