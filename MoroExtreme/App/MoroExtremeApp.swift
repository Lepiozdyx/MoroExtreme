import SwiftUI

@main
struct MoroExtremeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            SourceView()
        }
    }
}
