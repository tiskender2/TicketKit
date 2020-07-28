//
//  TicketKit.swift
//  TicketKit
//
//  Created by Tolga İskender on 27.07.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit

public enum ClipCorner:Int {
    case top
    case center
    case bottom
    case all
}
public enum Views:Int {
    case topView
    case bottomView
}
public class TicketKit: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var ticketTopView: UIView!
    @IBOutlet weak var ticketDashView: UIView!
    @IBOutlet weak var ticketBottomView: UIView!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentName: UILabel!
    @IBOutlet weak var durationTitleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var genreTitleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var ratingTitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceTitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var storyLineLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var purchaseView: UIView!
    @IBOutlet weak var purchaseButton: UIButton!
    @IBOutlet weak var enrollView: UIView!
    @IBOutlet weak var enrollImageView: UIImageView!
    @IBOutlet weak var detailView: UIView!
    
    var path = UIBezierPath()
    var clips = [ClipCorner]()
    public var didPurchaseButtonClicked: (()->())?
    public var contentImage : UIImageView {
        return contentImageView
    }
    public var enrollContentImage : UIImageView {
        return enrollImageView
    }
    public var contentTitle: UILabel {
        return contentName
    }
    public var durationTitle: UILabel {
        return durationTitleLabel
    }
    public var duration: UILabel {
        return durationLabel
    }
    public var genreTitle: UILabel {
        return genreTitleLabel
    }
    public var genre: UILabel {
        return genreLabel
    }
    public var ratingTitle: UILabel {
        return ratingTitleLabel
    }
    public var rating: UILabel {
        return ratingLabel
    }
    public var priceTitle: UILabel {
        return priceTitleLabel
    }
    public var price: UILabel {
        return priceLabel
    }
    public var subTitle: UILabel {
        return storyLineLabel
    }
    public var desc: UILabel {
        return descLabel
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        let bundle = Bundle(identifier:"com.tolgaiskender.TicketKit")
        bundle?.loadNibNamed("TicketKit", owner: self,options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        lineView.strokeLine()
        layoutIfNeeded()
        setNeedsDisplay()
        
    }
    @IBAction func didTappedPurchaseButton(_ sender: Any) {
        didPurchaseButtonClicked?()
    }
    public func hideDetailView(){
        self.detailView.isHidden = true
    }
    public func showPurchaseButton(){
        self.purchaseButton.isHidden = false
        self.purchaseView.isHidden = false
        self.enrollView.isHidden = true
    }
    public func showEnrollImage(){
        self.purchaseView.isHidden = true
        self.enrollView.isHidden = false
    }
    public func setupTicket(title:String,duration:String,genre:String,rating:String,price:String,subtitle:String,desc:String){
        contentTitle.text = title
        self.duration.text = duration
        self.genre.text = genre
        self.rating.text = rating
        self.price.text = price
        self.subTitle.text = subtitle
        self.desc.text = desc
        
    }
    public func setupDashedLine(lineDashPattern:[NSNumber], lineWidth:CGFloat, lineDashPhase:CGFloat, fillColor:CGColor, storeColor:CGColor) {
        lineView.strokeLine(lineDashPattern: lineDashPattern, lineWidth: lineWidth, lineDashPhase: lineDashPhase, fillColor: fillColor, storeColor: storeColor)
    }
    
    public func addClips(to view:Views, corner clips:[ClipCorner]) {
        let viewFrames:CGRect
        if view == .bottomView {
            path = UIBezierPath(rect: ticketBottomView.bounds)
            viewFrames = ticketBottomView.bounds
        } else if view == .topView {
            path = UIBezierPath(rect: ticketTopView.frame)
            viewFrames = ticketTopView.frame
        } else {
            return
        }
        if clips.contains(.all) {
            overLay(points: CGPoint(x: viewFrames.origin.x - 15, y: viewFrames.origin.y - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: viewFrames.origin.y - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x - 15, y: viewFrames.origin.y + viewFrames.height - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: viewFrames.origin.y + viewFrames.height - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x - 15 , y:  (viewFrames.height/2) - 15), view: view)
            overLay(points:  CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: (viewFrames.height/2) - 15), view: view)
        } else if clips.contains(.bottom) && clips.contains(.top) && clips.contains(.center){
            overLay(points: CGPoint(x: viewFrames.origin.x - 15, y: viewFrames.origin.y - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: viewFrames.origin.y - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x - 15, y: viewFrames.origin.y + viewFrames.height - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: viewFrames.origin.y + viewFrames.height - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x - 15 , y:  (viewFrames.height/2) - 15), view: view)
            overLay(points:  CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: (viewFrames.height/2) - 15), view: view)
        } else if clips.contains(.bottom) && clips.contains(.top){
            overLay(points: CGPoint(x: viewFrames.origin.x - 15, y: viewFrames.origin.y - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: viewFrames.origin.y - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x - 15, y: viewFrames.origin.y + viewFrames.height - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: viewFrames.origin.y + viewFrames.height - 15), view: view)
        } else if clips.contains(.bottom) && clips.contains(.center){
            overLay(points: CGPoint(x: viewFrames.origin.x - 15, y: viewFrames.origin.y + viewFrames.height - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: viewFrames.origin.y + viewFrames.height - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x - 15 , y:  (viewFrames.height/2) - 15), view: view)
            overLay(points:  CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: (viewFrames.height/2) - 15), view: view)
        } else if clips.contains(.top) && clips.contains(.center){
            overLay(points: CGPoint(x: viewFrames.origin.x - 15, y: viewFrames.origin.y - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: viewFrames.origin.y - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x - 15 , y:  (viewFrames.height/2) - 15), view: view)
            overLay(points:  CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: (viewFrames.height/2) - 15), view: view)
        } else if clips.contains(.center){
            overLay(points: CGPoint(x: viewFrames.origin.x - 15 , y:  (viewFrames.height/2) - 15), view: view)
            overLay(points:  CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: (viewFrames.height/2) - 15), view: view)
        } else if clips.contains(.top) {
            overLay(points: CGPoint(x: viewFrames.origin.x - 15, y: viewFrames.origin.y - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: viewFrames.origin.y - 15), view: view)
        } else if clips.contains(.bottom) {
            overLay(points: CGPoint(x: viewFrames.origin.x - 15, y: viewFrames.origin.y + viewFrames.height - 15), view: view)
            overLay(points: CGPoint(x: viewFrames.origin.x + viewFrames.width - 15, y: viewFrames.origin.y + viewFrames.height - 15), view: view)
        }
    }
    private func overLay(points: CGPoint,view:Views) {
        let sizes = CGSize(width: 30, height: 30)
        let circlePath = UIBezierPath(ovalIn: CGRect(origin: points, size: sizes))
        path.append(circlePath)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        maskLayer.fillRule = .evenOdd
        if view == .topView {
            ticketTopView.layer.mask = maskLayer
        } else if view == .bottomView {
            ticketBottomView.layer.mask = maskLayer
        }
    }
   
}
extension UIView {
    func strokeLine(lineDashPattern:[NSNumber]? = [8,8], lineWidth:CGFloat = 10, lineDashPhase:CGFloat = 4, fillColor:CGColor? = UIColor.white.cgColor, storeColor:CGColor? = UIColor.lightGray.cgColor) {
        self.backgroundColor = .clear
        self.clipsToBounds = true
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = UIBezierPath(rect: self.bounds).cgPath
        self.layer.mask = maskLayer
        
        
        let borderLayer = CAShapeLayer()
        borderLayer.path = maskLayer.path
        borderLayer.fillColor = fillColor
        borderLayer.strokeColor = storeColor
        borderLayer.lineDashPattern = lineDashPattern
        borderLayer.lineDashPhase = lineDashPhase
        borderLayer.lineWidth = lineWidth
        borderLayer.frame = self.bounds
        self.layer.addSublayer(borderLayer)
    }
}
