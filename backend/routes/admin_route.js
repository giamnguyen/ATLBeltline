const express = require("express");
const router = express.Router();

const AdminController = require('../controllers/admin_controller');
const checkAuth = require('../middleware/check-auth');

router.get("/18/:Username", AdminController.manageUser);
router.get("/19/:Username", AdminController.manageSite);
router.get("/20/:Username", AdminController.editSite);
router.get("/21/:Username", AdminController.createSite);
router.get("/22/:Username", AdminController.manageTransit);
router.get("/23/:Username", AdminController.editTransit);
router.get("/24/:Username", AdminController.createTransit);

module.exports = router;
