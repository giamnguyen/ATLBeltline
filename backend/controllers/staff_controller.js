const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

// const User = require("../models/user_model");
var sql = require('../db/sql_connection');

exports.viewSchedule = (req, res, next) => {
    console.log("user_getAll: " + req.params)
}

exports.eventDetail = (req, res, next) => {
    console.log("user_getAll: " + req.params)
}
