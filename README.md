# Mora Jaya Hub - Gold Challenge Submission

## Project Overview

This project is part of the Gold Challenge for the Full Stack Web Development Bootcamp. It includes the following key features:
- **Authentication Pages**: Sign Up, Login, and Forgot Password functionality.
- **Home Page**: Displaying featured products dynamically fetched from the API.
- **Product Catalog Page**: A catalog that allows users to browse, search, filter, and sort products.

## Project Structure

├── backend/
│   ├── controllers/
│   │   ├── productController.js
│   │   └── userController.js
│   ├── models/
│   │   ├── productModel.js
│   │   └── userModel.js
│   ├── routes/
│   │   ├── productRoutes.js
│   │   └── userRoutes.js
│   ├── config/
│   │   ├── db.js
│   │   └── config.js
│   ├── middleware/
│   │   ├── authMiddleware.js 
│   │   └── errorMiddleware.js 
│   ├── server.js
│   ├── package.json
│   └── .env 
├── frontend/
│   ├── public/
│   │   ├── index.html
│   │   ├── product-catalog.html
│   │   ├── signup.html
│   │   ├── login.html
│   │   ├── forgot-password.html
│   │   └── assets/
│   │       ├── css/
│   │       │   ├── auth-styles.css
│   │       │   ├── catalog-styles.css
│   │       │   └── home-styles.css
│   │       ├── js/
│   │       │   ├── auth-scripts.js
│   │       │   ├── catalog-scripts.js
│   │       │   └── home-scripts.js
│   │       └── images/
└── README.md (optional)


## Prerequisites

Before running the project, ensure you have the following installed:
- Node.js
- PostgreSQL
- npm (Node Package Manager)

## Getting Started

### 1. Backend Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repo/mora-jaya-hub.git
   cd mora-jaya-hub/backend

2. **nstall Dependencies**:
npm install

3. **Set Up Environment Variables**:
Create a .env file in the backend directory with the following variables:
PORT=3000
DATABASE_URL=your_postgresql_connection_string
JWT_SECRET=your_jwt_secret

4. **Run Migrations (If using Sequelize)**:
npx sequelize-cli db:migrate

5. **Start the Backend Server**:
npm start
The backend server will start on http://localhost:3000.

### 2. Frontend Setup

1. **Navigate to the Frontend Directory**:
cd ../frontend

2. **Serve Static Files (If necessary)**:
You can use a simple HTTP server to serve the static files.
Run the following command:
npx http-server ./public
Open your browser and navigate to http://localhost:8080.

### 3. Using the Application

3.1 **Authentication Pages**

**Sign Up:**
Navigate to http://localhost:8080/signup.html.
Fill in the form with your desired username, email, password, and contact number.
Submit the form to create a new account.
On success, you will be redirected to the Login page.

**Login:**
Navigate to http://localhost:8080/login.html.
Enter your registered email and password.
Submit the form to log in.
On success, you will be redirected to the Home Page.

**Forgot Password:**
Navigate to http://localhost:8080/forgot-password.html.
Enter your registered email.
Submit the form to receive a password reset link via email.

3.2 **Home Page**
**View Featured Products:**
Navigate to http://localhost:8080/index.html.
Featured products will be dynamically loaded from the backend API.

3.3 **Product Catalog Page**
**Browse Products:**
Navigate to http://localhost:8080/product-catalog.html.
Use the search, filter, and sort options to find products.
Products are dynamically fetched from the backend and displayed based on the selected criteria.

## API Endpoints
**User Authentication**
Sign Up: POST /api/users
Login: POST /api/users/login
Forgot Password: POST /api/users/forgot-password

**Products**
Get Products: GET /api/products

## Additional Notes
Ensure your PostgreSQL database is running and accessible.
Customize the .env file with the correct database connection string and other configuration details.
If any issues arise, please check the console for error messages and ensure that the backend server is correctly connected to the database.

## Future Improvements
Implement additional features such as user profile management, shopping cart functionality, and order processing.
Optimize the API responses and improve the UI/UX design based on user feedback.
