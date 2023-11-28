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
    },

    findbyId(req, res){
        const id_fact = req.params.id_fact;

        Detalle.findById(id_fact, (err, data) => { 

            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'hubo un error al momento de listar los productos',
                    error:err
                });
            }
            return res.status(201).json(data);

        });
    }


}