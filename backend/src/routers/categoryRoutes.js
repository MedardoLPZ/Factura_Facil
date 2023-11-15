const categoryController = require('../controller/categoryController');
const passport = require('passport')
module.exports=(app)=>{
    //Get -> Obtener datos
    //Post -> almacenar Datos
    // put -> Actulizar Datos
    //Dele -> Eliminar Datos




    app.post('/api/category/create', passport.authenticate('jwt', {session: false}), categoryController.create);

   
   
   /*
    app.post('/api/users/createWithImage', upload.array('image', 1) , userController.registerWithImage);
    app.post('/api/users/login', userController.login);

    //401 no autoriazado
    app.put('/api/users/update', passport.authenticate('jwt', {session: false}), upload.array('image', 1), userController.updateWithImage);
    app.put('/api/users/updateWithoutImage', passport.authenticate('jwt', {session: false}), userController.updateWithoutImage);


    //Solo el administador podra acceder esta api
    app.delete('/api/users/delete', userController.deleteUser);

*/

}