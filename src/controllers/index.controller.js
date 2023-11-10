const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    password: 'ClavePOST#1',
    database: 'floristeria',
    port: 5432,
});


const getArregloByCategory = async (req, res) => {
    const id = req.params.id;
    const consulta = `
    SELECT a.nombre AS "Nombre del Arreglo",
       a.SKU AS "SKU",
       c.nombre AS "Nombre de la Categoría",
       a.descripcion AS "Descripción",
       a.precio AS "Precio"
    FROM arreglo AS a
    INNER JOIN categoria AS c ON a.id_categoria = c.id_categoria
    where a.id_categoria = $1`

    try{
        const response = await pool.query(consulta, [id]);
        const arreglo = response.rows;

        console.log(arreglo);
        res.status(200).json(arreglo);
    }catch (e) {
      console.log(e);
      res.status(500).json({ error: 'Error en el servidor' });
    }
};

const getCategories = async (req, res) => {
    const consulta = `
    SELECT * FROM categoria`

    try{
        const response = await pool.query(consulta);
        const arreglo = response.rows;

        console.log(arreglo);
        res.status(200).json(arreglo);
    }catch (e) {
      console.log(e);
      res.status(500).json({ error: 'Error en el servidor' });
    }
}

const getArreglos = async (req, res) => {
    const consulta = `
    SELECT a.nombre AS "Nombre del Arreglo",
       a.SKU AS "SKU",
       c.nombre AS "Nombre de la Categoría",
       a.descripcion AS "Descripción",
       a.precio AS "Precio"
    FROM arreglo AS a
    INNER JOIN categoria AS c ON a.id_categoria = c.id_categoria`

    try{
        const response = await pool.query(consulta);
        const arreglo = response.rows;

        console.log(arreglo);
        res.status(200).json(arreglo);
    }catch (e) {
      console.log(e);
      res.status(500).json({ error: 'Error en el servidor' });
    }
}

const postOrden = async (req, res) => {
    const {fecha, id_cliente, subtotal, envio, total} = req.body;
    const consulta = `
    INSERT INTO orden (fecha, id_cliente, subtotal, envio, total)
    VALUES ($1, $2, $3, $4, $5)`

    try{
        const response = await pool.query(consulta, [fecha, id_cliente, subtotal, envio, total]);
        const arreglo = response.rows;

        console.log(arreglo);
        res.status(200).json({
            message: 'Orden agregada correctamente',
            body: {
                user: { fecha, id_cliente, subtotal, envio, total }
            }
        });
    }catch (e) {
      console.log(e);
      res.status(500).json({ error: 'Error en el servidor' });
    }
}

const postOrdenDetalle = async (req, res) => {
    const {id_orden, sku, cantidad, precio} = req.body;
    const consulta = `
    INSERT INTO ordendetalle (id_orden, sku, cantidad, precio)
    VALUES ($1, $2, $3, $4)`

    try{
        const response = await pool.query(consulta, [id_orden, sku, cantidad, precio]);
        const arreglo = response.rows;

        console.log(arreglo);
        res.status(200).json({
            message: 'Detalle de orden agregada correctamente',
            body: {
                user: { id_orden, sku, cantidad, precio }
            }
        });
    }catch (e) {
      console.log(e);
      res.status(500).json({ error: 'Error en el servidor' });
    }
}

const getClienteByID = async (req, res) => {
    const nit = req.params.id;
    const consulta = `
    SELECT id_cliente, nombre FROM cllientes WHERE nit = $1`

    try{
        const response = await pool.query(consulta, [nit]);
        const arreglo = response.rows;

        console.log(arreglo);
        res.status(200).json(arreglo);
    }catch (e) {
      console.log(e);
      res.status(500).json({ error: 'Error en el servidor' });
    }
}


const postCliente = async (req, res) => {
    const {nombre, nit, direccion, telefono, correo, cod_postal } = req.body;
    const consulta = `
    INSERT INTO cllientes (nombre, nit, direccion, telefono, correo, cod_postal)
    VALUES ($1, $2, $3, $4, $5, $6)`

    try{
        const response = await pool.query(consulta, [nombre, nit, direccion, telefono, correo, cod_postal]);
        const arreglo = response.rows;

        console.log(arreglo);
        res.status(200).json({
            message: 'Cliente agregado correctamente',
            body: {
                user: { nombre, nit }
            }
        });
    }catch (e) {
      console.log(e);
      res.status(500).json({ error: 'Error en el servidor' });
    }
}

const getLastOrder = async (req, res) => {
    const consulta = `
    select id_orden from orden order by id_orden desc limit 1`

    try{
        const response = await pool.query(consulta);
        const arreglo = response.rows;

        console.log(arreglo);
        res.status(200).json(arreglo);
    }catch (e) {
      console.log(e);
      res.status(500).json({ error: 'Error en el servidor' });
    }
}



module.exports = {
    getArregloByCategory,
    getCategories,
    getArreglos,
    postOrden,
    postOrdenDetalle,
    getClienteByID,
    postCliente,
    getLastOrder
};