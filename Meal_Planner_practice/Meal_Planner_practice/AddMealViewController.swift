//
//  AddMealViewController.swift
//  Meal_Planner_practice
//
//  Created by Thiri Htet on 25/07/2025.
//

import UIKit

class AddMealViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var vegSwitch: UISwitch!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var onSave: ((Meal, Date) -> Void)?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Meal"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveMeal))
    }
    
    @objc func saveMeal() {
        let title = titleTextField.text ?? ""
        let isVeg = vegSwitch.isOn
        let note = noteTextView.text ?? ""
        let date = datePicker.date
        var type = MealType.breakfast
        
        if typeSegmentedControl.selectedSegmentIndex == 0 {
            type = MealType.breakfast
        } else if typeSegmentedControl.selectedSegmentIndex == 1 {
            type = MealType.lunch
        } else if typeSegmentedControl.selectedSegmentIndex == 2{
            type = MealType.dinner
        }
        let newMeal = Meal(title: title, type: type, isVegetarian: isVeg, note: note)
        
        onSave?(newMeal, date)
        navigationController?.popViewController(animated: true)
    }


}
