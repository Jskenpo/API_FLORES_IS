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



module.exports = {
    getArregloByCategory,
    getCategories,
    getArreglos
};