import Foundation
import UIKit

@IBDesignable
class CarouselItem: UIView {
    static let CAROUSEL_ITEM_NIB = "CarouselItem"
    
    @IBOutlet var vwContent: UIView!
    @IBOutlet var vwBackground: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblSubTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initWithNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initWithNib()
    }
    
    convenience init(titleText: String? = "",subTitleText: String? = "", background: UIColor? = .red) {
        self.init()
        lblTitle.text = titleText
        //lblSubTitle.text = subTitleText
        vwBackground.backgroundColor = background
    }
    
    fileprivate func initWithNib() {
        Bundle.main.loadNibNamed(CarouselItem.CAROUSEL_ITEM_NIB, owner: self, options: nil)
        vwContent.frame = bounds
        vwContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(vwContent)
    }
}
