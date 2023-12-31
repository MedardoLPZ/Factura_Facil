const User = require('../models/user');
const Rol = require('../models/Rol')
const bycrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const keys = require('../config/Keys');
const storage = require('../utils/cloud_storage')




module.exports={



    select(req, res) {
        User.select(req.body.user, async (err, myUser) => {
            if (err) {
                return res.status(500).json({
                    success: false,
                    message: 'Hubo un error al obtener los usuarios',
                    error: err,
                });
            }
    
            if (!myUser || !Array.isArray(myUser)) {
                return res.status(404).json({
                    success: false,
                    message: 'No se encontraron usuarios o el formato es incorrecto',
                });
            }
    
            const validUsers = myUser.filter(user => user.id && !isNaN(parseInt(user.id)));
    
            if (validUsers.length === 0) {
                return res.status(404).json({
                    success: false,
                    message: 'No se encontraron usuarios con IDs válidos',
                });
            }
    
            const userData = validUsers.map(user => ({
                id: `${user.id}`,
                name: user.name,
                lastname: user.lastname,
                email: user.email,
                phone: user.phone,
                image: user.image,
                roles: user.roles ? JSON.parse(user.roles) : null,
            }));
    
            return res.status(200).json({
                success: true,
                message: 'Usuarios encontrados con IDs válidos',
                data: userData,
            });
        });
    },
    




    login(req, res){

        const email = req.body.email;
        const password = req.body.password;
        
    
        User.findByEmail(email, async (err, myUser)=>{
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'hubo un  error con el registro del usuairo',
                    error:err
                });
            }

            if(!myUser){
                return res.status(401).json({
                    success: false,
                    message: 'email no fue ecnontrado',
                });
                
            }

            const isPasswordValid= await bycrypt.compare(password,myUser.password);
            if(isPasswordValid){
                const token = jwt.sign({id: myUser.id, email: myUser.email}, keys.secretOrKey,{});

                const data = {
                    id: `${myUser.id}`,
                    name: myUser.name,
                    lastname: myUser.lastname,
                    email: myUser.email,
                    phone: myUser.phone,
                    image: myUser.image,
                    session_token: `JWT ${token}`,
                    roles: JSON.parse(myUser.roles)
                }
                return res.status(201).json({
                    success: true,
                    message: 'El usuario fue autenticado',
                        data: data
                });

            }
            else{
                return res.status(401).json({
                    success: false,
                    message: 'contraseña incorrecta ecnontrado',
                });
            }




            

        });
    
    },




    register(req, res){
        const user = req.body;
        User.create(user, (err, data)=>{
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'hubo un error co el registro del usuairo',
                    error:err
                });
            }
            return res.status(201).json({
                success: true,
                    message: 'el registro se realizo correctamente',
                    data: data
            });

        });

    },

    async registerWithImage(req, res){
        const user = JSON.parse(req.body.user);

        const files = req.files;

        if(files.length > 0) {
            const path = `image_${Date.now()}`;
            const url = await storage(files[0], path);

            if(url != undefined && url != null){
                user.image = url;
            }
        }


        User.create(user, (err, data)=>{
            if(err){
                return res.status(501).json({
                    success: false,
                    messsage: 'hubo un error co el registro del usuairo',
                    error:err
                });
            }
            

            user.id =  `${data}`;
            const token = jwt.sign({id: user.id, email: user.email}, keys.secretOrKey,{});
            user.session_token = `JWT ${token}`;

            Rol.create(user.id, 2, (err, data) =>{   //el numero 2 es para el asignar el rol
                if(err){
                    return res.status(501).json({
                        success: false,
                        messsage: 'Hubo un  error con el registro del rol de usuairo',
                        error:err
                    });
                }
            }); 


            return res.status(201).json({
                success: true,
                    messsage: 'el registro se realizo correctamente',
                    data: user
            });

        });

    },

  

//
async updateWithImage(req, res) {

    const user = JSON.parse(req.body.user); // CAPTURO LOS DATOS QUE ME ENVIE EL CLIENTE

    const files = req.files;

    if (files.length > 0) {
        const path = `image_${Date.now()}`;
        const url = await storage(files[0], path);

        if (url != undefined && url != null) {
            user.image = url;
        }
    }

    User.update(user, (err, data) => {

        
        if (err) {
            return res.status(501).json({
                success: false,
                message: 'Hubo un error con el registro del usuario',
                error: err
            });
        }

        User.findById(data, (err, myData) => {
            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con el registro del usuario',
                    error: err
                });
            }
            
            myData.session_token = user.session_token;
            myData.roles = JSON.parse(myData.roles);

            return res.status(201).json({
                success: true,
                message: 'El usuario se actualizo correctamente',
                data: myData
            });
        })
    });

},

async updateWithoutImage(req, res) {

    const user = req.body; // CAPTURO LOS DATOS QUE ME ENVIE EL CLIENTE

    User.updateWithoutImage(user, (err, data) => {

    
        if (err) {
            return res.status(501).json({
                success: false,
                message: 'Hubo un error con el registro del usuario',
                error: err
            });
        }

        User.findById(data, (err, myData) => {
            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con el registro del usuario',
                    error: err
                });
            }
            
            myData.session_token = user.session_token;
            myData.roles = JSON.parse(myData.roles);

            return res.status(201).json({
                success: true,
                message: 'El usuario se actualizo correctamente',
                data: myData
            });
        })

        
    });

},

//
    deleteUser(req, res){
        const userId = req.body.id; // Obtén el ID del usuario a eliminar desde los parámetros de la solicitud

        User.delete(userId, (err, result) => {
            if (err) {
                return res.status(500).json({
                    success: false,
                    message: 'Hubo un error al eliminar el usuario',
                    error: err,
                });
            }

            if (result.affectedRows === 0) {
                return res.status(404).json({
                    success: false,
                    message: 'Usuario no encontrado',
                });
            }

            return res.status(200).json({
                success: true,
                message: 'Usuario eliminado correctamente',
            });
        });
    }
}

   


