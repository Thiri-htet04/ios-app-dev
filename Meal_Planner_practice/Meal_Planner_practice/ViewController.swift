//
//  ViewController.swift
//  Meal_Planner_practice
//
//  Created by Thiri Htet on 25/07/2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    var dayMeals: [DayMeal] = [
        DayMeal(date: Date(), meals: [
            Meal(title: "Beef Steak", type: .breakfast, isVegetarian: false, note: "Beef steak at countryside steakhouse"),
            Meal(title: "Tomyum Noodle", type: .lunch, isVegetarian: true, note: "Vegetarian tomyum noodle with bean sprouts")])
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Meal Planner"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMeal))
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc func addMeal(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let addMealViewController = storyboard.instantiateViewController(withIdentifier: "addmealvc")as? AddMealViewController{
            
            addMealViewController.onSave = {meal, date in
                if let dayMeal = self.dayMeals.first(where: {Calendar.current.isDate($0.date, inSameDayAs: date)}){
                    dayMeal.meals.append(meal)
                } else{
                    self.dayMeals.append(DayMeal(date: date, meals: [meal]))
                }
                self.tableView.reloadData()
            }
            
            navigationController?.pushViewController(addMealViewController, animated: true)
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dayMeals.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayMeals[section].meals.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "mealcell") as? MealTableViewCell {
            let meal = dayMeals[indexPath.section].meals[indexPath.row]
            cell.setup(meal: meal)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dayMeals[section].date.formatted(date: .long, time: .omitted)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            _, _, completionHandler in self.dayMeals[indexPath.section].meals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }


}

