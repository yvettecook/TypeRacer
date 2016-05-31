import RxSwift

struct RaceViewModel {

    var originalText: TextSample
    var typingRight: Observable<Bool>

    private let disposeBag = DisposeBag()

    static func withDependencies(userTyping: Observable<String>) -> RaceViewModel {
        let originalText = TextSample(text: "Random text sample")
        return RaceViewModel(userTyping: userTyping, originalText: originalText)
    }

    init(userTyping: Observable<String>, originalText: TextSample) {
        self.originalText = originalText
        self.typingRight = userTyping
            .map {
                originalText.matchesAgainstString($0)
            }
    }

}
