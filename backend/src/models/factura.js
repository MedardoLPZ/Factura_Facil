const db=require('../config/config');

const Factura = {};

Factura.create = (factura, result) => {

    const sql = `
    INSERT INTO 
        facturas(
            fecha_fact, 
            id_user, 
            cliente, 
            isv, 
            sub, 
            total
            ) 
    VALUES (?,?,?,?,?,?)
    
    `;
    db.query(
        sql,
        [
            new Date(),
            factura.id_user,
            factura.cliente,
            factura.isv,
            factura.sub,
            factura.total
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
Factura.update = (factura, result) =>{
    const sql = `
    UPDATE facturas 
    SET 
            isv=?,
            sub=?,
            total=? 
        WHERE 
            id_fact=?
       
        `;

    db.query(
        sql,
        [
            factura.isv,
            factura.sub,
            factura.total,
            factura.id_fact
        ],
        (err, res)=>{
            if(err){
                console.log('Error:',err);
                result(err, null);
            }
            else{
                console.log('Id de la factura actualizado: ', factura.id_fact);
                result(null, factura.id_fact);
            }
        }
    )
}



Factura.maxIdFact = (callback) => {

    const sql =`
    SELECT CAST(MAX(id_fact) AS CHAR) id_fact, MAX(fecha_fact) AS fecha_fact, MAX(cliente) AS cliente FROM facturas   `;
    db.query(sql, (err, res) => {
        if (err) {
            console.log('Error:', err);
            callback(err, null);
        } else {
            const fechaFormateada = res[0].fecha_fact.toISOString().split('T')[0];
            res[0].fecha_fact = fechaFormateada;
            console.log('Factura maxima', res);
            callback(null, res);
        }
    });
}




module.exports=Factura;

