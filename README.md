# 📦 Lost and Found Portal for College Hostel

A secure and user-friendly **Lost and Found Web Application** built using **JSP, Servlets, and MySQL**, designed specifically for college or hostel campuses to streamline the process of reporting and claiming lost or found items.

## 🛠 Tech Stack

- **Frontend**: HTML, CSS (Responsive UI)
- **Backend**: JSP, Servlets (Java EE)
- **Database**: MySQL
- **Other Tools**: JDBC, Apache Tomcat

---

## ✨ Features

🔐 **Authentication**
- Student login system using session tracking  
- Admin login with protected access

📤 **Report Lost or Found Item**
- Students can report lost or found items with details
- Found item allows image upload (stored securely)

🔍 **View Items**
- Filter items by type: Lost / Found
- Image privacy for found items until verified

📝 **Claim System**
- Students can claim an item with a custom message
- Claim goes for admin verification

🧑‍💼 **Admin Dashboard**
- View all claims with user & item details
- Approve or reject claims
- Once approved, item is marked as **Resolved** and image becomes visible

---

## 💡 How Privacy is Maintained

To prevent misuse:
- Images of **Found** items are hidden from public view.
- Only after a claim is **approved by admin**, the image becomes visible to the claimer.
- This ensures **only genuine users** can retrieve items.

---

## 🚀 How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/monikasenger/LostFoundApp.git
