import SwiftUI
import UserNotifications

@main
struct PillOverlayApp: App {
    @StateObject private var liveActivity = LiveActivityController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(liveActivity)
                .task {
                    await requestNotificationPermission()
                }
        }
    }

    private func requestNotificationPermission() async {
        _ = try? await UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .badge, .sound])
    }
}
