import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var liveActivity: LiveActivityController
    @State private var title = "Pill Overlay"
    @State private var subtitle = "Live Activity is ready"
    @State private var progress = 0.35

    var body: some View {
        ZStack(alignment: .top) {
            NavigationStack {
                Form {
                    Section("Live Activity") {
                        TextField("Title", text: $title)
                        TextField("Subtitle", text: $subtitle)
                        Slider(value: $progress, in: 0...1)

                        Button("Start") {
                            liveActivity.start(
                                title: title,
                                subtitle: subtitle,
                                progress: progress
                            )
                        }

                        Button("Update") {
                            liveActivity.update(
                                title: title,
                                subtitle: subtitle,
                                progress: progress
                            )
                        }

                        Button("Stop", role: .destructive) {
                            liveActivity.stop()
                        }
                    }

                    Section("Notifications") {
                        Button("Send test notification in 5 seconds") {
                            NotificationManager.scheduleTestNotification()
                        }
                    }

                    Section("Limits") {
                        Text("The floating pill can remain above this app's own views. iOS does not permit third-party apps to keep a permanent overlay above other apps.")
                            .font(.footnote)
                    }
                }
                .navigationTitle("PillOverlay")
            }

            FloatingPillView(
                title: title,
                subtitle: subtitle,
                progress: progress
            )
            .padding(.top, 8)
        }
    }
}
