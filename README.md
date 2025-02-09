# 📸 AI Image Reader

An AI-powered text recognition app built with **Flutter** and **Google ML Kit** to extract text from images. Users can capture an image or pick one from the gallery, and the app will recognize and display the text using **Google ML Kit's Text Recognition API**.

## 📌 Features
- 📷 Capture an image using the **camera**
- 🖼️ Pick an image from the **gallery**
- 🔍 Extract and display **recognized text** from images
- ⚡ Uses **Google ML Kit** for text recognition
- 🎨 Beautiful and intuitive UI

## 🚀 Getting Started

### **1. Prerequisites**
Make sure you have:
- Flutter installed: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK
- An Android or iOS device/emulator

### **2. Clone the Repository**
```sh
git clone https://github.com/your-username/ai-image-reader.git
cd ai-image-reader
```

### **3. Install Dependencies**
```sh
flutter pub get
```

### **4. Configure Firebase ML Kit**
- Ensure your Android `minSdkVersion` is at least **21** in `android/app/build.gradle`:
  ```gradle
  defaultConfig {
      minSdkVersion 21
      targetSdkVersion 33
  }
  ```

- Ensure `android/gradle.properties` contains:
  ```properties
  android.useAndroidX=true
  android.enableJetifier=true
  ```

### **5. Run the App**
For Android:
```sh
flutter run
```
For iOS:
```sh
cd ios && pod install && cd ..
flutter run
```

## 📂 Project Structure
```
lib/
│── main.dart            # Entry point of the app
│── home_page.dart       # UI & logic for image selection and text recognition
├── assets/
│   ├── Notepad.jpg      # Background asset
│   ├── Pin.png          # Pin icon asset
├── android/
├── ios/
├── pubspec.yaml         # Project dependencies
```

## 🛠 Dependencies
This project uses:
- **Flutter**: UI framework
- **Google ML Kit**: `google_ml_kit` for text recognition
- **Image Picker**: `image_picker` for selecting images

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_ml_kit: ^0.16.0
  image_picker: ^1.0.4
```

## 👨‍💻 Author
- **Ridham Patel** - [GitHub](https://github.com/your-username)

## 🌟 Contributing
Feel free to **fork** this repository and make improvements! Pull requests are welcome. 🚀

## 📜 License
This project is licensed under the **MIT License**.

---
🚀 **Happy Coding!** 🎯

