//
//  MyWidgets.swift
//  MyWidgets
//
//  Created by Tomas Kafka on 25.09.2023.
//

import WidgetKit
import SwiftUI
import MyKit

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
			SimpleEntry(myEnum: .one, date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(myEnum: .one, date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
						let entry = SimpleEntry(myEnum: .one, date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
	let myEnum: MyEnum
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct MyWidgetsEntryView : View {
    var entry: Provider.Entry
		

    var body: some View {
        VStack {
            Text("OneOrTwo:")
					Text(entry.myEnum.str)

						Text("Time:")
            Text(entry.date, style: .time)

            Text("Favorite Emoji:")
            Text(entry.configuration.favoriteEmoji)
        }
    }
}

struct MyWidgets: Widget {
    let kind: String = "MyWidgets"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            MyWidgetsEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    MyWidgets()
} timeline: {
	SimpleEntry(myEnum: .one, date: .now, configuration: .smiley)
	SimpleEntry(myEnum: .two, date: .now, configuration: .starEyes)
}
