# Stock Market App

Stock Market History Project

## System Information
- OS: Windows
- RAM: 16GB
- OS Version: 11


## Project Set-Up
Install Android Studio Latest Version [Android Studio Chipmunk | 2021.2.1 Patch 2]
```yaml
https://developer.android.com/studio
```

Download Flutter
```yaml
https://docs.flutter.dev/get-started/install
```

Clone Project
```yaml
git clone https://github.com/randomlee101/flutter-weather-app.git
```

Open Project In Android Studio
- Open Android Studio
- *File* > *Open*
- Proceed To The Location of The Cloned Repository and Select The Root Folder

_N.B:_ Install **Dart** and **Flutter** Plugins From Android Studio Market Place

Install All Packages Used For The Project
```yaml
flutter pub get
```

Auto-generate Models Using Freezed
```yaml
flutter pub run build_runner build --delete-conflicting-outputs
```

## State Management
Stateless widgets were employed across board to ensure a well-optimised application

States of children widgets were managed with Streams from the **rxdart** implementation and the **get_it** instance

## Run Flutter Application
Connect a virtual or physical device to Android Studio then run the following command in the terminal
```yaml
flutter run 
```

## Challenges & Extra Notes
I burnt through the available quota for API requests quite quickly but I was able to complete the task assigned.

A variable was initialized to append the API KEY to the request URL.

The **connectivity_plus** package was used to check if the user is connected to the internet via WiFi or Mobile Network.

Timeout was added to prevent an infinite get request.

## Conclusion
Thank you for reviewing this project! Recommendations and feedbacks are welcome and can be directed to the author below.

## Author
Daniel Folorunso | [folorunsodaniel5@gmail.com](mailto:folorunsodaniel5@gmail.com)

