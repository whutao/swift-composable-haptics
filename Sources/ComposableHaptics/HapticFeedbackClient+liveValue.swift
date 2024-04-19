import UIKit

extension HapticFeedbackClient {

    public static let liveValue: HapticFeedbackClient = {
        let perform: (HapticFeedback, Bool) -> Void = { hapticFeedback, shouldPrepare in
            switch hapticFeedback {
            case let .impact(impact):
                let style: UIImpactFeedbackGenerator.FeedbackStyle = {
                    return switch impact {
                    case .light: .light
                    case .medium: .medium
                    case .heavy: .heavy
                    case .soft: .soft
                    case .rigid: .rigid
                    }
                }()
                let generator = UIImpactFeedbackGenerator(style: style)
                if shouldPrepare {
                    generator.prepare()
                }
                generator.impactOccurred()
            case let .notification(notification):
                let style: UINotificationFeedbackGenerator.FeedbackType = {
                    return switch notification {
                    case .error: .error
                    case .success: .success
                    case .warning: .warning
                    }
                }()
                let generator = UINotificationFeedbackGenerator()
                if shouldPrepare {
                    generator.prepare()
                }
                generator.notificationOccurred(style)
            case .selection:
                let generator = UISelectionFeedbackGenerator()
                if shouldPrepare {
                    generator.prepare()
                }
                generator.selectionChanged()
            }
        }
        return HapticFeedbackClient(
            performWithoutPrepare: { hapticFeedback in
                perform(hapticFeedback, false)
            },
            perform: perform
        )
    }()
}
