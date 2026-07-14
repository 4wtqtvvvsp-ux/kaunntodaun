//
//  ________WidgetLiveActivity.swift
//  カウントダウンWidget
//
//  Created by Apple on 2025/11/12.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ________WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ________WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ________WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ________WidgetAttributes {
    fileprivate static var preview: ________WidgetAttributes {
        ________WidgetAttributes(name: "World")
    }
}

extension ________WidgetAttributes.ContentState {
    fileprivate static var smiley: ________WidgetAttributes.ContentState {
        ________WidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ________WidgetAttributes.ContentState {
         ________WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ________WidgetAttributes.preview) {
   ________WidgetLiveActivity()
} contentStates: {
    ________WidgetAttributes.ContentState.smiley
    ________WidgetAttributes.ContentState.starEyes
}
