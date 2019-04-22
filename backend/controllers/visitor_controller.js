const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

// const User = require("../models/user_model");
var sql = require('../db/sql_connection');

exports.exploreEvent = (req, res, next) => {
    console.log("visitor_exploreEvent: " + req.params)

}

exports.eventDetail = (req, res, next) => {
    console.log("user_getAll: " + req.params)
}

exports.exploreSite = (req, res, next) => {
    console.log("visitor_exploreSite: " + req.params.Username)

    const queryStr = "call Visitor_CreateViews(?)"
    sql.query(queryStr, [req.params.Username], function (err, rows, fields) {
      if (err) {
        console.log("ERROR - visitor_exploreSite: ", err);
        res.sendStatus(500)
        return
      }
  
      res.json(rows)
    });
  

}

exports.transitDetail = (req, res, next) => {
    console.log("user_getAll: " + req.params)
}

exports.siteDetail = (req, res, next) => {
    console.log("user_getAll: " + req.params)
}

exports.visitHistory = (req, res, next) => {
    console.log("user_getAll: " + req.params)
}