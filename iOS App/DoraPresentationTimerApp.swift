//
//  DoraPresentationTimerApp.swift
//  DoraPresentationTimer
//
//  Created by totokit4_saki on 2022/11/06.
//

import SwiftUI

@main
struct DoraPresentationTimerApp: App {
    @State private var settingsStore: SettingsStore
    @State private var timerViewModel: TimerViewModel

    init() {
        let settingsStore = SettingsStore()
        _settingsStore = State(initialValue: settingsStore)
        _timerViewModel = State(initialValue: TimerViewModel(settingsStore: settingsStore))
    }

    var body: some Scene {
        WindowGroup {
            TimerView(viewModel: timerViewModel)
                .environment(settingsStore)
                .environment(\.locale, Locale(identifier: settingsStore.settings.language.localeIdentifier))
                .preferredColorScheme(settingsStore.settings.colorMode.colorScheme)
        }
    }
}
