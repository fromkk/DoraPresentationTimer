//
//  DoraPresentationTimerApp.swift
//  DoraPresentationTimer
//
//  Created by totokit4_saki on 2022/11/06.
//

import SwiftUI

@main
struct DoraPresentationTimerApp: App {
    @State private var settingsStore = SettingsStore()

    var body: some Scene {
        WindowGroup {
            TimerView(viewModel: TimerViewModel(settingsStore: settingsStore))
                .environment(settingsStore)
                .environment(\.locale, Locale(identifier: settingsStore.settings.language.localeIdentifier))
                .preferredColorScheme(settingsStore.settings.colorMode.colorScheme)
        }
    }
}
