import mongoose from 'mongoose';

const userSchema = new mongoose.Schema(
  {
    name: { 
      type: String, 
      required: true, 
      trim: true 
    }, // User's full name

    email: { 
      type: String, 
      required: true, 
      unique: true, 
      trim: true, 
      match: [/^\S+@\S+\.\S+$/, "Please use a valid email address"] 
    }, // Email address with validation

    password: { 
      type: String, 
      required: true, 
      minlength: 6 
    }, // User's hashed password
  },
  {
    timestamps: true, // Adds createdAt and updatedAt fields
  }
);

// Create the User model
const User = mongoose.model('User', userSchema);

export default User;
