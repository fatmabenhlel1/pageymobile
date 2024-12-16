import User from '../models/userModel.js'; // Import the User model
import bcrypt from 'bcryptjs'; // For hashing the password
import jwt from 'jsonwebtoken';

// Register a new user
export const registerUser = async (req, res) => {
    try {
        const { name, email, password } = req.body;

        // Check if the email already exists
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ error: 'Email is already in use' });
        }

        // Hash the password
        const hashedPassword = await bcrypt.hash(password, 10);

        // Create a new user
        const newUser = new User({
            name,
            email,
            password: hashedPassword,
        });

        // Save the user in the database
        await newUser.save();

        res.status(201).json({
            message: 'User registered successfully',
            user: { id: newUser._id, name: newUser.name, email: newUser.email },
        });
    } catch (error) {
        res.status(500).json({ error: 'Registration failed', details: error.message });
    }
};


const JWT_SECRET = process.env.JWT_SECRET || 'your_secret_key';
export const loginUser = async (req, res) => {
    try {
        const { email, password } = req.body;

        // Check if user exists
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(401).json({ error: 'Invalid email or password' });
        }

        // Check if password matches
        const isPasswordValid = await bcrypt.compare(password, user.password);
        if (!isPasswordValid) {
            return res.status(401).json({ error: 'Invalid email or password' });
        }

        // Generate JWT token
        const token = jwt.sign({ id: user._id, email: user.email }, JWT_SECRET, { expiresIn: '1h' });

        // Send token in response
        res.json({
            message: 'Login successful',
            token,
            user: { id: user._id, name: user.name, email: user.email },
        });
    } catch (error) {
        res.status(500).json({ error: 'Login failed', details: error.message });
    }
};
export const getUserProfile = async (req, res) => {
    const { id } = req.params; // Extract user ID from request parameters
  
    try {
      // Find the user by ID and exclude the password field
      const user = await User.findById(id).select('-password');
      if (!user) {
        return res.status(404).json({ message: "User not found" });
      }
  
      // Return the user details
      res.status(200).json({
        user: {
          id: user._id,
          name: user.name,
          email: user.email,
        },
      });
    } catch (error) {
      console.error(error.message);
      res.status(500).json({ message: "Something went wrong", error: error.message });
    }
  };

  export const logoutUser = (req, res) => {
    try {
      // Clear the token or invalidate it (optional if you're using a blacklist mechanism)
      // Since JWT is stateless, a common practice is for the frontend to delete the token from localStorage.
  
      res.status(200).json({
        message: "User logged out successfully",
      });
    } catch (error) {
      console.error("Error during logout:", error);
      res.status(500).json({
        message: "Something went wrong during logout",
        error: error.message,
      });
    }
  };