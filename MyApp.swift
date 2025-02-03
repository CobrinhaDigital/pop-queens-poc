import UIKit
import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        .landscapeLeft
    }
}

@main
struct MyApp: App {
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
