//const request  = require('express');
var express = require('express');
var router = express.Router();
const deptController = require("../controllers/DepartmentController") 

router.get('/',deptController.getAll);
router.get('/:dept_id',deptController.getById);
router.post('/',deptController.postt);
router.delete("/:dept_id",deptController.deleteById);
router.patch("/:dept_id",deptController.updateById);





module.exports = router;