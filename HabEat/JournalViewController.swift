//
//  JournalViewController.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 12/4/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import UIKit
import CoreData

class JournalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet var tableView: UITableView!

    let viewModel = JournalViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.navigationItem.title = viewModel!.title()
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Meal")
        
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            meals = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Replace both UITableViewDataSource methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        let mealsReverse = meals.reverse() as Array
        let meal = mealsReverse[indexPath.row]
        
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        formatter.timeStyle = .ShortStyle
        
        let dateString = formatter.stringFromDate(meal.valueForKey("tmstmp")! as! NSDate)
        
        cell!.textLabel?.text = meal.valueForKey("name") as! String?
        cell!.detailTextLabel?.text = dateString
        
        return cell!
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let foodVC = segue.destinationViewController as? FoodViewController,
            cell = sender as? UITableViewCell,
            indexPath = tableView.indexPathForCell(cell) {
            foodVC.viewModel =  viewModel.foodViewModelForRowAtIndexPath(indexPath)// ask view model for a food menu view model that corresponds to this restaurant
        }
    }
    

}
