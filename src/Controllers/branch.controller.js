import mysqlconnection from '../DB/db'; 
import config from '../config/config';
export const GetAll = (req, res) =>{
    var result ="";
    if(req.query.idBusiness != undefined && req.query.idBusiness != "" && req.query.idBusiness != null){
        result = "state = 1 and idBusiness = " +req.query.idBusiness;
    }
    else{
        result = "state = 1";
    }

    mysqlconnection.query(`select id as idbranch, idBusiness, address as "sucursal", e_mail from branches where ${result} ORDER BY id DESC`,(err, rows, fields) =>{
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
    mysqlconnection.query('SELECT * FROM branches where state = 1 and id =?',[id], (err, rows, fields) =>{
        if(!err){
            res.json(rows[0]);
        }
        else{
            res.json(err);
        }
    });    
}
export const Post = (req, res) =>{
    const { name, description} = req.body;
    const query = "INSERT INTO branches (name, description, state) VALUES ?";
    var values = [[name, description, 1]];
    
    mysqlconnection.query(query,[values], (err, rows, fields) =>{
        if(!err){          
            return res.json({
                status:config.success_Code, 
                message:'La sucursal fue guarda con exito'
            });
        }
        else{
            return res.json(err);
        }
    });
   
}
export const Put = (req, res) =>{
    const { name, description } = req.body;
    const { id } = req.params;   
    mysqlconnection.query(`UPDATE branches SET name = '${name}', description = '${description}' WHERE id =${[id]}`, (err, rows, fields) =>{
        if(!err){
            res.json({
                status:config.success_Code,
                message:'La sucursal fue modificada con exito'
            });
        }
        else{
            return res.json(err);
        }
    });
}
export const Delete = (req, res) =>{  
    const { id } = req.params;
    mysqlconnection.query('UPDATE branches SET state = 2 WHERE id =?',[id], (err, rows, fields) =>{
        if(!err){
            res.json({
                status:config.success_Code,
                message:'La sucursal fue eliminada con exito'
            });
        }
        else{
            return res.json(err);
        }
    });
}