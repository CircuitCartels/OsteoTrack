# OsteoTrack

## Wearable Gait-Sensor Kit for Early Osteoarthritis Risk Screening

> **AI-Assisted Early Detection System for Osteoarthritis (OA) Risk Markers in NER**

---

## 🏆 Smart India Hackathon 2026

| **Project Information** | **Details** |
| ----------------------- | ----------- |
| **Problem Statement ID** | SIH26004 |
| **Problem Statement** | AI-Assisted Early Detection System for Osteoarthritis (OA) Risk Markers in NER |
| **Theme** | MedTech / HealthTech |
| **Category** | Hardware |
| **Team** | Circuit Cartels |
| **Project** | OsteoTrack |
| **Application** | OsteoTrack |

---

# 📱 About OsteoTrack

**OsteoTrack** is a wearable gait-sensor based concept designed for **early osteoarthritis (OA) risk screening**.

The system combines:

- 👤 Patient information
- 📝 OA-related symptoms
- 🚶 Objective gait and movement data
- 📡 Wearable sensor technology
- 💾 Offline-first mobile application
- 🤖 AI/ML-based risk analysis

The goal is to combine **objective sensor data + subjective symptoms** into a unified risk-screening workflow.

The concept is designed with an **offline-first and multilingual approach** to support use in low-resource settings and the **North Eastern Region (NER)**.

> ⚠️ **Disclaimer:** OsteoTrack is a research/prototype system intended for risk screening and demonstration. It is **not intended to provide a medical diagnosis**.

---

# 🎯 Problem We Are Addressing

Osteoarthritis is a major musculoskeletal condition that can affect mobility and quality of life.

Early identification of potential risk markers can help encourage timely screening and further clinical evaluation.

However, screening can be challenging in environments where:

- Advanced clinical infrastructure is limited
- Continuous gait assessment is difficult
- Specialist access may be limited
- Patient information and objective movement data are not combined into one workflow

### Our Approach

**OsteoTrack** explores a low-cost wearable and mobile-based approach for collecting and analyzing these signals.

```text
Patient Information
        +
OA Symptoms
        +
Gait / Movement Data
        ↓
Risk Analysis
        ↓
OA Risk Screening
```

---

# 💡 Our Solution

OsteoTrack is designed as an end-to-end **wearable + mobile + AI/ML ecosystem**.

```text
                         PATIENT
                            │
                            ▼
                  Patient Information
                            │
                            ▼
                  OA Symptom Assessment
                            │
                            ▼
                  Wearable Gait Assessment
                            │
                            ▼
                      IMU Sensor Data
                            │
                            ▼
                           ESP32
                            │
                            ▼
                 Flutter Mobile Application
                            │
                            ▼
                     Data Processing
                            │
                            ▼
                    AI/ML Risk Analysis
                            │
                            ▼
                  OA Risk Screening Result
```

---

# 📱 OsteoTrack — Android Prototype

**OsteoTrack** is the current Flutter-based Android application prototype developed for the project.

The prototype demonstrates the complete application workflow without requiring the physical wearable hardware.

For the current prototype, the gait-sensor input is simulated so that the complete workflow can be demonstrated.

### 🔄 Application Workflow

```text
Home
  ↓
Patient Information
  ↓
OA Symptoms
  ↓
Gait Assessment
  ↓
Sensor Simulation
  ↓
Risk Analysis
  ↓
Risk Screening Result
  ↓
Local Data Storage
```

---

# ✨ Key Features

## 👤 Patient Information

The application collects basic patient information required for the screening workflow.

---

## 📝 OA Symptom Assessment

Users can enter information related to osteoarthritis symptoms.

This represents the subjective component of the screening system.

---

## 🚶 Gait Assessment

The application provides a workflow for gait assessment.

For the current prototype, gait and sensor readings are simulated.

The planned implementation will replace the simulated data with actual movement data collected through wearable sensors.

---

## 💾 Offline-First Data Storage

OsteoTrack follows an **offline-first approach**.

The current application uses **SQLite** for local data storage.

```text
User
  ↓
Flutter Application
  ↓
SQLite
  ↓
Local Assessment Data
```

---

# 🏗️ System Architecture

```text
                  ┌──────────────────────────────────┐
                  │      OSTEO TRACK ECOSYSTEM       │
                  └──────────────────────────────────┘

                     FLUTTER ANDROID APP
                              │
          ┌───────────────────┼───────────────────┐
          │                   │                   │
          ▼                   ▼                   ▼
   Patient Information   OA Symptoms       Gait Assessment
          │                   │                   │
          └───────────────────┼───────────────────┘
                              │
                              ▼
                       Risk Analysis
                              │
                              ▼
                     Screening Result
                              │
               ┌──────────────┴──────────────┐
               │                             │
               ▼                             ▼
          DATA LAYER                    AI / ML LAYER
               │                             │
             SQLite                 Decision Tree /
                                     Small Neural Network
                                             │
                                             ▼
                                      TensorFlow Lite


               ┌───────────────────────────────┐
               │       PLANNED HARDWARE        │
               └───────────────────────────────┘
                              │
                       MPU6050 / MPU9250
                              │
                              ▼
                            ESP32
                              │
                              ▼
                          Bluetooth
                              │
                              ▼
                    Flutter Application
```

---

# 🛠️ Technology Stack

## 📱 Mobile Application

### Flutter

Used to develop the Android application, user interface, navigation, and application workflow.

### Dart

Programming language used for Flutter application development.

---

## 💾 Database

### SQLite

Used for:

- Local data storage
- Offline-first functionality
- Storing assessment-related information

---

## 🔌 Planned Hardware

### ESP32

The ESP32 is planned as the wearable sensor controller.

Expected responsibilities include:

- Sensor communication
- Movement-data collection
- Bluetooth communication
- Sending sensor data to the mobile application

### MPU6050 / MPU9250

The MPU6050 / MPU9250 IMU is planned for collecting movement and gait-related data.

The sensor can provide motion-related information that can later be processed for gait analysis.

---

# 🔌 Planned Hardware Workflow

```text
        ┌──────────────────────┐
        │   MPU6050 / MPU9250  │
        └──────────┬───────────┘
                   │
                   │ Motion Data
                   ▼
        ┌──────────────────────┐
        │        ESP32         │
        └──────────┬───────────┘
                   │
                   │ Bluetooth
                   ▼
        ┌──────────────────────┐
        │  Flutter Android App │
        └──────────┬───────────┘
                   │
                   ▼
        ┌──────────────────────┐
        │  Feature Processing  │
        └──────────┬───────────┘
                   │
                   ▼
        ┌──────────────────────┐
        │     AI / ML Model    │
        └──────────┬───────────┘
                   │
                   ▼
        ┌──────────────────────┐
        │   OA Risk Screening  │
        │       Result         │
        └──────────────────────┘
```

---

# 🌐 Offline-First Architecture

One of the important design considerations of OsteoTrack is **offline usability**.

```text
             USER
               │
               ▼
      Flutter Application
               │
               ▼
      Local SQLite Database
               │
               ▼
      Assessment Information
               │
               ▼
          Risk Analysis
```

This approach is intended to support the application in environments where reliable internet connectivity may not always be available.

---

# 🤖 Planned AI / ML Layer

The future version of OsteoTrack is planned to include an AI/ML model for risk prediction.

Potential model approaches include:

- Decision Tree
- Small Neural Network
- TensorFlow Lite deployment

The current prototype does **not** represent a clinically validated AI diagnostic model.

The AI/ML layer is part of the planned development of the project.

---

# 🔬 Research Foundation

The project concept references research and resources including:

- Smart India Hackathon 2026 official problem statement
- Osteoarthritis Initiative (OAI) public dataset
- Research on predicting severe knee arthritis using inertial measurement units
- Research on knee joint kinematics using wearable sensor data
- Research on TinyML-enabled wearable systems for early detection of knee osteoarthritis
- WHO / ICMR guidance related to musculoskeletal screening and low-resource settings

The project also includes clinical insights obtained through expert consultation related to osteoarthritis.

---

# 👥 Team — Circuit Cartels

## Circuit Cartels

**Circuit Cartels** is the team behind the **OsteoTrack** project developed for **Smart India Hackathon 2026**.

The project combines multiple areas of development and research:

- 🧠 Problem research
- 🏥 Healthcare / clinical problem understanding
- 🔌 Hardware planning
- 📡 Wearable sensor architecture
- 📱 Mobile application development
- 🤖 AI/ML planning
- 🔗 System integration
- 🧪 Testing
- 📚 Documentation
- 🎤 Presentation

### 🤝 Team Contribution

The overall OsteoTrack solution is a collaborative team effort involving research, system planning, hardware architecture, software development, AI/ML planning, testing, documentation, and presentation.

The **OsteoTrack Android application prototype** was developed by the software/application development contributor as part of the Circuit Cartels team.

---

# 📂 Project Structure

```text
OsteoTrack/
│
├── android/                  # Android platform files
├── ios/                      # iOS platform files
├── linux/                    # Linux platform files
├── macos/                    # macOS platform files
├── windows/                  # Windows platform files
│
├── lib/                      # Main Flutter / Dart application
├── web/                      # Flutter Web configuration
├── test/                     # Application tests
├── build/                    # Generated build files
│
├── pubspec.yaml              # Flutter dependencies & configuration
├── pubspec.lock              # Locked dependency versions
├── analysis_options.yaml     # Dart analysis configuration
└── README.md                 # Project documentation
```

---

# 🔄 Complete System Workflow

```text
                   PATIENT
                      │
                      ▼
             Patient Information
                      │
                      ▼
              OA Symptom Assessment
                      │
                      ▼
              Gait Assessment
                      │
                      ▼
             Wearable Sensor Data
                      │
                      ▼
                     ESP32
                      │
                      ▼
                   Bluetooth
                      │
                      ▼
             Flutter Application
                      │
                      ▼
               Data Processing
                      │
                      ▼
                AI / ML Model
                      │
                      ▼
             OA Risk Screening
                      │
                      ▼
              Screening Result
```

---

# 🌟 Project Vision

OsteoTrack explores how **wearable sensing, mobile applications, offline-first architecture, and AI/ML** can be brought together into a single screening workflow.

```text
Wearable Sensing
       +
Mobile Technology
       +
AI / ML
       +
Offline-First Architecture
       ↓
Early OA Risk Screening
```

The long-term concept is to evolve the current prototype into a system capable of working with real wearable gait-sensor data and a trained AI/ML risk-prediction model.

---

# 🚀 Future Development

Planned improvements include:

- 🔌 Integration with real ESP32 hardware
- 📡 Bluetooth-based sensor communication
- 🚶 Real-time gait and movement data collection
- 📊 Advanced gait feature extraction
- 🤖 Trained AI/ML risk prediction model
- 📱 TensorFlow Lite integration
- 🌐 Multilingual support
- 💾 Improved offline data management
- 🧪 Further testing and validation
- 🏥 Clinical evaluation and research validation

---

# ⚠️ Important Disclaimer

OsteoTrack is currently a **prototype/research demonstration system**.

The current gait-sensor input is simulated and the system is **not a medically validated diagnostic device**.

The screening result should not be considered a medical diagnosis.

Further hardware development, AI/ML validation, clinical testing, and regulatory evaluation would be required before any real-world medical deployment.

---

# 📌 Project Status

**🟢 Working Prototype**

### OsteoTrack
**Wearable Gait-Sensor Kit for Early Osteoarthritis Risk Screening**

**Smart India Hackathon 2026**

**Problem Statement:** SIH26004

**Theme:** MedTech / HealthTech

**Category:** Hardware

**Team:** Circuit Cartels

---

# 👥 Circuit Cartels

### Building OsteoTrack for Smart India Hackathon 2026

> **Wearable Sensing + Mobile Technology + AI/ML for Early Osteoarthritis Risk Screening**

---

## ⭐ Built With

**Flutter • Dart • SQLite • ESP32 • MPU6050 / MPU9250 • AI/ML • TensorFlow Lite**

---

##  OsteoTrack

**Technology for early osteoarthritis risk screening through wearable sensing and intelligent mobile workflows.**

---
