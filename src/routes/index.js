const { Router } = require('express');
const router = Router();

const { getArregloByCategory, 
    getCategories, 
    getArreglos, postOrden, 
    postOrdenDetalle, 
    getClientebyBody, 
    postCliente,
    getLastOrder } = require('../controllers/index.controller');

//GET
router.get('/categorias', getCategories);
router.get('/arreglos', getArreglos);
router.get('/LastOrder', getLastOrder);

//GET BY ID
router.get('/arreglos/:id', getArregloByCategory);

//GET BY BODY
router.get('/cliente', getClientebyBody);

//POST
router.post('/orden', postOrden);
router.post('/ordenDetalle', postOrdenDetalle);
router.post('/cliente', postCliente);




module.exports = router;