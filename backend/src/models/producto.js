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


module.exports=Producto;