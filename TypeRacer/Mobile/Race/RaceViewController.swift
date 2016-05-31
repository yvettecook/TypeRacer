import UIKit
import RxSwift
import RxCocoa

final class RaceViewController: UIViewController {

    let raceView: RaceView
    let viewModel: RaceViewModel

    var bottomConstraint: NSLayoutConstraint!

    let disposeBag = DisposeBag()

    static func withDependencies() -> RaceViewController {
        let view = RaceView()
        return RaceViewController(view: view)
    }

    init(view: RaceView) {
        self.raceView = view

        let userTyping = raceView.typingTextView
            .rx_text
            .asObservable()

        self.viewModel = RaceViewModel.withDependencies(userTyping)

        super.init(nibName: nil, bundle: nil)

        raceView.updateWithTextSample(viewModel.originalText)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = UIView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupObservables()
    }

    private func setupLayout() {
        automaticallyAdjustsScrollViewInsets = false

        view.addSubview(raceView)
        raceView.pinToTopLayoutGuide(viewController: self)
        raceView.pinToSuperviewLeading()
        raceView.pinToSuperviewTrailing()
        raceView.pinToSuperviewBottom()
    }

    private func setupObservables() {

        viewModel.typingRight
            .subscribeNext { [weak self] typingRight in
                self?.raceView.backgroundColor = typingRight ? .greenColor() : .redColor()
            }.addDisposableTo(disposeBag)
    }

}
