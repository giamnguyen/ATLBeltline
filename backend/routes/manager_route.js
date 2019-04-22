const express = require("express");
const router = express.Router();

const ManagerController = require('../controllers/manager_controller');
const checkAuth = require('../middleware/check-auth');

router.get("/25/:Username", ManagerController.manageEvent);
router.get("/26/:Username", ManagerController.editEvent);
router.get("/27/:Username", ManagerController.createEvent);
router.get("/28/:Username", ManagerController.manageStaff);
router.get("/29/:Username", ManagerController.siteReport);
router.get("/30/:Username", ManagerController.dailyDetail);

module.exports = router;
