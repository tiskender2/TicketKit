//
//  TicketVC.swift
//  TicketKitDemo
//
//  Created by Tolga İskender on 28.07.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

class TicketVC: UIViewController {
    
    @IBOutlet weak var ticketTableView: UITableView! {
        didSet {
            ticketTableView.delegate = self
            ticketTableView.dataSource = self
            ticketTableView.estimatedRowHeight = UITableView.automaticDimension
            ticketTableView.rowHeight = UITableView.automaticDimension
            ticketTableView.register(UINib(nibName: "TicketCell", bundle: nil), forCellReuseIdentifier: "TicketCell")
        }
    }
    var ticketArray = [TicketModel(movieImage: "joker", movieName: "JOKER", movieStoryLine: "StoryLine", movieDesc: "Arthur Fleck works as a clown and is an aspiring stand-up comic. He has mental health issues, part of which involves uncontrollable laughter. Times are tough and, due to his issues and occupation, Arthur has an even worse time than most. Over time these issues bear down on him, shaping his actions, making him ultimately take on the persona he is more known as...Joker.", duration: "2hr 2min", genre: "Crime,Drama", rating: "8,5", price: "$20"),TicketModel(movieImage: "inception", movieName: "INCEPTION", movieStoryLine: "StoryLine", movieDesc: "Dom Cobb is a skilled thief, the absolute best in the dangerous art of extraction, stealing valuable secrets from deep within the subconscious during the dream state, when the mind is at its most vulnerable. Cobb's rare ability has made him a coveted player in this treacherous new world of corporate espionage, but it has also made him an international fugitive and cost him everything he has ever loved. Now Cobb is being offered a chance at redemption. One last job could give him his life back but only if he can accomplish the impossible, inception. Instead of the perfect heist, Cobb and his team of specialists have to pull off the reverse: their task is not to steal an idea, but to plant one. If they succeed, it could be the perfect crime. But no amount of careful planning or expertise can prepare the team for the dangerous enemy that seems to predict their every move. An enemy that only Cobb could have seen coming.", duration: "2hr 28min", genre: "Action,Adventure", rating: "8,8", price: "$30"),TicketModel(movieImage: "interstellar", movieName: "INTERSTELLER", movieStoryLine: "StoryLine", movieDesc: "Earth's future has been riddled by disasters, famines, and droughts. There is only one way to ensure mankind's survival: Interstellar travel. A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life. ", duration: "2hr 49min", genre: "Adventure,Drama", rating: "8,6", price: "$40")]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }


}
extension TicketVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath) as! TicketCell
        //
        //≈
        cell.customize(ticketDetail:ticketArray[indexPath.row])
       
        return cell
    }
    
    
}
extension TicketVC: UITableViewDelegate {
    
}

