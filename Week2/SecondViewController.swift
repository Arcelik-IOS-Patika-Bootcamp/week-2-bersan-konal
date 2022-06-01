//
//  ViewController.swift
//  Week2
//
//  Created by Muzaffer Berşan Konal on 1.06.2022.
//

import UIKit



class SecondViewController: UIViewController {

    @IBOutlet weak var birthDateTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    var delegate: ZodiacSignDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        
    }
    //creating a datepicker view with TextField
    func setupUI() {
        birthDateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        birthDateTextField.inputAccessoryView = toolbar
    }
    
    //if user has entered his/her birthday, sending day and month to other viewcontroller
    @objc
    func donePressed(){
        birthDateTextField.text = "\(datePicker.date)"
        self.view.endEditing(true)
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day,.month,.year], from: self.datePicker.date)
        
        if let day = components.day, let month = components.month {
            self.delegate?.getData(sign: findZodiacSign(day: day, month: month))
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    //ugly function to calculate zodiac sign
    func findZodiacSign(day: Int, month: Int) -> String {
        var zodiacSign = ""
        if month == 1 {
            if day < 20 { zodiacSign = "Capricorn"}
            else {zodiacSign = "Aquarius"}
        }
        else if month == 2 {
            if day < 19 {zodiacSign = "Aquarius"}
            else {zodiacSign = "Pisces"}
        }
        else if month == 3 {
            if day < 21 {zodiacSign = "Pisces"}
            else {zodiacSign = "Aries"}
        }
        else if month == 4 {
            if day < 20 {zodiacSign = "Aries"}
            else {zodiacSign = "Taurus"}
        }
        else if month == 5 {
            if day < 21 {zodiacSign = "Taurus"}
            else {zodiacSign = "Gemini"}
        }
        else if month == 6 {
            if day < 21 {zodiacSign = "Gemini"}
            else {zodiacSign = "Cancer"}
        }
        else if month == 7 {
            if day < 23 {zodiacSign = "Cancer"}
            else {zodiacSign = "Leo"}
        }
        else if month == 8 {
            if day < 23 {zodiacSign = "Leo"}
            else {zodiacSign = "Virgo"}
        }
        else if month == 9 {
            if day < 23 {zodiacSign = "Virgo"}
            else {zodiacSign = "Libra"}
        }
        else if month == 10 {
            if day < 23 {zodiacSign = "Libra"}
            else {zodiacSign = "Scorpio"}
        }
        else if month == 11 {
            if day < 22 {zodiacSign = "Scorpio"}
            else {zodiacSign = "Sagittarius"}
        }
        else if month == 12 {
            if day < 22 {zodiacSign = "Sagittarius"}
            else {zodiacSign = "Capricorn"}
        }
        return zodiacSign
    }
    

}

