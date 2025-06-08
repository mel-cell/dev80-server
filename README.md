# dev80-server - Development Environment for PHP & Laravel 🧱

> Aku membuat sistem ini agar bisa kerja dengan cepat dan rapi.  
> Tidak perlu install manual Apache, MySQL, atau phpMyAdmin.  
> Cukup satu script kontrol: `dev80`, dan semua service jalan lancar di Fedora Linux.

---

## 🔍 Tujuan Sistem Ini

Aku membuat sistem ini karena ingin punya lingkungan pengembangan lokal yang:

- ✅ Ringan dan stabil  
- ✅ Bisa jalankan banyak proyek PHP / Laravel sekaligus  
- ✅ Bisa diakses via browser seperti Laragon  
- ✅ Dikontrol lewat terminal (`dev80`)  
- ✅ Tidak bentrok port  
- ✅ Mudah dibawa ke mana-mana  

Dan yang paling penting:
> ❗ Tidak perlu GUI berat dulu — fokus ke CLI yang powerful.

Tapi nanti aku rencana akan tambah **GUI sederhana** sebagai antarmuka desktop (seperti Electron.js), biar lebih mudah dipakai teman atau orang lain.

---

## 📁 Struktur Folder
```
~/monorepo-devenv/
├── docker-compose.yml ← Konfigurasi Docker Compose
├── dev80 ← Script kontrol utama
├── www/ ← Tempat semua proyek PHP/Laravel
└── README.md ← File ini
```
---

## 🚀 Cara Kerjanya

### 1. Jalankan semua service sekali klik:
```bash
dev80 start
```
### 2.Akses web kamu:
```bash
Web PHP: http://localhost:8888
phpMyAdmin: http://localhost:8080
MySQL Database: localhost:3306
```
### 3. Kelola service:
```
dev80 stop       # Hentikan semua service
dev80 restart    # Restart service
dev80 logs       # Lihat log langsung
dev80 mysql      # Masuk ke MySQL shell
dev80 enter apache-php   # Masuk ke container Apache
```
## 🧪 Informasi Database
Host: localhost
Port: 3306
Username: root
Password: root
phpMyAdmin: http://localhost:8080

## 🎯 Pengembangan Selanjutnya:
Karena aku sudah punya fondasi kuat di CLI, langkah selanjutnya adalah membuat GUI: 
### ✅ Membuat antarmuka desktop menggunakan Electron.js
➡ Agar bisa kontrol start/stop/logs dari aplikasi desktop tanpa buka terminal

Rencana GUI:
- Tombol Start/Stop/Restart
- Log langsung muncul di window
- List semua proyek di www/
- Tombol buka browser otomatis
- Backup database satu klik

## 📦 Catatan Tambahan
- Semua service berjalan lewat Docker Compose
- Bisa dikembangkan untuk support Node.js, Python, Go
- Cocok untuk developer full-stack di Linux (Fedora)
- Desain modular → tinggal tambah fitur sesuai kebutuhan
