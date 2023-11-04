const { Router } = require('express');
const router = Router();

const { getArregloByCategory, getCategories, getArreglos, postOrden, postOrdenDetalle } = require('../controllers/index.controller');

//GET
router.get('/categorias', getCategories);
router.get('/arreglos', getArreglos);

//GET BY ID
router.get('/arreglos/:id', getArregloByCategory);

//POST
router.post('/orden', postOrden);
router.post('/ordenDetalle', postOrdenDetalle);



module.exports = router;