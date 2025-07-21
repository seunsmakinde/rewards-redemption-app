# Rewards Redemption App

This is a simple rewards redemption application built with **Ruby on Rails** (v8.0.2 / Ruby 3.4.3). The app allows users to:

* View their current reward points balance
* Browse available rewards
* Redeem rewards using their points
* View a history of their redemptions

> _Database: SQLite | Frontend: Minimal web interface - CLI only_

---

## 🛠 Setup Instructions

### 1. Prerequisites

Ensure the following are installed:

* Ruby 3.4.3 (`rbenv` recommended)
* Rails 8.0.2
* SQLite3

### 2. Installation

```bash
git clone <repo_url> rewards-redemption-app
cd rewards-redemption-app/backend

bundle install
rails db:setup
```

This sets up the database with the appropriate tables.

---

## 🚀 Running the Server

```bash
rails server
```

Server will be available at `http://localhost:3000`.

---

## 🧪 Sample `curl` Requests

### 1. Create a User

```bash
curl -X POST http://localhost:3000/users \
  -H "Content-Type: application/json" \
  -d '{"name": "Alice", "points": 150}'
```

### 2. View User and Points Balance

```bash
curl http://localhost:3000/users/1
```

### 3. Create a Reward

```bash
curl -X POST http://localhost:3000/rewards \
  -H "Content-Type: application/json" \
  -d '{"title": "Free Coffee", "cost": 50}'
```

### 4. List All Rewards

```bash
curl http://localhost:3000/rewards
```

### 5. Redeem a Reward

```bash
curl -X POST http://localhost:3000/redemptions \
  -H "Content-Type: application/json" \
  -d '{"user_id": 1, "reward_id": 1}'
```

### 6. View Redemption History

```bash
curl "http://localhost:3000/redemptions?user_id=1"
```

---


### 🌱 Seeding the Database

To populate your local database with sample users, rewards, and redemptions, use the provided seed script. This helps you test and demo the application with pre-filled data.

#### Steps

1. Ensure your database is set up:

   ```bash
   bin/rails db:setup
   ```

   *This will create the database, run all migrations, and load the seed data.*

2. Or, if the database already exists:

   ```bash
   bin/rails db:seed
   ```

   *This will only load the seed data into the existing database.*

#### Seeded Data Includes:

* **3 Users** with varying point balances
* **3 Rewards** with different costs
* **Sample Redemptions** (e.g., Alice redeeming a Free Coffee)

This makes it easy to test features like balance checking, redemption, and reward browsing right away.


---

## 📚 API Summary

### Users

| Endpoint     | Method | Description                       |
| ------------ | ------ | --------------------------------- |
| `/users`     | GET    | List all users                    |
| `/users`     | POST   | Create a new user                 |
| `/users/:id` | GET    | Get user details & points balance |

### Rewards

| Endpoint       | Method | Description         |
| -------------- | ------ | ------------------- |
| `/rewards`     | GET    | List all rewards    |
| `/rewards`     | POST   | Create a new reward |
| `/rewards/:id` | GET    | Get reward details  |

### Redemptions

| Endpoint                 | Method | Description                                    |
| -------------------------| ------ | ---------------------------------------------- |
| `/redemptions?user_id=<>`| GET    | Get redemption history (by `user_id`)          |
| `/redemptions`           | POST   | Redeem a reward for a user                     |

---

## 🔐 Error Handling

The app gracefully handles common errors with descriptive messages:

* Invalid or missing parameters return `400 Bad Request`
* Not found resources return `404 Not Found`
* Insufficient points during redemption returns `422 Unprocessable Entity`

Example:

```json
{
  "error": "Insufficient points."
}
```

---

## ✅ Feature Coverage

| Feature                     | Status |
| --------------------------- | ------ |
| View user points balance    | ✅      |
| Browse available rewards    | ✅      |
| Redeem rewards using points | ✅      |
| View redemption history     | ✅      |

---

## 📌 Notes
* The app is ready for extension with a frontend (React) or additional user features.

---

## 👋 Author

Submitted by Seun Makinde
For: **Thanx** Take-Home Assessment
