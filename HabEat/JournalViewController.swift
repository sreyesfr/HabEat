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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Meal")
        
        do {
            let results =
                try managedContext.fetch(fetchRequest)
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        // Change color to correspond with one of the 31 days of the month
        //colorArray = [UIColor.init(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>), ]
        //cell!.backgroundColor = UIColor.init(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        let mealsReverse = meals.reversed() as Array
        let meal = mealsReverse[indexPath.row]
        
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = .short
        
        let dateString = formatter.string(from: meal.value(forKey: "tmstmp")! as! Date)
        
        cell!.textLabel?.text = meal.value(forKey: "name") as! String?
        cell!.detailTextLabel?.text = dateString
        
        return cell!
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let foodVC = segue.destination as? FoodViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) {
            foodVC.viewModel =  viewModel.foodViewModelForRowAtIndexPath(indexPath)// ask view model for a food menu view model that corresponds to this restaurant
        }
    }
    

}
