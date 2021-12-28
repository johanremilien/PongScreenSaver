
import Cocoa
import ScreenSaver

class ViewController: NSViewController {

    // MARK: - Properties
    private var saver: ScreenSaverView?
    private var timer: Timer?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addScreensaver()

        timer = Timer.scheduledTimer(withTimeInterval: 1.0/30,
                                     repeats: true) { [weak self] _ in
            self?.saver?.animateOneFrame()
        }
    }

    deinit {
        timer?.invalidate()
    }

    // MARK: - Helper Functions
    private func addScreensaver() {
        if let saver = PongView(frame: view.frame, isPreview: false) {
            view.addSubview(saver)
            self.saver = saver
        }
    }

}
