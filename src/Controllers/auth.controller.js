
import * as encripto from '../Helpers/Cryptographies';
import config from '../config/config';
import jwt from 'jsonwebtoken';
import mysqlconnection from '../DB/db'; 

export const GetAll = (req, res) =>{
    debugger;
    mysqlconnection.query(`CALL GetAllAccount(?)`,[req.query.filter],(err, rows, fields) =>{
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
            if(userfound.length == 0)
            {
                return res.status(400).json({
                    code:config.user_Not_Found_Code, 
                    error:"User not found",                    
                    message:"Usuario incorrecto"
                });
            }
            else{ 
                const pass = encripto.comparePass(userPass,userfound.userPass);
                // encripto.comparePass
                console.log("probar"+pass);
                if(!pass){
                    return res.status(401).json({
                        code:config.error_Code, 
                        error:"Error password",                    
                        message:"contraseña incorrecta"
                    });
                }
                else{ 
                    const token = jwt.sign(
                        {
                            idAccount:userfound.idAccount, 
                            role:userfound.role, 
                            idRole:userfound.idRole, 
                            idPrincipal:userfound.idPrincipal, 
                            userName:userfound.userName, 
                            typeUser:userfound.typeUser
                        },
                        config.SECRET,{
                            expiresIn:86400 // vence en un dia
                        }
                    );
                    return res.status(200).json({
                        code:config.token_Success_Code,                    
                        message:"Success",
                        token:token
                    });
                }            
            }
        }
        else{
            return res.status(400).json({
                code:config.connection_Error_Code, 
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