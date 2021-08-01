import {Router} from 'express';
import {authjwt, validator} from '../Middlewares'
import * as branchcontroller from '../Controllers/branch.controller';
const router = Router();

//Get All user
router.get('/',
// [authjwt.verifyToken, authjwt.isAdmin],
branchcontroller.GetAll);

//Get by id
router.get('/:id',[authjwt.verifyToken, authjwt.isAdmin], branchcontroller.GetById);

//Create
router.post('/',[authjwt.verifyToken, authjwt.isAdmin, validator.CategoryNameNoneRepeat],branchcontroller.Post);

//Update
router.put('/:id',[authjwt.verifyToken, authjwt.isAdmin], branchcontroller.Put);

//Delete
router.delete('/:id',[authjwt.verifyToken, authjwt.isAdmin], branchcontroller.Delete);

module.exports = router;