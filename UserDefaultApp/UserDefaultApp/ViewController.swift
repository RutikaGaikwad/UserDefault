//
//  ViewController.swift
//  UserDefaultApp
//
//  Created by APPLE on 15/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchLabel: UILabel!
    
    @IBOutlet weak var switchBtn: UISwitch!
    
    @IBOutlet weak var themeSegment: UISegmentedControl!
    
    let userDefault =  UserDefaults.standard
    
    let ON_OFF_KEY = "onOffKey"
    let THEME_KEY = "themeKey"
    let LIGHT_THEME = "lightKey"
    let DARK_THEME = "darkKey"
    let PINK_THEME = "pinkKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
         SwitchState()
        updateTheme()
    }
    
    func SwitchState() {
        if(userDefault.bool(forKey: ON_OFF_KEY ))
        {
            switchBtn.setOn(true, animated: false )
            switchLabel.text = "ON"
        }else {
            switchBtn.setOn(false, animated: false)
            switchLabel.text = "OFF"
        }
    }
    
    func updateTheme() {
        let theme = userDefault.string(forKey: THEME_KEY)
        if(theme == LIGHT_THEME)
        {
            themeSegment.selectedSegmentIndex = 0
            view.backgroundColor = UIColor.blue
        }else if(theme == DARK_THEME)
        {
            themeSegment.selectedSegmentIndex = 1
            view.backgroundColor = UIColor.purple
        }else if(theme == PINK_THEME)
        {
            themeSegment.selectedSegmentIndex = 2
            view.backgroundColor = UIColor.systemPink
        }
    }

    @IBAction func switchChanged(_ sender: Any) {
        if(switchBtn.isOn) 
        {
            userDefault.set(true, forKey: ON_OFF_KEY)
            switchLabel.text = "ON"
        }else {
            userDefault.setValue(false, forKey: ON_OFF_KEY)
            switchLabel.text = "OFF"
        }
    }
    
    @IBAction func segmentedChanged(_ sender: Any) {
        switch themeSegment.selectedSegmentIndex
        {
        case 0:
            userDefault.set(LIGHT_THEME, forKey: THEME_KEY)
        case 1:
            userDefault.set(DARK_THEME, forKey: THEME_KEY)
        case 2:
            userDefault.set(PINK_THEME, forKey: THEME_KEY)
        default:
            userDefault.set(LIGHT_THEME, forKey: THEME_KEY)
        }
        updateTheme()
    }

}

