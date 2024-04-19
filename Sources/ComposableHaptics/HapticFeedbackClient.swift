import Dependencies
import DependenciesMacros
import Foundation

@DependencyClient
public struct HapticFeedbackClient: DependencyKey, Sendable {
    
    /// Perform a haptic feedback withouе preparing the feedback generator.
    @DependencyEndpoint(method: "perform")
    public var performWithoutPrepare: (HapticFeedback) -> Void
    
    /// Perform a haptic feedback, optionally preparing the generator.
    @DependencyEndpoint(method: "perform")
    public var perform: (HapticFeedback, _ shouldPrepareFeedbackGenerator: Bool) -> Void
}

extension DependencyValues {
    
    /// A dependency for creating haptics.
    public var hapticFeedbackClient: HapticFeedbackClient {
        get { self[HapticFeedbackClient.self] }
        set { self[HapticFeedbackClient.self] = newValue }
    }
}
