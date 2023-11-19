const db=require('../config/config');

const Detalle = {};

Detalle.create = (detalle, result) => {

    const sql = `
    INSERT INTO 
        detalle(
            id_fact, 
            id_prod, 
            cantidad_deta, 
            isv, 
            des, 
            sub, 
            total
            ) 
        VALUES (?,?,?,?,?,?,?)
    
    `;
    db.query(
        sql,
        [
            detalle.id_fact, 
            detalle.id_prod, 
            detalle.cantidad_deta, 
            detalle.isv, 
            detalle.des, 
            detalle.sub, 
            detalle.total 


        ],
        (err, res)=>{
            if(err){
                console.log('Error:',err);
                result(err, null);
            }
            else{
                console.log('Id del nuevo de detalle', res.insertId);
                result(null, res.insertId);
            }
        }
    )
}


module.exports=Detalle;
