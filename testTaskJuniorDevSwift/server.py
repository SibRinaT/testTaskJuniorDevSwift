from flask import Flask, request, jsonify
import random
import secrets

app = Flask(__name__)

# In-memory data store for user information
users = []

# In-memory data store for OTPs (for simplicity, using a dictionary here)
otp_store = {}

# In-memory data store for temporary tokens
token_store = {}

# User model
class User:
    def __init__(self, first_name, phone_number, email, password):
        self.first_name = first_name
        self.phone_number = phone_number
        self.email = email
        self.password = password

# Generate a random 6-digit OTP
def generate_otp():
    return str(random.randint(100000, 999999))

# Generate a secure random token
def generate_token():
    return secrets.token_hex(16)

# Register endpoint
@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()

    # Check if all required fields are present
    if 'first_name' not in data or 'phone_number' not in data or 'email' not in data or 'password' not in data:
        return jsonify({'error': 'Missing required fields'}), 400

    # Check if the email is already registered
    if any(user.email == data['email'] for user in users):
        return jsonify({'error': 'Email already registered'}), 400

    # Create a new user
    new_user = User(
        data['first_name'],
        data['phone_number'],
        data['email'],
        data['password']
    )

    # Add the user to the in-memory data store
    users.append(new_user)

    return jsonify({'email': new_user.email, 'first_name': new_user.first_name, 'phone_number': new_user.phone_number}), 201

# Login endpoint
@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()

    # Check if all required fields are present
    if 'email' not in data or 'password' not in data:
        return jsonify({'error': 'Missing required fields'}), 400

    # Check if the user exists
    user = next((user for user in users if user.email == data['email']), None)

    if user is None or user.password != data['password']:
        return jsonify({'error': 'Invalid credentials'}), 401

    # Return a single user model upon successful login
    user_info = {
        'email': user.email,
        'first_name': user.first_name,
        'phone_number': user.phone_number,
    }

    return jsonify(user_info), 200

# Password recovery - Step 1: Request Password Reset
@app.route('/request-password-reset', methods=['POST'])
def request_password_reset():
    data = request.get_json()

    # Check if the email is provided
    if 'email' not in data:
        return jsonify({'error': 'Missing email field'}), 400

    # Check if the user with the provided email exists
    user = next((user for user in users if user.email == data['email']), None)

    if user is None:
        return jsonify({'error': 'User not found'}), 404

    # Generate and store a one-time password (OTP) for the user
    otp = generate_otp()
    otp_store[data['email']] = otp

    # In a real-world scenario, you would typically send the OTP via email
    # For simplicity, we'll return the OTP in the response
    return jsonify({'otp': otp, 'email': data['email']}), 200

# Password recovery - Step 2: Verify OTP
@app.route('/verify-otp', methods=['POST'])
def verify_otp():
    data = request.get_json()

    # Check if email and OTP are provided
    if 'email' not in data or 'otp' not in data:
        return jsonify({'error': 'Missing email or OTP field'}), 400

    # Check if the user with the provided email exists
    user = next((user for user in users if user.email == data['email']), None)

    if user is None:
        return jsonify({'error': 'User not found'}), 404

    # Check if the provided OTP is valid
    stored_otp = otp_store.get(data['email'])
    if stored_otp is None or data['otp'] != stored_otp:
        return jsonify({'error': 'Invalid OTP'}), 401

    # Clear the stored OTP as it's no longer needed
    del otp_store[data['email']]

    # Generate and store a temporary token for the user (for simplicity)
    token = generate_token()
    token_store[token] = user.email

    # Return the token in the response
    return jsonify({'token': token}), 200

# Password recovery - Step 3: Set New Password
@app.route('/set-new-password', methods=['POST'])
def set_new_password():
    data = request.get_json()

    # Check if token and new password are provided
    if 'token' not in data or 'new_password' not in data:
        return jsonify({'error': 'Missing token or new password field'}), 400

    # Check if the token is valid and retrieve the associated user email
    user_email = token_store.get(data['token'])

    if user_email is None:
        return jsonify({'error': 'Invalid or expired token'}), 401

    # Check if the user with the retrieved email exists
    user = next((user for user in users if user.email == user_email), None)

    if user is None:
        return jsonify({'error': 'User not found'}), 404

    # Update the user's password
    user.password = data['new_password']

    # Clear the used token from the token store
    del token_store[data['token']]

    # Return a success response
    return jsonify({'email': user.email}), 200
    
# Endpoint to get all users with passwords (for educational purposes only)
@app.route('/get-all-users-with-passwords', methods=['GET'])
def get_all_users_with_passwords():
    # For educational purposes only - DO NOT expose passwords in a real-world application
    users_with_passwords = [{'email': user.email, 'password': user.password} for user in users]
    return jsonify({'users': users_with_passwords}), 200

if __name__ == '__main__':
    app.run(debug=True)
