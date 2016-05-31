import UIKit

final class RaceView: UIView {

    let orginalTextView = UITextView()
    let typingTextView = UITextView()

    var textSample: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }

    convenience init() {
        self.init(frame: CGRect.zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        orginalTextView.backgroundColor = .lightGrayColor()
        orginalTextView.editable = false
        orginalTextView.font = UIFont.systemFontOfSize(16)

        typingTextView.backgroundColor = .whiteColor()
        typingTextView.textColor = .blackColor()
        typingTextView.editable = true
        typingTextView.font = UIFont.systemFontOfSize(16)

        self.backgroundColor = .whiteColor()
    }

    func setupLayout() {
        addSubview(orginalTextView)
        addSubview(typingTextView)

        orginalTextView.pinToSuperviewTop(withConstant: 8)
        orginalTextView.pinToSuperviewLeading(withConstant: 8)
        orginalTextView.pinToSuperviewTrailing(withConstant: 8)
        orginalTextView.addHeightConstraint(withConstant: 150)

        typingTextView.pinToSuperviewLeading(withConstant: 8)
        typingTextView.pinToSuperviewTrailing(withConstant: 8)
        typingTextView.attachToBottomOf(orginalTextView, withConstant: 20)
        typingTextView.addHeightConstraint(withConstant: 150)
    }

    func updateWithTextSample(sample: TextSample) {
        orginalTextView.text = sample.text
    }

}



