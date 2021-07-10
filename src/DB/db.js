import mysql from 'mysql';

const mysqlconnection = mysql.createConnection({
    host:'localhost',
    user:'root',
<<<<<<< HEAD
    password:'',
    database:'onlinedatabase',
=======
    password:'jhmok',
    database:'onlinesystem',
>>>>>>> f96517d8d422f7b11c361473c86711fa2b4257c2
    insecureAuth : true
});
mysqlconnection.connect( (err) =>{
    if(err){
        console.log(err);
        return;
    }
    else{
       console.log('DB is conected'); 
    }
});

module.exports = mysqlconnection;