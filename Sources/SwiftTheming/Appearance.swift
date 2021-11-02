import SwiftUI

enum Appearance<T> {
    case `static`(T)
    case dynamic(light: T, dark: T)
}
