import mysqlconnection from '../DB/db'; 
export const GetAll = (req, res) =>{
    var result ="";
    if(req.query.idCountry != undefined && req.query.idCountry != "" && req.query.idCountry != null){
        result = "state = 1 and idCountry = " +req.query.idCountry;
    }
    else{
        result = "state = 1";
    }
    mysqlconnection.query(`SELECT * FROM provinces where ${result} ORDER BY id DESC`,(err, rows, fields) =>{
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
    mysqlconnection.query('SELECT * FROM provinces where state = 1 and id =?',[id], (err, rows, fields) =>{
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
    const query = "INSERT INTO provinces (idCountry,name, description, state) VALUES ?";
    var values = [[idCountry,name, description, 1]];
    
    mysqlconnection.query(query,[values], (err, rows, fields) =>{
        if(!err){          
            return res.json({
                status: 201,
                message:'La provincia fue guardo con exito'
            });
        }
        else{
            return res.json(err);
        }
    });
   
}
export const Put = (req, res) =>{
    const { name, description, idCountry } = req.body;
    const { id } = req.params;   
    mysqlconnection.query(`UPDATE provinces SET name = '${name}', description = '${description}', idCountry = ${idCountry} WHERE id =${[id]}`, (err, rows, fields) =>{
        if(!err){
            res.json({
                status: 201,
                message:'La provincia fue modificada con exito'
            });
        }
        else{
            return res.json(err);
        }
    });
}
export const Delete = (req, res) =>{  
    const { id } = req.params;
    mysqlconnection.query('UPDATE provinces SET state = 2 WHERE id =?',[id], (err, rows, fields) =>{
        if(!err){
            res.json({
                status: 201,
                message:'La provincia fue eliminada con exito'
            });
        }
        else{
            return res.json(err);
        }
    });
}