import ActivityKit
import Foundation

@MainActor
final class LiveActivityController: ObservableObject {
    @Published private(set) var currentActivity: Activity<PillActivityAttributes>?

    func start(title: String, subtitle: String, progress: Double) {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else { return }

        let attributes = PillActivityAttributes(activityName: "PillOverlay")
        let state = PillActivityAttributes.ContentState(
            title: title,
            subtitle: subtitle,
            progress: progress,
            updatedAt: Date()
        )

        do {
            currentActivity = try Activity.request(
                attributes: attributes,
                content: ActivityContent(state: state, staleDate: nil),
                pushType: nil
            )
        } catch {
            print("Unable to start Live Activity: \(error)")
        }
    }

    func update(title: String, subtitle: String, progress: Double) {
        guard let activity = currentActivity else { return }

        let state = PillActivityAttributes.ContentState(
            title: title,
            subtitle: subtitle,
            progress: progress,
            updatedAt: Date()
        )

        Task {
            await activity.update(
                ActivityContent(state: state, staleDate: nil)
            )
        }
    }

    func stop() {
        guard let activity = currentActivity else { return }

        Task {
            let finalState = activity.content.state
            await activity.end(
                ActivityContent(state: finalState, staleDate: nil),
                dismissalPolicy: .immediate
            )
            currentActivity = nil
        }
    }
}
