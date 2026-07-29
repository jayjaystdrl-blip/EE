import ActivityKit
import SwiftUI
import WidgetKit

struct PillOverlayLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PillActivityAttributes.self) { context in
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "capsule.fill")
                    Text(context.state.title)
                        .font(.headline)
                }

                Text(context.state.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                ProgressView(value: context.state.progress)
            }
            .padding()
            .activityBackgroundTint(.black.opacity(0.9))
            .activitySystemActionForegroundColor(.white)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Image(systemName: "capsule.fill")
                }

                DynamicIslandExpandedRegion(.trailing) {
                    Text("\(Int(context.state.progress * 100))%")
                        .monospacedDigit()
                }

                DynamicIslandExpandedRegion(.center) {
                    Text(context.state.title)
                        .font(.headline)
                }

                DynamicIslandExpandedRegion(.bottom) {
                    VStack(spacing: 4) {
                        Text(context.state.subtitle)
                            .font(.caption)
                        ProgressView(value: context.state.progress)
                    }
                }
            } compactLeading: {
                Image(systemName: "capsule.fill")
            } compactTrailing: {
                Text("\(Int(context.state.progress * 100))")
                    .monospacedDigit()
            } minimal: {
                Image(systemName: "capsule.fill")
            }
            .widgetURL(URL(string: "pilloverlay://open"))
            .keylineTint(.white)
        }
    }
}
