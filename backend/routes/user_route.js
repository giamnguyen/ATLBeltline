const express = require("express");
const router = express.Router();

const UserController = require('../controllers/user_controller');
const checkAuth = require('../middleware/check-auth');

router.get("/", UserController.user_getAll);

router.post("/register", UserController.user_register);
router.post("/login", UserController.user_login);

router.get("/:Username", UserController.user_getUser);
router.put("/:Username", UserController.user_updateUser);
router.delete("/:Username", checkAuth, UserController.user_deleteUser);

module.exports = router;
