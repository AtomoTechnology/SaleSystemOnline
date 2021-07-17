import {Router} from 'express';
import {authjwt, validator} from '../Middlewares'
import * as countrycontroller from '../Controllers/country.controller';
const router = Router();

//Get All user
router.get('/',countrycontroller.GetAll);

//Get by id
router.get('/:id',[authjwt.verifyToken, authjwt.isAdmin], countrycontroller.GetById);

//Create
router.post('/',[authjwt.verifyToken, authjwt.isAdmin],countrycontroller.Post);

//Update
router.put('/:id',[authjwt.verifyToken, authjwt.isAdmin], countrycontroller.Put);

//Delete
router.delete('/:id',[authjwt.verifyToken, authjwt.isAdmin], countrycontroller.Delete);

module.exports = router;