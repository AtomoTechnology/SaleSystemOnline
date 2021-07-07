import {Router} from 'express';
import {authjwt, validator} from '../Middlewares'
import * as businesscontroller from '../Controllers/business.controller';
const router = Router();

//Get All user
router.get('/',businesscontroller.GetAll);

//Get by id
router.get('/:id', businesscontroller.GetById);

//Create
router.post('/',
    //[
    // authjwt.verifyToken,validator.checkUserNameNoneRepeat,
    // validator.checkRoleExisted,validator.isUserValid,validator.isPassValid,
    // validator.IsmailValid, validator.EmailNoneRepeat,validator.PhoneNoneRepeat
    // ],
    businesscontroller.Post);

//Update
router.put('/:id',[authjwt.verifyToken, authjwt.isAdmin,validator.checkRoleExisted, validator.IsmailValid], businesscontroller.Put);

//Delete
router.delete('/:id',[authjwt.verifyToken, authjwt.isAdmin], businesscontroller.Delete);

module.exports = router;