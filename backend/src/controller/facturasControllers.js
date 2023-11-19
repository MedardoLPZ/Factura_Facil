const Factura = require('../models/factura');

module.exports = {

    create(req, res){

        const factura = req.body;

        Factura.create(factura, (err, id) => {
            
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'hubo un error co el registro del factura',
                    error:err
                });
            }
            return res.status(201).json({
                success: true,
                    message: 'La factura se creo correctamente',
                    data: `${id}`
            });

        });
    }


}