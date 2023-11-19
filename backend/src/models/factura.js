const db=require('../config/config');

const Factura = {};

Factura.create = (factura, result) => {

    const sql = `
    INSERT INTO 
    facturas( 
            fecha_fact, 
            id_client) 
    VALUES (?,?)
    
    `;
    db.query(
        sql,
        [
            factura.fecha_fact, 
            factura.id_client 

        ],
        (err, res)=>{
            if(err){
                console.log('Error:',err);
                result(err, null);
            }
            else{
                console.log('Id de la nueva factura: ', res.insertId);
                result(null, res.insertId);
            }
        }
    )
}






module.exports=Factura;

