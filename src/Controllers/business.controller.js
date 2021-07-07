import * as encripto from '../Helpers/Cryptographies'
import mysqlconnection from '../DB/db'; 
export const GetAll = (req, res) =>{
    mysqlconnection.query('SELECT * FROM businesses where state = 1 ORDER BY id DESC',(err, rows, fields) =>{
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
    mysqlconnection.query('SELECT * FROM businesses where state = 1 and id =?',[id], (err, rows, fields) =>{
        if(!err){
            res.json(rows[0]);
            console.log(rows[0])
        }
        else{
            res.json(err);
        }
    });    
}

export const Post = (req, res) =>{
    
    const { businessName, firstName, lastName, address, addressuser, typeDocument, docNumber, logo, userPass, idCountry, idProvince, idcity, phoneBusiness, phoneuser, idRole, idCountryuser, idProvinceuser, idcityuser, userName } = req.body;
    const query = `
    CALL createBusiness(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
    `
    const pass = ""; 
    encripto.encryptPassword(userPass).then(val =>{
        mysqlconnection.query(query,[businessName, firstName, lastName, address, addressuser, typeDocument, docNumber, logo, idCountry, idProvince,idcity, phoneBusiness, phoneuser, idRole,idCountryuser, idProvinceuser, idcityuser, userName,val ], (err, rows, fields) =>{
            if(!err){          
                return res.json({
                    status: 201,
                    message:'El negocio fue guardo con exito'
                });
            }
            else{
                res.json(err);
            }
        });
    });   
}

export const Put = (req, res) =>{
    const { businessName, address, logo, idCountry, idProvince, idcity, phoneBusiness, idCountryuser, idProvinceuser, idcityuser} = req.body;
    const { id } = req.params;
    const query = `
    CALL UpdateBusiness(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
    `
    mysqlconnection.query(query,[id, businessName, address, logo, idCountry, idProvince, idcity, phoneBusiness, idCountryuser, idProvinceuser, idcityuser], (err, rows, fields) =>{
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

export const Delete = (req, res) =>{  
    const { id } = req.params;
    mysqlconnection.query('UPDATE businesses SET state = 2 WHERE id =?',[id], (err, rows, fields) =>{
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