import Foundation
import UIKit

struct ListLanguageViewModel {
    let title: String
    let selector: [String]
    let selectedIndex: Int
    let rows: [Rows]
}

extension ListLanguageViewModel {
    struct Rows {
        let id: String
        let title: String
        let description: String
    }
}
