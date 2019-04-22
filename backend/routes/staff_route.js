const express = require("express");
const router = express.Router();

const StaffController = require('../controllers/staff_controller');
const checkAuth = require('../middleware/check-auth');

router.get("/31/:Username", StaffController.viewSchedule);
router.get("/32/:Username", StaffController.eventDetail);

module.exports = router;
