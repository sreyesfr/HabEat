//
//  FavoritesViewController.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco and Connor Hanley on 12/8/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import CoreData
import UIKit

class FavoritesViewController: UITableViewController {

    @IBOutlet weak var menuButton:UIBarButtonItem!
    let viewModel = FavoritesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
        
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            favorites = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let favoritesReverse = favorites.reversed() as Array
        let favorite = String(describing: favoritesReverse[indexPath.row].value(forKey: "name")!)
        let detail = String(viewModel.restaurantForRowAtIndexPath(indexPath))
        
        cell!.textLabel?.text = favorite
        cell!.detailTextLabel?.text = detail
        
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
