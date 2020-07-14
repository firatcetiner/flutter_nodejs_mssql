const mssql = require('mssql');

const dbConfig = {
    server : 'DESKTOP-BHC6PKF\\SQLEXPRESS',
    //port : 1433,
    database : 'ReceiptScan',
    user : 'firat',
    password : 'password',
    options: {
        encrypt: true,
        useUTC: true
    },
    pool: {
        max: 10,
        min: 0,
        idleTimeoutMillis: 60000
    }
};


function req (query, callback) {
    mssql.connect(dbConfig, function(err){
        let req = new mssql.Request()
        req.query(query, function(err,result) {
            if(err)
                console.dir(err)
            else    
                console.dir(result)
            callback(result)
        })
    })
}

module.exports = {
    request : req,
}

