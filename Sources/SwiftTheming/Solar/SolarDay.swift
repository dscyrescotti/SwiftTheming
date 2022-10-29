import Foundation

/// A struct that encapsulates the time of sunrise and sunset to automatically switch theme of the app.
public struct SolarDay {
    /// A sunrise time of the current day.
    public var sunrise: Date {
        Self.solarDay(time: UserDefaults.get(SolarTime.self, key: .sunrise) ?? .sunrise)
    }
    /// A sunset time of the current day.
    public var sunset: Date {
        Self.solarDay(time: UserDefaults.get(SolarTime.self, key: .sunset) ?? .sunset)
    }
    
    private init() { }
    
    /// A current solar day.
    public static let current: SolarDay = .init()
    
    private static func solarDay(time: SolarTime) -> Date {
        var calendar = Calendar.current
        calendar.timeZone = .current
        return calendar.date(bySettingHour: time.hour, minute: time.minute, second: time.second, of: Date()) ?? Date()
    }
    
    /// A current solar period of the solar day.
    public var solarPeriod: SolarPeriod {
        isDaytime ? .day : .night
    }
    
    internal var nextSolarTime: Date {
        switch solarPeriod {
        case .day:
            return sunset
        case .night:
            return sunrise
        }
    }
    
    private var isDaytime: Bool {
        let beginningOfDay = sunrise.timeIntervalSince1970
        let endOfDay = sunset.timeIntervalSince1970
        let currentTime = Date().timeIntervalSince1970
        
        let isSunriseOrLater = currentTime >= beginningOfDay
        let isBeforeSunset = currentTime < endOfDay
        
        return isSunriseOrLater && isBeforeSunset
    }
    
    /// A method that allows to set the period of solar time. It is important to note that the method will save solar period only if sunrise time is less than sunset time.
    /// - Parameters:
    ///   - sunrise: a solar time for sunrise of a day.
    ///   - sunset: a solar time for sunset of a day.
    public func setSolarTime(from sunrise: SolarTime, to sunset: SolarTime) {
        guard sunrise < sunset else { return }
        UserDefaults.set(sunrise, key: .sunrise)
        UserDefaults.set(sunset, key: .sunset)
    }
}
