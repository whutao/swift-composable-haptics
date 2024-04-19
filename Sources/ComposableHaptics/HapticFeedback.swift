import CasePaths
import Foundation

/// Haptic feedback kinds for all feedback generators in UIKit.
@CasePathable
public enum HapticFeedback: Sendable {
    
    /// An alias for `UIImpactFeedbackGenerator.FeedbackStyle`.
    @CasePathable
    public enum Impact: Sendable {
        case light
        case medium
        case heavy
        case soft
        case rigid
    }
    
    /// An alias for `UINotificationFeedbackGenerator.FeedbackType`.
    @CasePathable
    public enum Notification: Sendable {
        case success
        case warning
        case error
    }
    
    /// Feedback kind for `UIImpactFeedbackGenerator`.
    case impact(Impact)
    
    /// Feedback kind for `UINotificationFeedbackGenerator`.
    case notification(Notification)
    
    /// Feedback kind for `UISelectionFeedbackGenerator`.
    case selection
}
