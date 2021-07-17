import {Router} from 'express';
import {authjwt, validator} from '../Middlewares'
import * as provincecontroller from '../Controllers/province.controller';
const router = Router();

//Get All user
router.get('/',provincecontroller.GetAll);
// [authjwt.verifyToken, authjwt.isAdmin],
//Get by id
router.get('/:id', provincecontroller.GetById);

//Create
router.post('/',[authjwt.verifyToken, authjwt.isAdmin],provincecontroller.Post);

//Update
router.put('/:id',[authjwt.verifyToken, authjwt.isAdmin], provincecontroller.Put);

//Delete
router.delete('/:id',[authjwt.verifyToken, authjwt.isAdmin], provincecontroller.Delete);

module.exports = router;