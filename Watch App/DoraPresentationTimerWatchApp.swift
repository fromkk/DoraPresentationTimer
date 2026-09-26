//
//  DoraPresentationTimerWatchApp.swift
//  DoraPresentationTimerWatch Watch App
//
//  Created by saki iwamoto on 2026/08/14.
//

import SwiftUI

@main
struct DoraPresentationTimerWatchApp: App {
    @State private var settingsStore: SettingsStore
    @State private var timerViewModel: TimerViewModel

    init() {
        let settingsStore = SettingsStore()
        _settingsStore = State(initialValue: settingsStore)
        _timerViewModel = State(initialValue: TimerViewModel(settingsStore: settingsStore))
    }

    var body: some Scene {
        WindowGroup {
            WatchTimerView(viewModel: timerViewModel)
                .environment(settingsStore)
                .environment(\.locale, Locale(identifier: settingsStore.settings.language.localeIdentifier))
                .preferredColorScheme(settingsStore.settings.colorMode.colorScheme)
        }
    }
}
