import ActivityKit
import Foundation

struct PillActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var title: String
        var subtitle: String
        var progress: Double
        var updatedAt: Date
    }

    var activityName: String
}
