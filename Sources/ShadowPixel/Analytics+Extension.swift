import FirebaseAnalytics
import Foundation

extension Analytics {
    @objc class func shadow_logEvent(
        _ name: String, parameters: [String: Any]?
    ) {
        // Remember: the method implementations are exchanged (swizzled) this
        // calls the original Firebase logEvent method.
        Analytics.shadow_logEvent(name, parameters: parameters)

        // Log the event in ShadowPixel
        ShadowPixel.shared.logEvent(name, parameters: parameters)
    }

    static func swizzleLogEvent() {
        let originalSelector = #selector(logEvent(_:parameters:))
        let swizzledSelector = #selector(shadow_logEvent(_:parameters:))

        guard
            let originalMethod = class_getClassMethod(
                Analytics.self, originalSelector),
            let swizzledMethod = class_getClassMethod(
                Analytics.self, swizzledSelector)
        else { return }

        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}
