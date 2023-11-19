const Detalle = require('../models/detalle');

module.exports = {
    create(req, res){

        const detalle = req.body;

        Detalle.create(detalle, (err, id) => {
            
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'hubo un error co el registro del detalle',
                    error:err
                });
            }
            return res.status(201).json({
                success: true,
                    message: 'El detalle se creo correctamente',
                    data: `${id}`
            });

        });
}
}