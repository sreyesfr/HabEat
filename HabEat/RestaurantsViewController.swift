//
//  RestaurantsViewController.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 11/21/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import UIKit
import MapKit

class RestaurantsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let viewModel = RestaurantsViewModel()
    let location = Location()
    
    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.refresh { [unowned self] in
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        //Centering the map on our initial location
        location.getCurrentLocation()
        let initialLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        //let initialLocation = CLLocation(latitude: 40.441486, longitude: -79.942014)
        centerMapOnLocation(initialLocation)
        for restaurant in allRestaurants {
            let droppedPin = MKPointAnnotation()
            droppedPin.coordinate = CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude)
            droppedPin.title = restaurant.name
            mapView.addAnnotation(droppedPin)
        }

    }
    
    let regionRadius: CLLocationDistance = 400
    
    // From Find my Car Part 1
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRowAtIndexPath(selectedRow, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text =  viewModel.titleForRowAtIndexPath(indexPath)// ask the view model for the name of the restaurant and put it here
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let foodMenuVC = segue.destinationViewController as? FoodMenuViewController,
            cell = sender as? UITableViewCell,
            indexPath = tableView.indexPathForCell(cell) {
            foodMenuVC.viewModel =  viewModel.foodMenuViewModelForRowAtIndexPath(indexPath)// ask view model for a food menu view model that corresponds to this restaurant
        }
    }
    

}
