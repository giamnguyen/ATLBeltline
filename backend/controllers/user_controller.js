const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

// const User = require("../models/user_model");
var sql = require('../db/sql_connection');


exports.user_getAll = (req, res, next) => {
  console.log("user_getAll: " + req.params)

  const queryStr = "select * from USER"
  sql.query(queryStr, function (err, rows, fields) {
    if (err) {
      console.log("ERROR - user_getAll: ", err);
      res.sendStatus(500)
      return
    }

    res.json(rows)
  });
};

exports.user_register = (req, res, next) => {
  console.log("user_register: " + req.body.Username)

  var queryStr = "select Username, Password from USER where Username=?"
  sql.query(queryStr, [req.body.Username], function (err, rows, fields) {
    if (err) {
      console.log("ERROR - user_register: ", err);
      return res.sendStatus(500)
    }

    if (rows.length >= 1) {
      return res.status(401).json({
        message: "User exists"
      });
    }

    bcrypt.hash(req.body.Password, 10, (err, hash) => {
      if (err) {
        return res.status(500).json({
          error: err
        });
      } else {
        queryStr = "insert into USER value (?,?,?,?,?)"
        sql.query(
          queryStr,
          [req.body.Username, hash, req.body.Firstname, req.body.Lastname, req.body.Status],
          function (err, rows, fields) {
            if (err) {
              console.log("ERROR - user_register: ", err);
              return res.sendStatus(500)
            }

            console.log("SUCCESS - user_register: User created - " +
              [req.body.Username, hash, req.body.Firstname, req.body.Lastname, req.body.Status]
            );
            res.status(201).json({
              message: "User created"
            });
          })
      }
    });
  });
};

exports.user_login = (req, res, next) => {
  console.log("user_login: " + req.body.Username)

  const queryStr = "select Username, Password from USER where Username=?"
  sql.query(queryStr, [req.body.Username], function (err, rows, fields) {
    if (err) {
      console.log("ERROR - user_getUser: ", err);
      return res.sendStatus(500)
    }

    if (rows.length < 1) {
      console.log("User does not exists")
      return res.status(401).json({
        message: "Auth failed"
      });
    }

    bcrypt.compare(req.body.Password, rows[0].Password, (err, result) => {
      if (err) {
        console.log("Password: " + rows[0].Password)
        return res.status(401).json({
          message: "Auth failed"
        });
      }

      if (result) {
        const token = jwt.sign(
          {
            Username: rows[0].Username,
            Password: rows[0].Password
          },
          process.env.JWT_KEY,
          {
            expiresIn: "1h"
          }
        );
        return res.status(200).json({
          message: "Auth successful",
          token: token
        });
      }

      res.status(401).json({
        message: "Auth failed"
      });
    });
  });
};

exports.user_getUser = (req, res, next) => {
  console.log("user_getUser: " + req.params.Username)

  const queryStr = "select * from USER where Username=?"
  sql.query(queryStr, [req.params.Username], function (err, rows, fields) {
    if (err) {
      console.log("ERROR - user_getUser: ", err);
      res.sendStatus(500)
      return
    }

    res.json(rows)
  });
};

exports.user_updateUser = (req, res, next) => {
  console.log("user_updateUser: " + req.params.Username)

  var queryStr = "select Username, Password from USER where Username=?"
  sql.query(queryStr, [req.params.Username], function (err, rows, fields) {
    console.log(rows)
    if (err) {
      console.log("ERROR - user_updateUser: ", err);
      return res.sendStatus(500)
    }

    if (rows.length < 1) {
      return res.status(401).json({
        message: "User does not exists"
      });
    }

    bcrypt.hash(req.body.Password, 10, (err, hash) => {
      if (err) {
        console.log("ERROR - user_updateUser: hash", err);
        return res.status(500).json({
          error: err
        });
      }

      queryStr = "update USER set ? where Username=?"
      sql.query(
        queryStr,
        [
          {
            Username: req.body.Username,
            Password: hash,
            Firstname: req.body.Firstname,
            Lastname: req.body.Lastname,
            Status: req.body.Status
          },
          req.params.Username
        ],
        function (err, rows, fields) {
          if (err) {
            console.log("ERROR - user_updateUser: ", err);
            return res.sendStatus(500)
          }

          console.log("SUCCESS - user_updateUser: User updated - " +
            [req.body.Username, hash, req.body.Firstname, req.body.Lastname, req.body.Status]
          );
          res.status(201).json({
            message: "User updated"
          });
        })
    });
  });
};

exports.user_deleteUser = (req, res, next) => {
  console.log("user_deleteUser: " + req.params.Username)

  const queryStr = "delete from USER where Username=?"
  sql.query(queryStr, [req.params.Username], function (err, rows, fields) {
    if (err) {
      console.log("ERROR - user_deleteUser: ", err);
      res.sendStatus(500)
      return
    }

    res.json(rows)
  });
};
