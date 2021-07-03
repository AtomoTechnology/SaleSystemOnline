
import jwt from 'jsonwebtoken';
import config from '../config/config';
import mysqlconnection from '../DB/db'; 

export const verifyToken = async(req, res, next) =>{   
    try {
        const token = req.headers["x-access-token"];
        if(!token){
            return res.status(400).json({
                code:config.token_Error_Code, 
                error:"Error token",
                message:"Token requiere"
            });
        }
        
        const decode = jwt.verify(token, config.SECRET);

        req.id = decode.id;
        req.role = decode.role;
        req.idRole = decode.idRole;
        
        const userExist =  mysqlconnection.query('SELECT * FROM accounts where state = 1 and id =?',[req.id]); 
        if(!userExist){
            return res.status(404).json({
                code:config.user_Not_Found_Code, 
                error:"User not found",
                message:"Usuario no encontrado"
            });
        }
        next();
    }
    catch (e) {
        return res.status(403).json({
            code:config.token_Error_Code, 
            error:"Error token",
            message:"No autorizado"
        });
    }
};

export const isAdmin = async(req, res, next) => {
    try 
    { 
        mysqlconnection.query('SELECT * FROM roles where state = 1 and name =?',[req.role], (err, rows, fields) =>
        {
            if(!err)
            {
                if(rows[0].name.toLowerCase() === ("admin").toLowerCase())
                {
                    next();
                    return;
                }
                else
                {
                    return res.status(403).json({
                        code:config.access_error_Code, 
                        error:"Error accesso",
                        message:"Requiere acceso administrativo"
                    });  
                }
            }
            else{
                return res.status(403).json({
                    code:config.access_error_Code, 
                    error:"Error accesso",
                    message:"Requiere acceso administrativo"
                });
            }
        });      
        
    } 
    catch (error) {
        return res.status(403).json({
            code:config.access_error_Code, 
            error:"error",
            message:"Acceso no permitido"
        });
    }
}