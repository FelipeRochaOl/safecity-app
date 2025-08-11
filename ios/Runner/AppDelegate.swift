import Flutter
import UIKit
import GoogleMaps
// import FirebaseCore
// import FirebaseFirestore
// import FirebaseAuth

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyAKTKlCiySOc6QRL53NW8k75AvfgIdmMIA")
    // FirebaseApp.configure()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
