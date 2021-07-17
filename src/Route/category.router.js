import {Router} from 'express';
import {authjwt, validator} from '../Middlewares'
import * as categorycontroller from '../Controllers/categoria.controler';
const router = Router();

//Get All user
router.get('/',[authjwt.verifyToken, authjwt.isAdmin],categorycontroller.GetAll);

//Get by id
router.get('/:id',[authjwt.verifyToken, authjwt.isAdmin], categorycontroller.GetById);

//Create
router.post('/',[authjwt.verifyToken, authjwt.isAdmin, validator.CategoryNameNoneRepeat],categorycontroller.Post);

//Update
router.put('/:id',[authjwt.verifyToken, authjwt.isAdmin], categorycontroller.Put);

//Delete
router.delete('/:id',[authjwt.verifyToken, authjwt.isAdmin], categorycontroller.Delete);

module.exports = router;