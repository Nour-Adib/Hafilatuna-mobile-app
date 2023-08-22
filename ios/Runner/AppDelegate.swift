import UIKit
import Flutter
import flutter_config
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  NSString *apiKey = [FlutterConfigPlugin envFor:@"GMAPS_API_KEY"];
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey(apiKey)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
