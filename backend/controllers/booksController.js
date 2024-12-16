import Book from '../models/bookModel.js'; // Import the Book model

// Get all books
export const getAllBooks = async (req, res) => {
  try {
    const books = await Book.find(); // Fetch all books from the database
    res.json(books);
  } catch (error) {
    res.status(500).json({ message: "Error fetching books", error });
  }
};

// Get a specific book by ID
export const getBookById = async (req, res) => {
  try {
    const book = await Book.findById(req.params.id); // Fetch a book by its MongoDB ID
    if (!book) {
      return res.status(404).json({ message: "Book not found" });
    }
    res.json(book);
  } catch (error) {
    res.status(500).json({ message: "Error fetching book", error });
  }
};

// Create a new book
export const createBook = async (req, res) => {
  try {
    const { title, author, description, price, inStock, genre, imagePath } = req.body;

    // Validate the required fields
    if (!title || !author || !description || !price || inStock === undefined || !genre || !imagePath) {
      return res.status(400).json({ message: "All fields are required" });
    }

    // Create a new book document
    const newBook = new Book({
      title,
      author,
      description,
      price,
      inStock,
      genre,
      imagePath,
    });

    // Save the new book to the database
    const savedBook = await newBook.save();
    res.status(201).json(savedBook);
  } catch (error) {
    res.status(400).json({ message: "Error creating book", error });
  }
};
