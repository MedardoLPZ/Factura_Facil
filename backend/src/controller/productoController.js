const Producto = require('../models/producto');
const storage = require('../utils/cloud_storage');
const asyncForEach = require('../utils/async_foreach');

module.exports = {
    create(req, res){


        const producto = JSON.parse(req.body.producto);

        const files = req.files;

        let inserts = 0;

        if(files.length === 0){
            return res.status(501).json({
                success: false,
                messsage: 'Error al registrar el producto no tiene imagenes',
            });
        }
        else{

            Producto.create(producto, (err, id_product)=>{
                if(err){
                    return res.status(501).json({
                        success: false,
                        messsage: 'hubo un error con el registro del producto',
                        error:err
                    });
                }

                producto.id_prod= id_product;
                const start = async () => {
                    await asyncForEach(files, async (file) => {
                        const path = `image_${Date.now()}`;
                        const url = await storage(file, path);

                        if (url != undefined && url != null) { // CREO LA IMAGEN EN FIREBASE
                            if (inserts == 0) { //IMAGEN 1
                                producto.img_prod = url;
                            }
                            else if (inserts == 1) { //IMAGEN 2
                                producto.img_prod2 = url;
                            }
                           
                        }

                        await Producto.update(producto, (err, data) => {
                            if (err) {
                                return res.status(501).json({
                                    success: false,
                                    message: 'Hubo un error con el registro del producto',
                                    error: err
                                });
                            }

                            inserts = inserts + 1;

                            if (inserts == files.length) { // TERMINO DE ALAMACENAR LAS TRES IMAGENES
                                return res.status(201).json({
                                    success: true,
                                    message: 'El producto se almaceno correctamente',
                                    data: data
                                });
                            }

                        });
                    });
                }
    
                start();
            });

        }
    }

}