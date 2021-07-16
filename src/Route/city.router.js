import {Router} from 'express';
import {authjwt, validator} from '../Middlewares'
import * as citycontroller from '../Controllers/city.controller';
const router = Router();

//Get All 
router.get('/',citycontroller.GetALl);

router.get('/:id',[authjwt.verifyToken, authjwt.isAdmin], citycontroller.GetById);

//Create
router.post('/',[authjwt.verifyToken, authjwt.isAdmin],citycontroller.Post);

//Update
router.put('/:id',[authjwt.verifyToken, authjwt.isAdmin], citycontroller.Put);

//Delete
router.delete('/:id',[authjwt.verifyToken, authjwt.isAdmin], citycontroller.Delete);

module.exports = router;