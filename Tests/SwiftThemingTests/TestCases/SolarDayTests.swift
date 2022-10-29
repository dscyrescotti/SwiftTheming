import XCTest
import SwiftUI
import ViewInspector
@testable import SwiftTheming

class SolarDayTests: XCTestCase {
    func testDefaultSolarDay() {
        UserDefaults.standard.removeObject(forKey: UserDefaults.Key.sunset.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaults.Key.sunrise.rawValue)
        let solarDay = SolarDay.current
        let components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        let date = "\(components.year!)-\(components.month!)-\(components.day!)"
        let sunrise = "\(date)T06:00:00+0630"
        let sunset = "\(date)T18:00:00+0630"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        XCTAssertEqual(solarDay.sunset, formatter.date(from: sunset)!)
        XCTAssertEqual(solarDay.sunrise, formatter.date(from: sunrise)!)
    }
    
    func testSolarTimeUserDefaultsKeys() {
        let sunset = UserDefaults.Key.sunset
        let sunrise = UserDefaults.Key.sunrise
        XCTAssertEqual(sunset.rawValue, "theming.sunset.key")
        XCTAssertEqual(sunrise.rawValue, "theming.sunrise.key")
    }
    
    func testSolarPeriod() {
        let solarDay = SolarDay.current
        let current = Date()
        var solarPeriod: SolarPeriod
        switch current {
        case ..<solarDay.sunrise:
            solarPeriod = .night
        case solarDay.sunrise..<solarDay.sunset:
            solarPeriod = .day
        case solarDay.sunset...:
            solarPeriod = .night
        default:
            solarPeriod = .day
            XCTAssert(false)
        }
        XCTAssertEqual(solarPeriod, solarDay.solarPeriod)
    }
    
    func testSolarTimeSaving() {
        UserDefaults.standard.removeObject(forKey: UserDefaults.Key.sunset.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaults.Key.sunrise.rawValue)
        let solarDay = SolarDay.current
        solarDay.setSolarTime(
            from: SolarTime(hour: 7, minute: 30, second: 0),
            to: SolarTime(hour: 19, minute: 30, second: 05)
        )
        let components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        let date = "\(components.year!)-\(components.month!)-\(components.day!)"
        let sunrise = "\(date)T07:30:00+0630"
        let sunset = "\(date)T19:30:05+0630"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        XCTAssertEqual(solarDay.sunset, formatter.date(from: sunset)!)
        XCTAssertEqual(solarDay.sunrise, formatter.date(from: sunrise)!)
    }
    
    func testAutomaticThemeSwitching() {
        UserDefaults.standard.removeObject(forKey: UserDefaults.Key.sunset.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaults.Key.sunrise.rawValue)
        let solarDay = SolarDay.current
        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: Date())
        solarDay.setSolarTime(
            from: SolarTime(hour: components.hour! - 1, minute: 0, second: 0),
            to: SolarTime(hour: components.hour!, minute: components.minute!, second: components.second! + 3)
        )
        XCTAssertEqual(solarDay.nextSolarTime, solarDay.sunset)
        let themeProvider = ThemeProvider.shared
        themeProvider.setPreferredAppearance(with: .automatic)
        themeProvider.setTheme(with: .jadoTheme)
        let sut = SolarTestView()
        let exp1 = sut.inspection.inspect(after: 0.5) { view in
            let inspected = try view.actualView().inspect()
            XCTAssertEqual(try inspected.vStack().color(0).value(), Color(hex: 0xDEF8EA))
            XCTAssertEqual(try inspected.vStack().text(1).attributes().font(), Font.title)
            XCTAssertEqual(try inspected.vStack().image(2).actualImage(), Image("sun"))
            XCTAssertEqual(try inspected.vStack().linearGradient(3).gradient(), Gradient(colors: [.green, .white]))
            XCTAssertEqual(try inspected.vStack().color(4).value(), Color(hex: 0x1e1e1f))
            XCTAssertEqual(solarDay.sunset, solarDay.nextSolarTime)
            XCTAssertNotNil(themeProvider.timer)
        }
        let exp2 = sut.inspection.inspect(after: 4) { view in
            let inspected = try view.actualView().inspect()
            XCTAssertEqual(try inspected.vStack().color(0).value(), Color(hex: 0x22442E))
            XCTAssertEqual(try inspected.vStack().text(1).attributes().font(), Font.title2)
            XCTAssertEqual(try inspected.vStack().image(2).actualImage(), Image("moon"))
            XCTAssertEqual(try inspected.vStack().linearGradient(3).gradient(), Gradient(colors: [.green, .black]))
            XCTAssertEqual(try inspected.vStack().color(4).value(), Color(hex: 0x1e1e1f))
            XCTAssertEqual(solarDay.sunrise, solarDay.nextSolarTime)
            XCTAssertNotNil(themeProvider.timer)
        }
        ViewHosting.host(view: sut.themeProviding())
        wait(for: [exp1, exp2], timeout: 6)
    }
}
