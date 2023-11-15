const productosController = require('../controller/productoController');
const passport = require('passport')

module.exports=(app, upload)=>{
    //Get -> Obtener datos
    //Post -> almacenar Datos
    // put -> Actulizar Datos
    //Dele -> Eliminar Datos
    
    app.post('/api/productos/create', passport.authenticate('jwt', {session: false}), upload.array('image', 2), productosController.create);

}