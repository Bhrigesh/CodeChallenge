//
//  CCMyDashboardViewController.swift
//  CodeChallenge
//
//  Created by Bhrigesh Chawda on 30/06/16.
//  Copyright © 2016 Bhrigesh Chawda. All rights reserved.
//

import UIKit

class CCMyDashboardViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    let textCellIdentifier = "KPICell"
    var rootClassModalObj : RootClass?
    override func viewDidLoad() {
        super.viewDidLoad()
      self.navigationController?.navigationBarHidden = false
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
       
        
        // set up the base64-encoded credentials
        let defaults = NSUserDefaults.standardUserDefaults()
        let username = defaults.valueForKey("Username") as! String
        let password = defaults.valueForKey("Password") as! String
        let loginString = NSString(format: "%@:%@", username, password)
        let loginData: NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64LoginString = loginData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.init(rawValue: 0))
        
        // create the request
        let string = "https://opx.cfapps.io/dashboarditems"
        let url = NSURL(string: string)
        
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request)
            {(data, response, error) in
                print(NSString(data: data!, encoding: NSUTF8StringEncoding))
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! [AnyObject]
                    print(json.count)
                    let jsonDict = json[0] 
                    print(jsonDict)
                    
                    let overViewResponse = RootClass(fromDictionary: jsonDict as! NSDictionary)
                     self.rootClassModalObj =  overViewResponse as RootClass
                    print(self.rootClassModalObj!.code)
                    self.performSelectorOnMainThread(Selector("resotredata"), withObject: nil, waitUntilDone: false)
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                
                
        }
        
        task.resume()

  
    }

    func resotredata()
    {
        self.tableView.reloadData()
    }
    // MARK:  UITextFieldDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(rootClassModalObj?.code != nil)
        {
        return 1
        }
        else
        {
            return 0
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        let kpiNameLabel = cell.viewWithTag(-100) as! UILabel
        let timePeriodLabel = cell.viewWithTag(-101) as! UILabel
        let valueLabel = cell.viewWithTag(-102) as! UILabel
        let minValueLabel = cell.viewWithTag(-201) as! UILabel
        let avgValueLabel = cell.viewWithTag(-202) as! UILabel
        let maxValueLabel = cell.viewWithTag(-203) as! UILabel
        
        kpiNameLabel.text = rootClassModalObj?.label!
        timePeriodLabel.text = "Last" + "\(rootClassModalObj!.surroundingPeriodData!.timePeriod!.sliceUnitCount!)" + " " + "\(rootClassModalObj!.surroundingPeriodData!.timePeriod!.sliceUnit!)"
        valueLabel.text = "Value: " + "\(rootClassModalObj!.kpiValue.amountInAggregationCurrency.value!)" + " " + "\(rootClassModalObj!.kpiValue.amountInAggregationCurrency.unit)"
        minValueLabel.text = "\(rootClassModalObj!.surroundingPeriodData!.minValue!.amountInAggregationCurrency!.value)"
        avgValueLabel.text = "\(rootClassModalObj!.surroundingPeriodData!.avgValue!.amountInAggregationCurrency!.value)"
        maxValueLabel.text = "\(rootClassModalObj!.surroundingPeriodData!.maxValue!.amountInAggregationCurrency!.value)"

        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    // MARK:  UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
//        print(swiftBlogs[row])
      
    }
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
