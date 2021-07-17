import mysqlconnection from '../DB/db'; 
import config from '../config/config';
export const getUser = (req, res) =>{
    mysqlconnection.query('SELECT * FROM products where state = 1 ORDER BY id DESC',(err, rows, fields) =>{
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
    mysqlconnection.query('SELECT * FROM products where state = 1 and id =?',[id], (err, rows, fields) =>{
        if(!err){
            res.json(rows[0]);
        }
        else{
            res.json(err);
        }
    });    
}
export const createUser = (req, res) =>{
    const { idCategory, idAccount, productCode, productName, description,stock, imagen,price} = req.body;
    const query = `CALL createProduct(?, ?, ?, ?, ?, ?, ?, ?);`
    mysqlconnection.query(query,[idCategory, idAccount, productCode, productName, description, stock, imagen,price], (err, rows, fields) =>{
        let result =rows[0];
        if(result[0].status != "303"){          
            return res.json({
                status: result[0].status,
                message:result[0].message 
            });
        }
        else{
            res.json(result);
        }
    });
   
}
export const updateUser = (req, res) =>{
    const { idCategory, idAccount, productCode, productName, description,stock, imagen,price} = req.body;
    const { id } = req.params;
    mysqlconnection.query(`UPDATE products SET idCategory = ${idCategory}, idAccount = ${idAccount}, productCode = '${productCode}', 
                productName = ${productName},description = '${description}',stock = ${stock},imagen = '${imagen}',price = ${price}
                WHERE id = ${id}`, (err, rows, fields) =>{
        if(!err){
            res.json({
                status:config.success_Code, 
                message:'El producto fue modificado con exito'
            });
        }
        else{
            res.json(err);
        }
    });
}
export const deleteUser = (req, res) =>{  
    const { id } = req.params;
    mysqlconnection.query('UPDATE products SET state = 2 WHERE id =?',[id], (err, rows, fields) =>{
        if(!err){
            res.json({
                status:config.success_Code, 
                message:'El producto fue eliminado con exito'
            });
        }
        else{
            res.json(err);
        }
    });
}