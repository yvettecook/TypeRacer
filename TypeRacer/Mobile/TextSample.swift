import Foundation

struct TextSample {

    let text: String

    init(text: String) {
        self.text = text
    }

    func matchesAgainstString(string: String) -> Bool {
        return text.matches(string)
    }

    
}

extension String {

    func matches(string: String) -> Bool {
        return string == self.substringToIndex(string.endIndex)
    }

}