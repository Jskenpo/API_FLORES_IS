const { Router } = require('express');
const router = Router();

const { getArregloByCategory, getCategories, getArreglos } = require('../controllers/index.controller');

//GET
router.get('/categorias', getCategories);
router.get('/arreglos', getArreglos);

//GET BY ID
router.get('/arreglos/:id', getArregloByCategory);


module.exports = router;