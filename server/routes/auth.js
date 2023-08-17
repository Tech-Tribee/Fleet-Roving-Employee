const express = require("express");
const bcryptjs = require("bcryptjs");
const User = require("../modules/user");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { userName, password } = req.body;

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      userName,
      password: hashedPassword,
    });

    user = await user.save();

    res.json(user);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = authRouter;
