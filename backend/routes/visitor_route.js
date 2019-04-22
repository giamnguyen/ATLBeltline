const express = require("express");
const router = express.Router();

const VisitorController = require('../controllers/visitor_controller');
const checkAuth = require('../middleware/check-auth');

// router.get("/", VisitorController.getAll);

// router.post("/register", VisitorController.register);

router.get("/33/:Username", VisitorController.exploreEvent);
router.get("/34/:Username", VisitorController.eventDetail);
router.get("/35/:Username", VisitorController.exploreSite);
router.get("/36/:Username", VisitorController.transitDetail);
router.get("/37/:Username", VisitorController.siteDetail);
router.get("/38/:Username", VisitorController.visitHistory);
// router.put("/:Username", VisitorController.visitor_updateVisitor);
// router.delete("/:Username", checkAuth, VisitorController.user_deleteVisitor);

module.exports = router;
