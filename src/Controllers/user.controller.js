import * as encripto from '../Helpers/Cryptographies'
import mysqlconnection from '../DB/db'; 
export const getUser = (req, res) =>{
    mysqlconnection.query('SELECT * FROM users where state = 1 ORDER BY id DESC',(err, rows, fields) =>{
        if(!err){
            res.json(rows);
        }
        else{
            res.json(err);
        }
    });    
}
export const GetById = (req, res) =>{ 
        const { id } = req.params;
    mysqlconnection.query('SELECT * FROM users where state = 1 and id =?',[id], (err, rows, fields) =>{
        if(!err){
            res.json(rows[0]);
            console.log(rows[0])
        }
        else{
            res.json(err);
        }
    });    
}
export const createUser = (req, res) =>{
    const { phone, firstName, lastName, address, typeDocument,docNumber, idRole,userName,userPass,idCountry,idProvince,idcity } = req.body;
    const query = `
    CALL createUser(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
    `
    const pass = ""; 
    encripto.encryptPassword(userPass).then(val =>{
        mysqlconnection.query(query,[phone, firstName, lastName, address, typeDocument, docNumber, idRole,userName,val, idCountry, idProvince,idcity], (err, rows, fields) =>{
            if(!err){          
                return res.json({
                    status: 201,
                    message:'El usuario fue guardo con exito '
                });
            }
            else{
                res.json(err);
            }
        });
    });
   
}
export const updateUser = (req, res) =>{
    const { phone, firstName, lastName, address, typeDocument,docNumber, idRole,idCountry,idProvince,idcity } = req.body;
    const { id } = req.params;
    const query = `
    CALL UpdateUser(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
    `
    mysqlconnection.query(query,[id, phone, firstName, lastName, address,typeDocument,docNumber,idRole,idCountry,idProvince,idcity], (err, rows, fields) =>{
        if(!err){
            res.json({
                status: 201,
                message:'El usuario fue modificado con exito'
            });
        }
        else{
            res.json(err);
        }
    });
}
export const deleteUser = (req, res) =>{  
    const { id } = req.params;
    mysqlconnection.query('UPDATE users SET state = 2 WHERE id =?',[id], (err, rows, fields) =>{
        if(!err){
            res.json({
                status: 201,
                message:'El usuario fue eliminado con exito'
            });
        }
        else{
            res.json(err);
        }
    });
}