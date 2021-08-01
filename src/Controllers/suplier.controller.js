import mysqlconnection from '../DB/db'; 
export const GetAll = (req, res) =>{
    var result ="";
    if(req.query.idBusiness != undefined && req.query.idBusiness != "" && req.query.idBusiness != null){
        result = "state = 1 and idCountry = " +req.query.idBusiness;
    }
    else{
        result = "state = 1";
    }
    mysqlconnection.query(`SELECT * FROM supliers where ${result} ORDER BY id DESC`,(err, rows, fields) =>{
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
    mysqlconnection.query('SELECT * FROM supliers where state = 1 and id =?',[id], (err, rows, fields) =>{
        if(!err){
            res.json(rows[0]);
        }
        else{
            res.json(err);
        }
    });    
}
export const Post = (req, res) =>{
    const {idBusiness, address, postal_code, e_mail, idCountry, idProvince, idCity, phone} = req.body;    
    var values = [[idBusiness, address, postal_code, e_mail, idCountry, idProvince, idCity, phone]];
    const query = `CALL createBranch(?, ?, ?, ?, ?, ?, ?, ?);`;
    mysqlconnection.query(query,[values], (err, rows, fields) =>{
        let result = rows[0];
        if (result[0].status != '303') {
            return res.json({
                status: result[0].status,
                message: result[0].message,
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
    mysqlconnection.query(`UPDATE supliers SET name = '${name}', description = '${description}', idCountry = ${idCountry} WHERE id =${[id]}`, (err, rows, fields) =>{
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
    mysqlconnection.query('UPDATE supliers SET state = 2 WHERE id =?',[id], (err, rows, fields) =>{
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