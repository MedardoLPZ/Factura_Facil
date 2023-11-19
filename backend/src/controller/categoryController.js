const Category = require('../models/category');

module.exports = {
    create(req, res){

        const category = req.body;

        Category.create(category, (err, id) => {
            
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'hubo un error con el registro del categoria',
                    error:err
                });
            }
            return res.status(201).json({
                success: true,
                    message: 'La categoria se creo correctamente',
                    data: `${id}`
            });

        });
    },
    getALL(req, res){
        Category.getAll((err, data) => { 

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

