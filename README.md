# test_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




// Files affected in this project
android/app/src/main/androidmanifest.xml -> read_phone_state  -> read_call_log
//<receiver>....</receiver>

//Create kotlin broadcast receiver
android/app/src/main/kotlin/<Your/package> -> created CallReceiver.kt
Setup method channel in MainActivity.kt

//Flutter side - listen to platform channel
lib/features/call_listener/logic/call_channel.dart
// Flutter UI to show number
lib/features/call_listener/ui/call_display_screen.dart
lib/main.dart

// Add namespace in telephony plugin
cd ~/.pub-cache/hosted/pub.dev/
ls | grep telephony
cd telephony-0.2.0/android/

// open the file using the code editor
code build.gradle

// Add namespace to the android block
android {
    namespace 'com.shounakmulay.telephony'
    compileSdkVersion 33

    defaultConfig{
        ...
        ...
    }
}
// finally
flutter clean
flutter pub get

Important Note:
Every time you clear the pub cache (via flutter pub cache repair or upgrade the plugin), you might need to repeat this step unless the plugin is updated officially.

If this works and you'd like, I can also show you how to fork the plugin and keep your own fixed version so it never breaks again.


// What just happens here? 
-> A native BroadCastReceiver (CallReceiver.kt) listens for incomming calls.
-> A method channel in MainActivity.kt that connects native Android to flutter.

// Added Method Channel Listener-> lib/screens.call_screen.dart
// main.dart points to-> CallScreen().