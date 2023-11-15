const db=require('../config/config');

const proveedor = {};

proveedor.create = (proveedor, result) => {

    const sql = `
    INSERT INTO proveedores(
        nombres_prove, 
        telefono_prove, 
        email_prove, 
        direccion_prove
        ) VALUES (?,?,?,?)
    
    `;
    db.query(
        sql,
        [
            proveedor.nombres_prove, 
            proveedor.telefono_prove, 
            proveedor.email_prove, 
            proveedor.direccion_prove 

        ],
        (err, res)=>{
            if(err){
                console.log('Error:',err);
                result(err, null);
            }
            else{
                console.log('Id del nuevo proveedor: ', res.insertId);
                result(null, res.insertId);
            }
        }
    )
}


module.exports=proveedor;

