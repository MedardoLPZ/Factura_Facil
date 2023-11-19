const db=require('../config/config');

const Proveedor = {};

Proveedor.create = (proveedor, result) => {

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

Proveedor.getAll = (result) =>{
    const sql =`
    SELECT 
        CONVERT(id_provee, char) as id_provee, 
        nombres_prove, 
        telefono_prove, 
        email_prove, 
        direccion_prove 
    FROM 
        proveedores
    ORDER BY
        nombres_prove
   `
   db.query(
    sql,
    (err, data)=>{
        if(err){
            console.log('Error:',err);
            result(err, null);
        }
        else{
            console.log('Categorias', data);
            result(null, data);
        }
    }

   )
}





module.exports=Proveedor;

