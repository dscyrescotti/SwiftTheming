import SwiftUI

internal enum Appearance<T> {
    case `static`(T)
    case dynamic(light: T, dark: T)
}
