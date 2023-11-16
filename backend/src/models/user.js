const db=require('../config/config');
const bycrypt = require('bcryptjs');

const User={};

User.findByEmail = (email, result) =>{

    const sql = `
    SELECT 
    CONVERT( u.id, char) As id, u.email, u.name, u.lastname, u.image, u.phone, u.password,

        CONCAT('[',
        
        GROUP_CONCAT(
        
        JSON_OBJECT(
        
        'id', CONVERT( r.id, char),
        
        'name', r.name,
        
        'image', r.image,
        
        'route', r.route)
        
        ),
        
        ']') AS roles
        
            from users u
        
            INNER JOIN user_has_roles h ON h.id_user=u.id
        
            INNER JOIN roles r ON r.id= h.id_rol
        
            where u.email=?
        
            GROUP BY u.id
    `;

    db.query(
        sql,
        [email],
        (err, user)=>{
            if(err){
                console.log('Error:',err);
                result(err, null);
            }
            else{
                console.log('usuario obtenido: ', user[0]);
                result(null, user[0]);
            }
        }
    )

}


User.findById = (id, result) => {
    const sql = `
    SELECT CONVERT( u.id, char) As id, u.email, u.name, u.lastname, u.image, u.phone, u.password,
        CONCAT('[',
        GROUP_CONCAT(
        JSON_OBJECT(
        'id', CONVERT(r.id, CHAR),
        'name', r.name,
        'image', r.image,
        'route', r.route)
        ),
        ']') AS roles
        FROM users u
        INNER JOIN user_has_roles h ON h.id_user = u.id
        INNER JOIN roles r ON r.id = h.id_rol
        WHERE u.id = ?
        GROUP BY u.id
    `;

    db.query(
        sql,
        [id],
        (err, user) => {
            if (err) {
                console.log('Error:', err);
                result(err, null);
            } else {
                console.log('Usuario obtenido: ', user[0]);
                result(null, user[0]);
            }
        }
    );
}

User.select = (user, result) => {
    const sql = `
    SELECT CONVERT( u.id, char) As id, u.email, u.name, u.lastname, u.image, u.phone, u.password,
    CONCAT('[',
    GROUP_CONCAT(
    JSON_OBJECT(
    'id', CONVERT(r.id, CHAR),
    'name', r.name,
    'image', r.image,
    'route', r.route)
    ),
    ']') AS roles
    FROM users u
    INNER JOIN user_has_roles h ON h.id_user = u.id
    INNER JOIN roles r ON r.id = h.id_rol
    GROUP BY u.id
    `;

    db.query(sql, (err, res) => {
        if (err) {
            console.log('Error:', err);
            result(err, null);
        } else {
            if (res && res.length > 0) {
                console.log('Usuarios encontrados:', res);
                result(null, res);
            } else {
                result("Usuarios no encontrados", null);
            }
        }
    });
};


User.create = async (user, result) =>{

    const hash = await bycrypt.hash(user.password,10);


    const sql= `
    INSERT INTO 
    USERS(email, 
        name,
        lastname,
        phone,
        image,
        password
         )
    VALUES(?,?,?,?,?,?)
    `;

    db.query(
        sql,
        [
            user.email,
            user.name,
            user.lastname,
            user.phone,
            user.image,
            hash
        ],
        (err, res)=>{
            if(err){
                console.log('Error:',err);
                result(err, null);
            }
            else{
                console.log('Id del nuveo usuario: ', res.insertId);
                result(null, res.insertId);
            }
        }
    )
}

User.update= (user, result) =>{
    const sql = `
    UPDATE 
        users
    SET
        name=?,
        lastname=?,
        phone=?,
        image=?
    where
        id=?
    `;

    db.query(
        sql,
        [
            user.name,
            user.lastname,
            user.phone,
            user.image,
            user.id
        ],
        (err, res)=>{
            if(err){
                console.log('Error:',err);
                result(err, null);
            }
            else{
                console.log('Usuario actualizado: ', user.id);
                result(null, user.id);
            }
        }
    )
}

User.updateWithoutImage = (user, result) => {
    
        const sql = `
        UPDATE 
            users
        SET
            name = ?,
            lastname = ?,
            phone = ?
        WHERE
            id = ?
        `;

        db.query(
            sql,
            [
                user.name,
                user.lastname,
                user.phone,
                user.id
            ],
            (err, res) => {
                if (err) {
                    console.log('Error:', err);
                    result(err, null);
                } else {
                    console.log('Usuario actualizado: ', user.id);
                    result(null, user.id);
                }
            }
        );
   
}

User.delete = (id, result) => {
    const sql = `
    DELETE FROM users
    WHERE id = ?
    `;

    if (!id) {
        console.log('Error: ID no válido');
        result({ message: 'ID no válido' }, null);
        return;
    }


    db.query(sql, [id], (err, res) => {
        if (err) {
            console.log('Error:', err);
            result(err, null);
        } else {
            if (res.affectedRows === 0) {
                result({ message: 'Usuario no encontrado' }, null);
            } else {
                console.log('Usuario eliminado: ', id);
                result(null, id);
            }
        }
    });
};

module.exports=User;