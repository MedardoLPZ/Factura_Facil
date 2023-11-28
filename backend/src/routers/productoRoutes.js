const productosController = require('../controller/productoController');
const passport = require('passport')

module.exports=(app, upload)=>{
    //Get -> Obtener datos
    //Post -> almacenar Datos
    // put -> Actulizar Datos
    //Dele -> Eliminar Datos
    
    app.post('/api/productos/create', passport.authenticate('jwt', {session: false}), upload.array('image', 2), productosController.create);
    app.get('/api/productos/getAll', passport.authenticate('jwt', {session: false}), productosController.getALL);
    app.get('/api/productos/findbyCategory/:id_categoria', passport.authenticate('jwt', {session: false}), productosController.findbyCategory);
    app.get('/api/productos/findByNameAndCategory/:id_categoria/:nombre_prod', passport.authenticate('jwt', {session: false}), productosController.findByNameAndCategory);


}