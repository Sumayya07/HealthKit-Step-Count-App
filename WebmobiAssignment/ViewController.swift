//
//  ViewController.swift
//  WebmobiAssignment
//
//  Created by Sumayya Siddiqui on 04/06/23.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    
    @IBOutlet var stepCountLabel: UILabel!
    @IBOutlet var btnRefresh: UIButton!
    
    let healthStore = HKHealthStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
        btnRefresh.backgroundColor = UIColor.purple
        btnRefresh.layer.cornerRadius = 10
        requestAuthorization()

    }
    
    func requestAuthorization() {
        if HKHealthStore.isHealthDataAvailable() {
            let readTypes = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
            healthStore.requestAuthorization(toShare: [], read: readTypes) { (success, error) in
                if success {
                    self.fetchStepCount()
                } else if let error = error {
                    print("Error occurred = \(error)")
                    DispatchQueue.main.async {
                        self.stepCountLabel.text = "Failed to authorize HealthKit"
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                self.stepCountLabel.text = "HealthKit is not available on this device"
            }
        }
    }

    func fetchStepCount() {
        guard let stepCountType = HKObjectType.quantityType(forIdentifier: .stepCount) else {
            return
        }
        
        let date = Date()
        let startDate = Calendar.current.startOfDay(for: date)
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepCountType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
            if let error = error {
                print("Failed to fetch steps. Error: \(error)")
                DispatchQueue.main.async {
                    self.stepCountLabel.text = "Failed to fetch steps"
                }
            } else if let result = result, let sum = result.sumQuantity() {
                let steps = sum.doubleValue(for: HKUnit.count())
                DispatchQueue.main.async {
                    self.stepCountLabel.text = "\(Int(steps))"
                }
            }
        }
        
        healthStore.execute(query)
    }

    
    @IBAction func btnRefreshTapped(_ sender: Any) {
        fetchStepCount()
    }
}

