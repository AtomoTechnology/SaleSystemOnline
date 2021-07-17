
import * as encripto from '../Helpers/Cryptographies';
import config from '../config/config';
import jwt from 'jsonwebtoken';
import mysqlconnection from '../DB/db'; 

export const GetAll = (req, res) =>{
    const _idPrincipal =req.query.idBusiness;
    mysqlconnection.query(`CALL GetAllAccount(?)`,[_idPrincipal],(err, rows, fields) =>{
        if(!err){
            res.json(rows);
        }
        else{
            res.json(err);
        }
    });    
}

export const signin = (req, res) =>{    
    const { userName, userPass} = req.body;
    mysqlconnection.query(`CALL logginAccount(?)`,[userName],(err, rows, fields) =>{
        if(!err){
            const userfound = rows[0];
            if(userfound.length === 0)
            {
                return res.json({
                    status:config.user_Not_Found_Code, 
                    error:"User not found",                    
                    message:"Usuario incorrecto"
                });
            }
            else{ 
                encripto.compare(userPass,userfound[0].userPass).then(iscorrectpass => {  
                    if(!iscorrectpass){
                        return res.json({
                            status:config.error_Code, 
                            error:"Error password",                    
                            message:"contraseña incorrecta"
                        });
                    }
                    else{ 
                        const token = jwt.sign(
                            {
                                idAccount:userfound[0].idAccount, 
                                role:userfound[0].role, 
                                idRole:userfound[0].idRole, 
                                idPrincipal:userfound[0].idPrincipal, 
                                userName:userfound[0].userName, 
                                typeUser:userfound[0].typeUser
                            },
                            config.SECRET,{
                                expiresIn:86400 // vence en un dia
                            }
                        );
                        return res.json({
                            status:config.token_Success_Code,                    
                            message:"Success",
                            token:token
                        });
                    } 
                } );           
            }
        }
        else{
            return res.json({
                status:config.connection_Error_Code, 
                error:"Error connection",                    
                message:"No se pude establecer la conexion"
            });
        }
    });    
}

export const GetById = (req, res) =>{   
    mysqlconnection.query('SELECT * FROM accounts where state = 1 and id =?',[req.params], (err, rows, fields) =>{
        if(!err){
            res.json(rows[0]);
        }
        else{
            res.json(err);
        }
    });    
}

export const Put = (req, res) =>{
    const { idUser, userPass } = req.body;
    const { id } = req.params; 
    encripto.encryptPassword(userPass).then(val =>{  
        mysqlconnection.query(`UPDATE accounts SET userPass = '${val}' WHERE id =${[id]}`, (err, rows, fields) =>{
            if(!err){
                res.json({
                    code:config.success_Code,
                    status:"Success",
                    message:'La contraeña ha sido modificada con exito'
                });
            }
            else{
                return res.json(err);
            }
        });
    });
}