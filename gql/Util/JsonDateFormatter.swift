//
//  JsonDateFormatter.swift
//  gql
//
//  Created by Shaw Young on 2022/2/27.
//

import Foundation

class JsonDateFormatter {
    static let shared = JsonDateFormatter()
    
    let instance: DateFormatter
    
    private init() {
        let f = DateFormatter()
        f.locale = Locale(identifier: "en_US_POSIX")
        f.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        f.timeZone = TimeZone(secondsFromGMT: 0)
        self.instance = f
    }
    
    func extractDateFromString(createAt: String) -> Date? {
        var extracted: Date?
        extracted = instance.date(from: createAt)
        if extracted == nil {
            let fallbackFormatter = DateFormatter()
            fallbackFormatter.locale = Locale(identifier: "en_US_POSIX")
            fallbackFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
            fallbackFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            extracted = fallbackFormatter.date(from: createAt)
        }
        return extracted
    }
    
    static func timeDiffFromNow(previousDate: Date?) -> String? {
        guard let previousDate = previousDate else {
            return nil
        }

        let res: String
        let diff = previousDate.distance(to: Date())
        let minutes = diff / 60
        let hours = minutes / 60
        let days = hours / 24
        if days >= 1 {
            res = "\(Int(days))天前"
        } else if hours >= 1 {
            res = "\(Int(hours))小时前"
        } else if minutes >= 1 {
            res = "\(Int(minutes))分钟前"
        } else {
            res = "\(Int(diff))秒前"
        }
        return res
    }
}
