const db=require('../config/config');
const bycrypt = require('bcryptjs');

const Category={};

Category.create = (Category, result) =>{
    const sql = `
    INSERT INTO 
    categories(
        name, 
        descripcion_cate
        ) 
        VALUES (?,?)
        `;

    db.query(
        sql,
        [
            Category.name,
            Category.descripcion_cate

        ],
        (err, res)=>{
            if(err){
                console.log('Error:',err);
                result(err, null);
            }
            else{
                console.log('Id de la nueva categoria: ', res.insertId);
                result(null, res.insertId);
            }
        }
    )
}


module.exports=Category;