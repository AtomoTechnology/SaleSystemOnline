import * as encripto from '../Helpers/Cryptographies'
import mysqlconnection from '../DB/db'; 
import config from '../config/config';

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
    
    const { businessName, firstName, lastName, address, addressuser, idDocumentType, docNumber, logo, userPass, idCountry, idProvince, idcity, phoneBusiness, phoneuser, idRole, idCountryuser, idProvinceuser, idcityuser, userName, postal_code, e_mail, cuit_cuil, e_mailaccount } = req.body;
    const query = `
    CALL createBusiness(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
    `
    const pass = ""; 
    encripto.encryptPassword(userPass).then(val =>{
        mysqlconnection.query(query,[businessName, firstName, lastName, address, addressuser, idDocumentType, docNumber, logo, idCountry, idProvince,idcity, phoneBusiness, phoneuser, idRole,idCountryuser, idProvinceuser, idcityuser, userName,val, postal_code, e_mail, cuit_cuil, e_mailaccount ], (err, rows, fields) =>{
            let result =rows[0];
            if(result[0].status != "303"){          
                return res.json({
                    status: result[0].status,
                    message:result[0].message 
                });
            }
            else{
               return res.json(result);
            }
        });
    });
   
}
export const Put = (req, res) =>{
    const { businessName, cuit_cuil, logo} = req.body;
    const { id } = req.params;   
    mysqlconnection.query(`UPDATE businesses SET businessName = '${businessName}',cuit_cuil = '${cuit_cuil}',logo = '${logo}' WHERE id =${[id]}`,(err, rows, fields) =>{
        if(!err){
            res.json({
                status:config.success_Code, 
                message:'El negocio fue modificado con exito'
            });
        }
        else{
            res.json(err);
        }
    });
}
export const Delete = (req, res) =>{   
    const {id} = req.params;
    mysqlconnection.query(`CALL deleteBusiness(?)`,[id], (err, rows, fields) =>{
       
        let result =rows[0];
        if(result[0].status != "303"){          
            return res.json({
                status: result[0].status,
                message:result[0].message 
            });
        }
        else{
            res.json(err);
        }
    });
}