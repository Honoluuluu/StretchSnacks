//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Van Luu on 2019-02-21.
//  Copyright © 2019 Van Luu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var plusButtonOutlet: UIButton!
    @IBOutlet weak var navBarHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var ramenImageView: UIImageView!
    var oreoImageView: UIImageView!
    var pizzaImageView: UIImageView!
    var poptartImageView: UIImageView!
    var popsicleImageView: UIImageView!
    var stackView: UIStackView!
    var foodTitles: [String] = []
    var label: UILabel!
    var yConstraint: NSLayoutConstraint!
    var otherConstraint: NSLayoutConstraint!
    
    
    
    @objc func handletap(tapSender:UITapGestureRecognizer) {
        let sender = tapSender.view!.tag
        
        
//        tableView.beginUpdates()
        
        switch sender {
        case 1:
            foodTitles.append("Ramen")
        case 2:
            foodTitles.append("oreo")
        case 3:
            foodTitles.append("pizza")
        case 4:
            foodTitles.append("poptart")
        case 5:
            foodTitles.append("popsicle")
        default:
            return
        }
        
        let indexPath: IndexPath = IndexPath(row: (self.foodTitles.count - 1), section: 0)
        tableView.insertRows(at: [indexPath], with: .left)
//        tableView.endUpdates()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.rowHeight = 50
        
        
        
        //setting uptap gestures and images
        let ramenTapGesture = UITapGestureRecognizer(target: self, action: #selector(handletap))
        let oreoTapGesture = UITapGestureRecognizer(target: self, action: #selector(handletap))
        let pizzaTapGesture = UITapGestureRecognizer(target: self, action: #selector(handletap))
        let poptartTapGesture = UITapGestureRecognizer(target: self, action: #selector(handletap))
        let popsicleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handletap))
        
//        ramenTapGesture.numberOfTapsRequired = 1
//        oreoTapGesture.numberOfTapsRequired = 1
//        pizzaTapGesture.numberOfTapsRequired = 1
//        poptartTapGesture.numberOfTapsRequired = 1
//        popsicleTapGesture.numberOfTapsRequired = 1
        
        
        let ramenImage = UIImage(named: "ramen")
        ramenImageView = UIImageView(image: ramenImage)
        ramenImageView.contentMode = .scaleAspectFit
        ramenImageView.isUserInteractionEnabled = true
        ramenImageView.addGestureRecognizer(ramenTapGesture)
        ramenImageView.tag = 1
        
        let oreoImage = UIImage(named: "oreos")
        oreoImageView = UIImageView(image: oreoImage)
        oreoImageView.contentMode = .scaleAspectFit
        oreoImageView.isUserInteractionEnabled = true
        oreoImageView.addGestureRecognizer(oreoTapGesture)
        oreoImageView.tag = 2
        
        let pizzaImage = UIImage(named: "pizza_pockets")
        pizzaImageView = UIImageView(image: pizzaImage)
        pizzaImageView.contentMode = .scaleAspectFit
        pizzaImageView.isUserInteractionEnabled = true
        pizzaImageView.addGestureRecognizer(pizzaTapGesture)
        pizzaImageView.tag = 3
        
        let poptartImage = UIImage(named: "pop_tarts")
        poptartImageView = UIImageView(image: poptartImage)
        poptartImageView.contentMode = .scaleAspectFit
        poptartImageView.isUserInteractionEnabled = true
        poptartImageView.addGestureRecognizer(poptartTapGesture)
        poptartImageView.tag = 4
        
        let popsicleImage = UIImage(named: "popsicle")
        popsicleImageView = UIImageView(image: popsicleImage)
        popsicleImageView.contentMode = .scaleAspectFit
        popsicleImageView.isUserInteractionEnabled = true
        popsicleImageView.addGestureRecognizer(popsicleTapGesture)
        popsicleImageView.tag = 5
        
        
        
        //adding constraints
        
        
        stackView = UIStackView(arrangedSubviews: [ramenImageView, oreoImageView, pizzaImageView, poptartImageView, popsicleImageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        stackView.isHidden = true
        
        navBar.addSubview(stackView)
        
        stackView.leftAnchor.constraint(equalTo: navBar.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: navBar.rightAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: navBar.topAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: navBar.heightAnchor).isActive = true
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        navBar.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: navBar.centerXAnchor).isActive = true
        yConstraint = label.centerYAnchor.constraint(equalTo: navBar.centerYAnchor)
        yConstraint.isActive = true
        
        label.clipsToBounds = true
        label.textAlignment = .center
        label.text = "Snacks"
        

        self.view.layoutIfNeeded()
        
        
        
        
        
        
        
    }
    
    

    
    
    
    
    
    
    

    @IBAction func plusIconPressed(_ sender: UIButton) {
        
        expandNav()
    }
    
    
    
    func expandNav(){
        
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.plusButtonOutlet.transform = self.plusButtonOutlet.transform.rotated(by: .pi)
            
            if self.navBarHeight.constant == 64 {
                self.navBarHeight.constant = 250
                self.stackView.isHidden = false
                
                self.label.text = "Add Snack"
                self.navBar.bringSubviewToFront(self.plusButtonOutlet)
                self.yConstraint.constant = -50
                
            } else {
                
                self.navBarHeight.constant = 64
                self.stackView.isHidden = true
                self.label.text = "Snacks"
                self.yConstraint.constant = 0
            }
            
            self.view.layoutIfNeeded()
            
        }) { (finished) in
            print("plus button pressed")
        }
    }
    
    
    
    
    
    

}

//MARK: Tableview Delegate DataSource

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodNameCell", for: indexPath)as? FoodNameTableViewCell else {
            fatalError("failed")
        }
        
        cell.foodNameLabel.text = foodTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

