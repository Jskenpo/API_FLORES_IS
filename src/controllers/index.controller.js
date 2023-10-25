const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    password: 'ClavePOST#1',
    database: 'Proyecto_IS',
    port: 5432,
});


const getArreglo = async (req, res) => {
    const consulta = `
    SELECT a.Nombre, a.precio, a.id_categoria, c.categoria, a.foto
    FROM Arreglo a
    JOIN Categoria c ON a.id_categoria = c.id_categoria;`

    try{
        const response = await pool.query(consulta);
        const arreglo = response.rows;

        console.log(arreglo);
        res.status(200).json(arreglo);
    }catch (e) {
      console.log(e);
      res.status(500).json({ error: 'Error en el servidor' });
    }
};


module.exports = {
    getArreglo
};