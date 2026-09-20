//
//  DoraPresentationTimerWatchApp.swift
//  DoraPresentationTimerWatch Watch App
//
//  Created by saki iwamoto on 2026/08/14.
//

import SwiftUI

@main
struct DoraPresentationTimerWatchApp: App {
    @State private var settingsStore = SettingsStore()

    var body: some Scene {
        WindowGroup {
            WatchTimerView(viewModel: TimerViewModel(settingsStore: settingsStore))
                .environment(settingsStore)
                .environment(\.locale, Locale(identifier: settingsStore.settings.language.localeIdentifier))
                .preferredColorScheme(settingsStore.settings.colorMode.colorScheme)
        }
    }
}
