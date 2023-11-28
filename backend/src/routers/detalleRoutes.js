const detallesControllers = require('../controller/detallesControllers');
const passport = require('passport');

module.exports=(app)=>{
    //Get -> Obtener datos
    //Post -> almacenar Datos
    // put -> Actulizar Datos
    //Dele -> Eliminar Datos

   // app.get('/api/facturass/getAll', passport.authenticate('jwt', {session: false}), facturasControllers.getALL);

    app.post('/api/detalles/create', passport.authenticate('jwt', {session: false}), detallesControllers.create)
    app.get('/api/detalles/findbyId/:id_fact', passport.authenticate('jwt', {session: false}), detallesControllers.findbyId)


    

}