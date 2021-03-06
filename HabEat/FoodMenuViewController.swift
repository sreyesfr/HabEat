//
//  FoodMenuViewController.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco and Connor Hanley on 11/21/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import UIKit

class FoodMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    // Need to subscribe to the protocols that are listed above^^^
    
    var viewModel: FoodMenuViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = viewModel!.title()
        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text =  viewModel!.titleForRowAtIndexPath(indexPath)// ask the view model for the name of the restaurant and put it here
        cell.detailTextLabel?.text = "HabEat Index: " + viewModel!.habEatIdxForRowAtIndexPath(indexPath)
        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let foodVC = segue.destination as? FoodViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) {
            foodVC.viewModel =  viewModel!.foodViewModelForRowAtIndexPath(indexPath)// ask view model for a food menu view model that corresponds to this restaurant
        }
        
    }

}
