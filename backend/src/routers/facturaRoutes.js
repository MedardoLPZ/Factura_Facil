const facturasControllers = require('../controller/facturasControllers');
const passport = require('passport');


module.exports=(app)=>{
    //Get -> Obtener datos
    //Post -> almacenar Datos
    // put -> Actulizar Datos
    //Dele -> Eliminar Datos

   // app.get('/api/facturass/getAll', passport.authenticate('jwt', {session: false}), facturasControllers.getALL);

    app.post('/api/facturas/create'/*, passport.authenticate('jwt', {session: false})*/, facturasControllers.create)
    

}