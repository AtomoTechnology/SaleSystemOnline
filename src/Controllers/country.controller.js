import mysqlconnection from '../DB/db'; 
export const GetALl = (req, res) =>{
    mysqlconnection.query('SELECT * FROM countries where state = 1 ORDER BY id DESC',(err, rows, fields) =>{
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
    mysqlconnection.query('SELECT * FROM countries where state = 1 and id =?',[id], (err, rows, fields) =>{
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
    const query = "INSERT INTO countries (name, state) VALUES ?";
    var values = [[name, description, 1]];
    
    mysqlconnection.query(query,[values], (err, rows, fields) =>{
        if(!err){          
            return res.json({
                status: 201,
                message:'El pais fue guardo con exito'
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
    mysqlconnection.query(`UPDATE countries SET name = '${name}' WHERE id =${[id]}`, (err, rows, fields) =>{
        if(!err){
            res.json({
                status: 201,
                message:'El pais fue modificado con exito'
            });
        }
        else{
            return res.json(err);
        }
    });
}
export const Delete = (req, res) =>{  
    const { id } = req.params;
    mysqlconnection.query('UPDATE countries SET state = 2 WHERE id =?',[id], (err, rows, fields) =>{
        if(!err){
            res.json({
                status: 201,
                message:'El pais fue eliminado con exito'
            });
        }
        else{
            return res.json(err);
        }
    });
}