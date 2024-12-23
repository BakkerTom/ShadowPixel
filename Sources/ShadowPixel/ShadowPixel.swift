import FirebaseAnalytics
import Foundation

public final class ShadowPixel {
    nonisolated(unsafe) static var shared: ShadowPixel!

    public static func configure(options: ShadowPixelOptions) {
        ShadowPixel.shared = ShadowPixel(options: options)
        Analytics.swizzleLogEvent()
    }

    private let options: ShadowPixelOptions

    init(options: ShadowPixelOptions) {
        self.options = options
    }

    func logEvent(_ name: String, parameters: [String: Any]?) {
        let url = options.baseUrl.appendingQueryItems(
            queryItems: [
                baseQueryItems(for: parameters),
                eventQueryItems(for: name, parameters: parameters),
            ].flatMap { $0 })

        URLSession.shared.dataTask(with: url).resume()
    }

    private func baseQueryItems(for parameters: [String: Any]?)
        -> [URLQueryItem]
    {
        return [
            URLQueryItem(name: "instance_type", value: "app"),
            URLQueryItem(name: "device_type", value: "mobile"),
            URLQueryItem(name: "domain", value: options.domain),
            URLQueryItem(name: "os", value: options.os),
            URLQueryItem(name: "os_version", value: options.osVersion),
            URLQueryItem(name: "app_version", value: options.appVersion),
        ]
    }

    private func eventQueryItems(for name: String, parameters: [String: Any]?)
        -> [URLQueryItem]
    {
        guard let parameters else { return [] }

        var dataLayerPayload: String?
        if let jsonData = try? JSONSerialization.data(
            withJSONObject: parameters)
        {
            dataLayerPayload = String(data: jsonData, encoding: .utf8)?
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        }

        return [
            URLQueryItem(name: "event", value: name),
            URLQueryItem(
                name: "section", value: parameters["screen_category"] as? String
            ),
            URLQueryItem(
                name: "screen",
                value: parameters[AnalyticsParameterScreenName] as? String),
            URLQueryItem(name: "datalayer_payload", value: dataLayerPayload),
        ]
    }
}
