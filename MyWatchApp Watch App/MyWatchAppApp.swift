//
//  MyWatchAppApp.swift
//  MyWatchApp Watch App
//
//  Created by Tomas Kafka on 25.09.2023.
//

import SwiftUI
import SwiftData
import MyKit3

@main
struct MyWatchApp_Watch_AppApp: App {
	var sharedModelContainer: ModelContainer = {
			let schema = Schema([
					Item.self,
			])
			let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

			do {
					return try ModelContainer(for: schema, configurations: [modelConfiguration])
			} catch {
					fatalError("Could not create ModelContainer: \(error)")
			}
	}()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
				.modelContainer(sharedModelContainer)
    }
}
