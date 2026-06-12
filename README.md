# Repository untuk Soal Test Happy Puppy

## 📌 Requirement

Pastikan environment sudah terinstall:

* PHP >= 8.2
* PostgreSQL
* Node.js >= 20

---

## 🛠️ Spesifikasi Teknologi

### Backend

* Laravel 12

### Frontend

* Vue.js 3
* TypeScript

---

## 🚀 Cara Menjalankan Project

### 🔧 Menjalankan Backend (Laravel)

```bash
cd Laravel - Backend
cp .env example .env
composer install
php artisan key:generate
php artisan migrate
php artisan db:seed
php artisan serve
```

---

### 🎨 Menjalankan Frontend (Vue.js)

```bash
cd Vue - Front End
cp .env example .env
npm install
npm run dev
```

---

## 📑 Dokumentasi API

Dokumentasi API dapat diakses melalui:

```
http://localhost:8000/api/documentation
```

### 🔐 Credential Dokumentasi

* Username: `developer`
* Password: `123456`

---

## 🔑 Login Aplikasi

Gunakan akun berikut untuk login:

* Username: `administrator`
* Password: `123456`

---

## 📂 Struktur Project

```
├── Laravel - Backend   # API Laravel
└── Vue - Front End     # Frontend Vue.js
```

---

## 📖 Catatan

* Pastikan database PostgreSQL sudah dibuat sebelum menjalankan migrate
* Sesuaikan konfigurasi `.env` terutama:

  * Database
  * Port
  * API URL

---

## ✨ Author

Alexander Evan
