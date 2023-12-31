const facturasControllers = require('../controller/facturasControllers');
const passport = require('passport');


module.exports=(app)=>{
    //Get -> Obtener datos
    //Post -> almacenar Datos
    // put -> Actulizar Datos
    //Dele -> Eliminar Datos

   // app.get('/api/facturass/getAll', passport.authenticate('jwt', {session: false}), facturasControllers.getALL);

    app.post('/api/facturas/create', passport.authenticate('jwt', {session: false}), facturasControllers.create)
    app.post('/api/facturas/update', passport.authenticate('jwt', {session: false}), facturasControllers.update)
    app.get('/api/facturas/max', passport.authenticate('jwt', {session: false}), facturasControllers.max)
    app.get('/api/facturas/getAll', /*passport.authenticate('jwt', {session: false}),*/ facturasControllers.getALL);
    //app.get('/api/productos/findbyCategory/:id_categoria', passport.authenticate('jwt', {session: false}), productosController.findbyCategory);



}