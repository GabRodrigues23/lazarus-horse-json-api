# Lazarus + Horse JSON API

A simple **REST API** built with **Lazarus (Free Pascal)** and the **Horse framework**, using the [`Horse.Jhonson`](https://github.com/HashLoad/jhonson) middleware for JSON parsing.  
This project is for **study purposes only**, demonstrating how to handle JSON data in memory without a database.

---

## 🚀 Features
- **POST /users** → Save JSON data in memory.  
- **GET /users** → Retrieve the last JSON saved.  
- Returns JSON responses with proper `Content-Type`.  
- Uses `fpjson` to handle JSON objects in Free Pascal.  

---

## 🛠️ Requirements
- [Lazarus IDE](https://www.lazarus-ide.org/) (with Free Pascal).  
- [Horse Framework](https://github.com/HashLoad/horse).  
- [Horse Jhonson Middleware](https://github.com/HashLoad/jhonson).  

---

## ▶️ Running the Project
1. Clone the repository:  
   ```bash
   git clone https://github.com/GabRodrigues23/lazarus-horse-json-api.git
   cd lazarus-horse-json-api
   ```

2. Open the project in **Lazarus** and compile.  

3. Run the executable:  
   ```bash
   ./backend
   ```

4. The API will be available at:  
   ```
   http://localhost:9000
   ```

---

## 📡 API Endpoints

### **POST /users**
Save a JSON object in memory.

- **Request**
  ```http
  POST /users HTTP/1.1
  Host: localhost:9000
  Content-Type: application/json

  {
    "name": "Gabriel R",
    "age": 23
  }
  ```

- **Response**
  ```json
  {
    "name": "Gabriel R",
    "age": 23
  }
  ```

---

### **GET /users**
Retrieve the last saved JSON.

- **Request**
  ```http
  GET /users HTTP/1.1
  Host: localhost:9000
  ```

- **Response (if JSON exists)**
  ```json
  {
    "name": "Gabriel R",
    "age": 23
  }
  ```

- **Response (if no JSON saved yet)**
  ```json
  {
    "message": "Nenhum JSON Recebido ainda. Use o metodo POST."
  }
  ```

---

## 📖 Notes
- The data is stored only **in memory** (global variable).  
- Once the server restarts, the data will be lost.  
- Intended for **learning and demonstration purposes** only.  

---

## 📜 License
MIT License. Free to use and modify for educational purposes.
