document.addEventListener('DOMContentLoaded', function() {

    const signupForm = document.getElementById('signup-form');
    if (signupForm) {
        signupForm.addEventListener('submit', async function(e) {
            e.preventDefault();
            const formData = new FormData(signupForm);
            const data = {
                username: formData.get('username'),
                email: formData.get('email'),
                password: formData.get('password'),
                contact_number: formData.get('contact_number')
            };

            try {
                const response = await fetch('http://localhost:3000/api/users', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(data)
                });
                if (response.ok) {
                    alert('Account created successfully!');
                    window.location.href = 'login.html';
                } else {
                    const result = await response.json();
                    alert('Sign Up failed: ' + result.message);
                }
            } catch (error) {
                console.error('Error during sign up:', error);
            }
        });
    }


    const loginForm = document.getElementById('login-form');
    if (loginForm) {
        loginForm.addEventListener('submit', async function(e) {
            e.preventDefault();
            const formData = new FormData(loginForm);
            const data = {
                email: formData.get('email'),
                password: formData.get('password')
            };

            try {
                const response = await fetch('http://localhost:3000/api/users/login', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(data)
                });
                if (response.ok) {
                    alert('Login successful!');
                    window.location.href = 'index.html';
                } else {
                    const result = await response.json();
                    alert('Login failed: ' + result.message);
                }
            } catch (error) {
                console.error('Error during login:', error);
            }
        });
    }

    
    const forgotPasswordForm = document.getElementById('forgot-password-form');
    if (forgotPasswordForm) {
        forgotPasswordForm.addEventListener('submit', async function(e) {
            e.preventDefault();
            const formData = new FormData(forgotPasswordForm);
            const data = {
                email: formData.get('email')
            };

            try {
                const response = await fetch('http://localhost:3000/api/users/forgot-password', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(data)
                });
                if (response.ok) {
                    alert('Password reset link sent to your email!');
                } else {
                    const result = await response.json();
                    alert('Failed to send password reset link: ' + result.message);
                }
            } catch (error) {
                console.error('Error during password reset:', error);
            }
        });
    }
});
