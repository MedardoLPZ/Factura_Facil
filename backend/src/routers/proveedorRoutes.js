const proveedoresController = require('../controller/proveedoresController');
const passport = require('passport')

module.exports=(app)=>{
    //Get -> Obtener datos
    //Post -> almacenar Datos
    // put -> Actulizar Datos
    //Dele -> Eliminar Datos
    
    app.post('/api/proveedores/create', passport.authenticate('jwt', {session: false}), proveedoresController.create);

}