# 🦀 Rust Detection AI

<div align="center">

### AI-Powered Rust Detection Mobile Application

Detect rust in metal structures using Computer Vision, YOLOv8, Flask APIs, Flutter, Docker, and AWS Cloud.

![Python](https://img.shields.io/badge/Python-3.11-blue?style=for-the-badge&logo=python)
![Flask](https://img.shields.io/badge/Flask-Backend-black?style=for-the-badge&logo=flask)
![YOLOv8](https://img.shields.io/badge/YOLOv8-Object_Detection-red?style=for-the-badge)
![Flutter](https://img.shields.io/badge/Flutter-Mobile_App-blue?style=for-the-badge&logo=flutter)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?style=for-the-badge&logo=docker)
![AWS](https://img.shields.io/badge/AWS-Cloud_Deployment-FF9900?style=for-the-badge&logo=amazonaws)

</div>

---

## 📖 Overview

Rust Detection AI is an end-to-end AI-powered application that detects rust in metal surfaces using **YOLOv8 Object Detection** and provides real-time analysis through a **Flutter Mobile Application**.

The project combines:

- 🤖 Artificial Intelligence
- 📱 Mobile Development
- 🌐 REST APIs
- ☁️ AWS Cloud Deployment
- 🐳 Docker Containerization
- 🔍 Computer Vision

Users can upload or capture images and instantly receive rust severity analysis.

---

## ✨ Key Features

### 🤖 AI Detection Engine

- YOLOv8-based rust detection
- Multiple rust region identification
- Real-time image inference
- Bounding box visualization

### 📊 Severity Classification

| Rust Level | Range |
|------------|--------|
| No Rust | 0% |
| Mild | 1–20% |
| Moderate | 21–55% |
| Severe | 56–100% |

### 📱 Mobile Application

- Gallery Upload
- Camera Capture
- Interactive UI
- Animated Results
- Detection History
- Share Results
- PDF Report Generation

### ☁️ Cloud Deployment

- Dockerized Backend
- AWS EC2 Hosting
- Production Deployment
- REST API Integration

---

## 🏗️ System Architecture

```text
┌─────────────────────┐
│ Flutter Mobile App  │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Flask REST API      │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ YOLOv8 Model        │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Severity Analysis   │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Detection Result    │
└─────────────────────┘
```

---

## 🛠️ Technology Stack

| Category | Technologies |
|-----------|-------------|
| Mobile App | Flutter |
| Backend | Flask |
| AI Model | YOLOv8 |
| Language | Python |
| Image Processing | OpenCV |
| Cloud | AWS EC2 |
| Containerization | Docker |
| Web Server | Gunicorn |
| Version Control | Git & GitHub |

---

## 📂 Project Structure

```bash
rust-detection-api/
│
├── models/
│   └── best.pt
│
├── app.py
├── requirements.txt
├── Dockerfile
├── .dockerignore
│
└── README.md
```

---

## 🚀 Installation

### Clone Repository

```bash
git clone https://github.com/Rakeshcrv/rust-detection-api.git
cd rust-detection-api
```

### Install Dependencies

```bash
pip install -r requirements.txt
```

### Run Backend

```bash
python app.py
```

Server:

```bash
http://localhost:5000
```

---

## 🐳 Docker Deployment

### Build Docker Image

```bash
docker build -t rust-api .
```

### Run Container

```bash
docker run -d -p 5000:5000 --restart always --name rust-server rust-api
```

### Verify Container

```bash
docker ps
```

---

## ☁️ AWS Deployment

The backend is deployed using:

- AWS EC2
- Docker
- Gunicorn

Deployment Workflow:

```text
GitHub
   │
   ▼
AWS EC2
   │
   ▼
Docker Container
   │
   ▼
Flask API
   │
   ▼
YOLOv8 Inference
```

---

## 📡 API Documentation

### Health Check

```http
GET /
```

Response:

```json
{
  "message": "Rust Detection API Running"
}
```

---

### Detect Rust

```http
POST /predict
```

Form Data:

```text
image : image_file
```

Response:

```json
{
  "severity": "Moderate",
  "rust_percentage": 45,
  "image": "base64_encoded_image"
}
```

---

## 🧪 Testing Performed

✅ Unit Testing  
✅ Integration Testing  
✅ Functional Testing  
✅ Usability Testing  
✅ Performance Testing  
✅ Security Testing  
✅ Compatibility Testing  
✅ Validation Testing  
✅ Accuracy Testing

---

## 📈 Project Workflow

```text
Image Upload
      │
      ▼
Flutter App
      │
      ▼
Flask API
      │
      ▼
YOLOv8 Detection
      │
      ▼
Severity Classification
      │
      ▼
Result Generation
      │
      ▼
History / Share / PDF
```

---

## 🎯 Future Enhancements

- User Authentication
- Cloud Database Integration
- Video-Based Detection
- Live Camera Analysis
- Segmentation-Based Rust Area Estimation
- Dashboard Analytics
- Play Store Release

---

## 👨‍💻 Author

### Rakesh Sirvi N

DevOps Engineer | Cloud Enthusiast | AI Developer

🌐 Portfolio: https://rakeshsirvi.site

💻 GitHub: https://github.com/Rakeshcrv

---

## ⭐ Support

If you found this project useful:

```text
⭐ Star this repository
🍴 Fork this repository
🚀 Share with others
```

---

<div align="center">

### Built with ❤️ using AI, Flutter, Docker & AWS

</div>
