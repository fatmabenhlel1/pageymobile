import express from 'express';
import { getAllBooks, getBookById , createBook } from '../controllers/booksController.js';

const router = express.Router();

// Routes
router.get('/', getAllBooks);         // GET /api/books
router.get('/:id', getBookById);      // GET /api/books/:id
router.post('/createBook' , createBook)
export default router;