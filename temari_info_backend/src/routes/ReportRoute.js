var express = require('express');
var router = express.Router();
const Report = require("../controllers/ReportController");

router.get('/', Report.getReports);
router.get('/:reportId', Report.getReport);
router.post('/', Report.sendReport);
router.delete('/:reportId', Report.sendWarning);
router.post('/DeleteAccout',Report.DeleteAccount)

module.exports = router;
