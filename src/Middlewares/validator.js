import mysqlconnection from '../DB/db'; 
import config from '../config/config';

export const checkUserNameNoneRepeat = (req, res, next) => {
    mysqlconnection.query('SELECT * FROM accounts where state = 1 and userName =?',[req.body.userName], (err, rows, fields) =>{         
        if(rows.length > 0){
            return res.json({
                status:config.error_Code, 
                error:"error",
                message:"Nombre usuario existe"
            });  
        }
        else{
            next();
        }
    });  
}

export const checkLocationNoneRepeat = (req, res, next) => {
    mysqlconnection.query('SELECT * FROM locations where state = 1 and name =?',[req.body.name], (err, rows, fields) =>{         
        if(rows.length > 0){
            return res.status(401).json({
                error:"error",
                message:"Esta ubicación ya existio"
            });  
        }
        else{
            next();
        }
    });  
}

export const checkDocumentNoneRepeat = (req, res, next) => {
    mysqlconnection.query('SELECT * FROM users where state = 1 and docNumber =?',[req.body.docNumber], (err, rows, fields) =>{         
        if(rows.length > 0){
            return res.status(400).json({
                error:"error",
                message:"Este documento ya existio"
            });  
        }
        else{
            next();
        }
    });  
}

export const checkRoleExisted = (req, res, next) => {
    if(req.body.idRole){
        mysqlconnection.query('SELECT * FROM roles WHERE state =?  and id =?',[1, req.body.idRole], (err, rows, fields) =>{     
                       
            if(rows.length === 0){
                return res.status(401).json({
                    error:"error",
                    message:"Rol no existe"
                });   
            }
            else{
                next();
            }
        });  
    }
    else{
        return res.status(401).json({
            error:"error",
            message:"Rol requiere"
        }); 
    }
}

export const checkRoleUpdateExisted = (req, res, next) => {
    if(req.body.idRole){
        mysqlconnection.query('SELECT * FROM roles WHERE state =?  and id !=? name =?',[1, req.idRole, req.role], (err, rows, fields) =>{     
                       
            if(rows.length === 0){
                return res.status(400).json({
                    error:"error",
                    message:"Rol no existe"
                });   
            }
            else{
                next();
            }
        });  
    }
    else{
        return res.status(401).json({
            error:"error",
            message:"Rol requiere"
        }); 
    }
}

export const checkCorrectChangePass = (req, res, next) => {    
    const { userName, userPass, olduserPass} = req.body;
    mysqlconnection.query('SELECT * FROM accounts where state = 1 and userName =?',[userName], (err, rows, fields) =>{   
        if(!err){
            const userfound = rows[0];
            if(!userfound)
            {
                return res.status(401).json({
                    error:"No encontrado",                    
                    message:"Usuario incorrecto"
                });
            }
            else{
                const pass = encripto.compare(olduserPass,userfound.userPass);
                if(!pass){
                    return res.status(401).json({
                        error:"No encontrado",                    
                        message:"contraseña actual incorrecta"
                    });
                }
                else{
                    next();
                }
            }
        }  
        else{
            return res.status(401).json({
                error:"Error",                    
                message:"No se pude establecer la conexion"
            });
        }    
        
    });  
}

export const isUserValid = (req, res, next) =>{
    if(req.body.userName.length < 6){
        return res.json({            
            status:config.invalid_error_Code, 
            error:"No encontrado",                    
            message:"El usuario debe tener al menos 6 caracteres"
        });              
    }
    else if(req.body.userName.length > 50){
        return res.json({
            status:config.invalid_error_Code, 
            error:"No encontrado",                    
            message:"El usuario no puede tener más de 50 caracteres"
        }); 
    }
    else{
        next();
    }
}

export const EmailNoneRepeat = (req, res, next) =>{
    mysqlconnection.query('SELECT * FROM accounts WHERE e_mail =?', [req.body.e_mailaccount], (err, rows, fields) =>{     
        if(rows.length > 0){
            return res.json({
                status:config.invalid_error_Code,
                error:"error",
                message:"Hay un usuario con ese correo electronico"
            });  
        }
        else{
            next();
        }  
    });  
}

export const EmailNoneRepeatBusiness = (req, res, next) =>{
    mysqlconnection.query('SELECT * FROM branches WHERE e_mail =?', [req.body.e_mail], (err, rows, fields) =>{     
        if(rows.length > 0){
            return res.json({
                status:config.invalid_error_Code,
                error:"error",
                message:"Hay un negocio con ese correo electronico"
            });  
        }
        else{
            next();
        }  
    });  
}

export const PhoneNoneRepeat = (req, res, next) =>{
    mysqlconnection.query('SELECT * FROM users WHERE state = 1 and phone =?', [req.body.phoneuser], (err, rows, fields) =>{     
        if(rows.length > 0){
            return res.json({
                status:config.invalid_error_Code,
                error:"error",
                message:"Hay un usuario con ese numero de teléfono"
            });  
        }
        else{
            next();
        }  
    });  
}

export const PhoneBusinesNoneRepeat = (req, res, next) =>{
    mysqlconnection.query('SELECT * FROM phones WHERE state = 1 and phonenumber =?', [req.body.phoneBusiness], (err, rows, fields) =>{     
        if(rows.length > 0){
            return res.json({
                status:config.invalid_error_Code,
                error:"error",
                message:"Hay un negocio con ese numero de teléfono"
            });  
        }
        else{
            next();
        }  
    });  
}

export const isPassValid = (req, res, next) =>{
    const { userPass} = req.body;  
    var mayus = /[A-Z]/;
    var minis = /[a-z]/;    
    var num = /[0-9]/;
    
    if(userPass.length < 6){
        return res.json({
            status:config.invalid_error_Code,
            error:"formato incorrecto",                    
            message:"La clave debe tener al menos 6 caracteres"
        });              
    }
    else if(userPass.length > 50){
        return res.json({
            status:config.invalid_error_Code,
            error:"formato incorrecto",                    
            message:"La clave no puede tener más de 50 caracteres"
        }); 
    }
    else if(!mayus.test(userPass)){
        return res.json({
            status:config.invalid_error_Code,
            error:"formato incorrecto",                    
            message:"La clave debe tener al menos una letra mayúscula"
        }); 
    }
    else if(!minis.test(userPass)){
        return res.json({
            status:config.invalid_error_Code,
            error:"formato incorrecto",                    
            message:"La clave debe tener al menos una letra minúscula"
        }); 
    }
    else if(!num.test(userPass)){
        return res.json({
            status:config.invalid_error_Code,
            error:"formato incorrecto",                    
            message:"La clave debe tener al menos un caracter numérico"
        }); 
    }
    else{
        next();
    }
}

export const IsmailValid = (req, res, next) => {
    const mail = req.body.e_mail;
    const isEmail = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if(!isEmail.test(mail)){
        return res.json({
            status:config.invalid_error_Code,
            error:"formato incorrecto",                    
            message:"Esta dirección de correo: " + mail + " no es valida"
        }); 
    }
    else{
        next();
    }
}

export const IsmailaccountValid = (req, res, next) => {
    const mail = req.body.e_mailaccount;
    const isEmail = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if(!isEmail.test(mail)){
        return res.json({
            status:config.invalid_error_Code,
            error:"formato incorrecto",                    
            message:"Esta dirección de correo: " + mail + " no es valida"
        }); 
    }
    else{
        next();
    }
}

export const CategoryNameNoneRepeat = (req, res, next) =>{
    mysqlconnection.query('SELECT * FROM categories WHERE state = 1 and name =?', [req.body.phoneBusiness], (err, rows, fields) =>{     
        if(rows != null){
            return res.json({
                status:config.invalid_error_Code,
                error:"error",
                message:"Hay una categoria con ese nombre"
            });  
        }
        else{
            next();
        }  
    });  
}