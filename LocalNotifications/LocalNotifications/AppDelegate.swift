//
//  AppDelegate.swift
//  LocalNotifications
//
//  Created by Gabriela Mattos on 02/04/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("We have permission")
//                self.sendNotification()
            } else {
                print("permission denied")
            }
        }
        
        center.delegate = self
        sendNotification()
        return true
    }
    
    func sendNotification() {
        let center = UNUserNotificationCenter.current()
        var content = UNMutableNotificationContent()
        
        content.title = "Hello"
        content.body = "I am a local notification"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: "MyNotification", content: content, trigger: trigger    )
        center.add(request)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void) {
        print("didReceive response")
    }
    

}

