import mongoose from 'mongoose';

const bookSchema = new mongoose.Schema(
  {
    title: { type: String, required: true }, // Book title
    author: {
      name: { type: String, required: true }, // Author's name
      bio: { type: String }, // Optional author biography
    },
    description: { type: String, required: true }, // Book description
    price: { type: Number, required: true, min: 0 }, // Book price
    inStock: { type: Number, required: true, min: 0 }, // Number of books in stock
    genre: { type: String, required: true }, // Genre (e.g., Fiction, Fantasy)
    imagePath: { type: String, required: true }, // Path to the book image
  },
  {
    timestamps: true, // Adds createdAt and updatedAt fields automatically
  }
);

// Create the Book model
const Book = mongoose.model('Book', bookSchema);

export default Book;
