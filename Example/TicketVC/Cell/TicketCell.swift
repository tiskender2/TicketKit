//
//  TicketCell.swift
//  TicketKitDemo
//
//  Created by Tolga İskender on 28.07.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit
import TicketKit
class TicketCell: UITableViewCell {

    @IBOutlet weak var ticketView: TicketKit!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ticketView.layoutIfNeeded()
        smoothShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func customize(ticketDetail:TicketModel) {
        ticketView.contentImage.image = UIImage(named: ticketDetail.movieImage)
        ticketView.contentTitle.text = ticketDetail.movieName
        ticketView.durationTitle.text = "DURATION"
        ticketView.duration.text = ticketDetail.duration
        ticketView.genre.text = ticketDetail.genre
        ticketView.genreTitle.text = "GENRE"
        ticketView.rating.text = ticketDetail.rating
        ticketView.ratingTitle.text = "RATING"
        ticketView.price.text = ticketDetail.price
        ticketView.priceTitle.text = "PRICE"
        ticketView.subTitle.text = ticketDetail.movieStoryLine
        ticketView.desc.text = ticketDetail.movieDesc
        ticketView.purchaseBtn.setTitle("BUY NOW", for: .normal)
        if ticketDetail.movieName == "JOKER" {
            ticketView.enrollContentImage.image = UIImage(named: "soldout")
            ticketView.showEnrollImage()
            //ticketView.hideDetailView()
        } else if ticketDetail.movieName == "INCEPTION" {
            ticketView.enrollContentImage.image = UIImage(named: "qr")
            ticketView.showEnrollImage()
        } else {
            ticketView.showPurchaseButton()
            
        }
    }
    override func draw(_ rect: CGRect) {
        ticketView.addClips(to: .topView, corner: [.bottom,.top])
        ticketView.addClips(to: .bottomView, corner: [.top,.bottom])
    }
    func smoothShadow(){
        
        ticketView.layer.masksToBounds = false
        ticketView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        ticketView.layer.shadowOpacity = 0.5
        ticketView.layer.shadowOffset = CGSize(width: 0, height: 1)
        ticketView.layer.shadowRadius = 5
        //        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        ticketView.layer.shouldRasterize = true
        ticketView.layer.rasterizationScale = UIScreen.main.scale
    }
}
