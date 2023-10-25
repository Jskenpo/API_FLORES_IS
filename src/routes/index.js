const { Router } = require('express');
const router = Router();

const { getArreglo } = require('../controllers/index.controller');

//GET 
router.get('/arreglos', getArreglo);


module.exports = router;