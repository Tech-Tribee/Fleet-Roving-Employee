const mongoose = require("mongoose");

const userSchema = mongoose.Schema(
  {
    userName: {
      type: String,
      required: true,
      trim: true,
    },
    password: {
      required: true,
      type: String,
      // validate: {
      //     validator: (value) => {
      //         const re = /^[a-zA-Z]\w{8,15}$/;
      //         return value.match(re);
      //     },
      //     message: 'Please enter a valid password',
      // },
    },
    address: {
      type: String,
      default: "",
    },
    company: {
      type: String,
      default: "",
    }
  },
  { timestamps: true }
);

const User = mongoose.model("User", userSchema);

module.exports = User;