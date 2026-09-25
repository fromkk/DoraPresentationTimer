//
//  TimerEngine.swift
//  DoraPresentationTimer
//
//  Created by saki iwamoto on 2026/01/23.
//

import Foundation

protocol TimerTicking {
    /// 一定間隔でイベントが流れるストリームを作る
    func ticks() -> AsyncStream<Void>
}

struct TimerEngine: TimerTicking {
    private let interval: Duration

    init(interval: Duration = .seconds(1)) {
        self.interval = interval
    }

    func ticks() -> AsyncStream<Void> {
        AsyncStream { continuation in
            let task = Task {
                // 締切を絶対時刻で進める
                var deadline = ContinuousClock.now
                while !Task.isCancelled {
                    deadline = deadline.advanced(by: interval)
                    try? await Task.sleep(until: deadline, clock: .continuous)
                    guard !Task.isCancelled else { break }

                    continuation.yield(())
                }
                continuation.finish()
            }

            continuation.onTermination = { _ in task.cancel() }
        }
    }
}
