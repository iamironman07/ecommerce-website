# E-Commerce Website

Full-stack shop with JWT authentication, product catalogue, shopping cart, transactional order
management and an admin role (product CRUD, order status).

**Stack:** Node.js, Express.js, MySQL, REST APIs, HTML/CSS/JavaScript, Bootstrap.

## Setup
```bash
mysql -u root -p < schema.sql
cp .env.example .env        # fill in DB password and JWT secret
npm install
npm start                   # http://localhost:3000
```
Make an admin: `UPDATE users SET role='admin' WHERE email='you@example.com';`

## API
| Method | Endpoint | Access |
|---|---|---|
| POST | /api/auth/register, /api/auth/login | public |
| GET | /api/products | public |
| POST/PUT/DELETE | /api/products[/:id] | admin |
| GET/POST/DELETE | /api/cart | user |
| POST | /api/orders (checkout), GET /api/orders/mine | user |
| GET, PATCH | /api/orders, /api/orders/:id/status | admin |
