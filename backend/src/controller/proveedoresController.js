const Proveedor = require('../models/proveedor');

module.exports = {
    create(req, res){

        const proveedor = req.body;

        Proveedor.create(proveedor, (err, id) => {
            
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'hubo un error co el registro del proveedor',
                    error:err
                });
            }
            return res.status(201).json({
                success: true,
                    message: 'El proveedor se creo correctamente',
                    data: `${id}`
            });

        });
    },
    getALL(req, res){
        Proveedor.getAll((err, data) => { 

            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'hubo un error al momento de listar las  categorias',
                    error:err
                });
            }
            return res.status(201).json(data);

        });
    }

}
