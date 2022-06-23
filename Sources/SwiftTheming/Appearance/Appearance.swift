import SwiftUI

enum Appearance<T: Equatable>: Equatable {
    case `static`(T)
    case dynamic(light: T, dark: T)
}
