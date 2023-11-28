const db=require('../config/config');

const Detalle = {};

Detalle.create = (detalle, result) => {

    const sql = `
    INSERT INTO 
        detalle(
            id_fact, 
            id_prod, 
            cantidad_deta,  
            sub
            ) 
        VALUES (?,?,?,?)
    
    `;
    db.query(
        sql,
        [
            detalle.id_fact, 
            detalle.id_prod, 
            detalle.cantidad_deta,  
            detalle.sub
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

Detalle.findById = (id_fact, result) =>{

    const sql = `
    SELECT 
    CONVERT(id_prod , char) AS id_prod,
    CONVERT(cantidad_deta, char) AS cantidad_deta,
    CONVERT(sub, char) AS sub
        FROM detalle   
        WHERE id_fact = ? 
        GROUP BY id_detalle
    `;

    db.query(
        sql,
        [id_fact],
        (err, res)=>{
            if(err){
                console.log('Error:',err);
                result(err, null);
            }
            else{
                console.log('usuario obtenido: ', res);
                result(null, res);
            }
        }
    )

}


module.exports=Detalle;
