const db=require('../config/config');
const bycrypt = require('bcryptjs');

const Producto={};

Producto.create = (producto, result) =>{
    const sql = `
    INSERT INTO producto(
        nombre_prod,
        detalle_prod,
        precio_prod,
        stock_prod,
        img_prod,
        img_prod2, 
        id_categoria, 
        id_provee
        )
    VALUES (?,?,?,?,?,?,?,?)
        `;

    db.query(
        sql,
        [
            producto.nombre_prod,
            producto.detalle_prod,
            producto.precio_prod,
            producto.stock_prod,
            producto.img_prod,
            producto.img_prod2,
            producto.id_categoria,
            producto.id_provee
        ],
        (err, res)=>{
            if(err){
                console.log('Error:',err);
                result(err, null);
            }
            else{
                console.log('Id del nuevo producto: ', res.insertId);
                result(null, res.insertId);
            }
        }
    )
},

Producto.update = (producto, result) =>{
    const sql = `
    UPDATE producto
    SET
        nombre_prod = ?,
        detalle_prod = ?,
        precio_prod = ?,
        stock_prod = ?,
        img_prod = ?,
        img_prod2 = ?, 
        id_categoria = ?, 
        id_provee = ?
    WHERE
    id_prod=?
       
        `;

    db.query(
        sql,
        [
            producto.nombre_prod,
            producto.detalle_prod,
            producto.precio_prod,
            producto.stock_prod,
            producto.img_prod,
            producto.img_prod2,
            producto.id_categoria,
            producto.id_provee,
            producto.id_prod
        ],
        (err, res)=>{
            if(err){
                console.log('Error:',err);
                result(err, null);
            }
            else{
                console.log('Id del producto actualizado: ', producto.id_prod);
                result(null, producto.id_prod);
            }
        }
    )
}

Producto.getAll = (result) => {
    const sql =`
    SELECT 
    CONVERT(id_prod, char) AS id_prod,
    nombre_prod, 
    detalle_prod, 
    precio_prod, 
    stock_prod, 
    img_prod, 
    img_prod2, 
    CONVERT(id_categoria, char) As id_categoria, 
    CONVERT(id_provee, char) AS id_provee
         FROM producto
    ORDER BY
        nombre_prod
    `;
    db.query(
     sql,
     (err, data)=>{
         if(err){
             console.log('Error:',err);
             result(err, null);
         }
         else{
             console.log('Productos', data);
             result(null, data);
         }
     }
 
    )
 
}

Producto.findbyCategory = (id_categoria, result) => {
    const sql = `
    SELECT 
        CONVERT(P.id_prod, char) AS id_prod,
        P.nombre_prod, 
        P.detalle_prod, 
        P.precio_prod, 
        P.stock_prod, 
        P.img_prod, 
        P.img_prod2, 
        CONVERT(P.id_categoria, char) AS id_categoria
    FROM    
        producto as P
    WHERE 
        P.id_categoria = ?
    `;
    db.query(
        sql,
        [id_categoria],
        (err, res) => {
            if(err){
                console.log('Error:',err);
                result(err, null);
            }
            else{
                console.log('Productos', res);
                result(null, res);
            }
        }
    );
}

Producto.findByNameAndCategory = (nombre_prod, id_categoria, result) => {
    const sql = `
    SELECT 
        CONVERT(P.id_prod, char) AS id_prod,
        P.nombre_prod, 
        P.detalle_prod, 
        P.precio_prod, 
        P.stock_prod, 
        P.img_prod, 
        P.img_prod2, 
        CONVERT(P.id_categoria, char) AS id_categoria
    FROM    
        producto as P
    WHERE 
        P.id_categoria = ? AND LOWER(P.nombre_prod) LIKE ?
    `;
    db.query(
        sql,
        [
            id_categoria,
            `%${nombre_prod.toLowerCase()}%`
        ],
        (err, res) => {
            if(err){
                console.log('Error:',err);
                result(err, null);
            }
            else{
                console.log('Productos', res);
                result(null, res);
            }
        }
    );
}

module.exports=Producto;