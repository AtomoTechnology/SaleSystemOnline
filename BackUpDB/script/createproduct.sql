CREATE DEFINER=`root`@`localhost` PROCEDURE `createProduct`(
	in idCategory int, in idAccount int, in productCode varchar(50),
	in productName varchar(150), in description varchar(100), in stock int,
    in imagen longtext, in price decimal(18,2))
BEGIN
declare _idproduct int;
    DECLARE track_no INT DEFAULT 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION, NOT FOUND, SQLWARNING
	BEGIN  
	GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
    SELECT '303' AS status,  @MESSAGE_TEXT AS message;
	ROLLBACK;
	END;

	START TRANSACTION;
    
    insert into products(idCategory, idAccount, pruductCode, productName, stock, imagen, state)
    values(idCategory, idAccount, productCode, productName, productName, imagen,1);
    SET _idproduct = (SELECT LAST_INSERT_ID());
    
	insert into priceproducts(idProduct, price, creationDate, stock, state)
    values(_idproduct,price, CURDATE(), stock, 1);
    
	SELECT '203' AS status, "El product fue guardo con exito" AS message;
   COMMIT;
END