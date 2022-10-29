/// A struct that encapsulates solar time of a specific period.
public struct SolarTime: Codable, Equatable, Comparable {
    public static func < (lhs: SolarTime, rhs: SolarTime) -> Bool {
        lhs.toSeconds() < rhs.toSeconds()
    }
    
    let hour: Int
    let minute: Int
    let second: Int
    
    public init(hour: Int, minute: Int, second: Int) {
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    internal static let sunrise = SolarTime(hour: 6, minute: 0, second: 0)
    internal static let sunset = SolarTime(hour: 18, minute: 0, second: 0)
    
    internal func toSeconds() -> Int {
        hour * 3600 + minute * 60 + second
    }
}

