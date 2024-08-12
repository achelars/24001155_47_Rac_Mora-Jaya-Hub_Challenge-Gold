const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

router.post('/', userController.createUser);
router.get('/:userId', userController.getUser);
router.put('/:userId', userController.updateUser);
router.delete('/:userId', userController.deleteUser);

router.post('/login', userController.loginUser);


router.post('/forgot-password', userController.forgotPassword);

module.exports = router;
