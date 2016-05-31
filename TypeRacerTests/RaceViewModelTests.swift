import XCTest
import RxSwift
import RxTests

@testable import TypeRacer

class RaceViewModelTests: XCTestCase {

    private var observer: TestableObserver<Bool>!
    private var scheduler: TestScheduler!

    let sampleText = TextSample(text: "Hello, world")

    var raceVM: RaceViewModel?

    let disposeBag = DisposeBag()

    override func setUp() {
        super.setUp()

        scheduler = TestScheduler(initialClock: 0)
        observer = scheduler.createObserver(Bool)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testValuesTrue() {
        // Given
        let testInput = ["", "H", "He", "Hel"].toObservable(scheduler)
        raceVM = RaceViewModel(userTyping: testInput, originalText: sampleText)

        // When
        raceVM?.typingRight
            .subscribe(observer)
            .addDisposableTo(disposeBag)

        scheduler.start()

        // Then
        let expectedEvents = [
            next(1, true),
            next(2, true),
            next(3, true),
            next(4, true),
            completed(5)
        ]

        XCTAssertEqual(observer.events, expectedEvents)
    }

    func testValuesFalse() {
        // Given
        let testInput = ["", "G", "Ge", "Gel"].toObservable(scheduler)
        raceVM = RaceViewModel(userTyping: testInput, originalText: sampleText)

        // When
        raceVM?.typingRight
            .subscribe(observer)
            .addDisposableTo(disposeBag)

        scheduler.start()

        // Then
        let expectedEvents = [
            next(1, true),
            next(2, false),
            next(3, false),
            next(4, false),
            completed(5)
        ]

        XCTAssertEqual(observer.events, expectedEvents)
    }


}
