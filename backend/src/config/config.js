const mysql = require('mysql2')

const db = mysql.createConnection({
    host:'b6yfzulowp0ybsaxnun1-mysql.services.clever-cloud.com',
    user:'uwzk60y08i3fjlwu',
    password:'PAWRj9lalSxfa8qIgr5m',
    database: 'b6yfzulowp0ybsaxnun1'
})

db.connect(function(err){
    if(err) throw err;
    console.log('base de datos conectada')
});

module.exports=db;