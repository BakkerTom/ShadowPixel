import Foundation

extension URL {
    func appendingQueryItems(queryItems: [URLQueryItem]) -> URL {
        if #available(iOS 16.0, *) {
            return self.appending(queryItems: queryItems)
        } else {
            guard var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else { return self }
            components.queryItems = (components.queryItems ?? []) + queryItems
            return components.url ?? self
        }
    }
}
