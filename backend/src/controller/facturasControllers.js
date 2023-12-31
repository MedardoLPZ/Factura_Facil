const Factura = require('../models/factura');

module.exports = {
    
    getALL(req, res){
        Factura.getAll((err, data) => { 

            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'hubo un error al momento de listar los productos',
                    error:err
                });
            }
            return res.status(201).json(data);

        });
    },

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
    },
    
    update(req, res) {
        console.log(req.body);
        const factura = {
            isv: req.body.isv,
            sub: req.body.sub,
            total: req.body.total,
            id_fact: req.body.id_fact
        };
    
        Factura.update(factura, (err, data) => {
            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error la actualización',
                    error: err
                });
            }
    
            return res.status(201).json({
                success: true,
                message: 'La factura se actualizó correctamente',
                data: data
            });
        });
    },
    
    max(req, res){
        Factura.maxIdFact((err, data) => { 
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'hubo un error al momento de listar al maximo',
                    error: err
                });
            }
            return res.status(201).json(data);
        });
    }
    


}