//
//  FoodMenuViewController.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 11/21/16.
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.numberOfRows()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text =  viewModel!.titleForRowAtIndexPath(indexPath)// ask the view model for the name of the restaurant and put it here
        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let foodVC = segue.destinationViewController as? FoodViewController,
            cell = sender as? UITableViewCell,
            indexPath = tableView.indexPathForCell(cell) {
            foodVC.viewModel =  viewModel!.foodViewModelForRowAtIndexPath(indexPath)// ask view model for a food menu view model that corresponds to this restaurant
        }
        
    }

}
