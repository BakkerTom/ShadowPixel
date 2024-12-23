import UIKit

public struct ShadowPixelOptions {
    let baseUrl: URL
    let domain: String

    var os: String
    var osVersion: String
    var appVersion: String?

    public init(
        baseUrl: URL,
        domain: String,
        os: String = UIDevice.current.systemName,
        osVersion: String = UIDevice.current.systemVersion,
        appVersion: String? = Bundle.main.object(
            forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    ) {
        self.baseUrl = baseUrl
        self.domain = domain
        self.os = os
        self.osVersion = osVersion
        self.appVersion = appVersion
    }
}
