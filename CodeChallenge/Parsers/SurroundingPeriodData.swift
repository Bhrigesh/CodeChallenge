//
//	SurroundingPeriodData.swift
//
//	Create by Bhrigesh Chawda on 30/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class SurroundingPeriodData{

	var avgValue : AvgValue!
	var maxValue : KpiValue!
	var minValue : KpiValue!
	var timePeriod : TimePeriod!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let avgValueData = dictionary["avgValue"] as? NSDictionary{
			avgValue = AvgValue(fromDictionary: avgValueData)
		}
		if let maxValueData = dictionary["maxValue"] as? NSDictionary{
			maxValue = KpiValue(fromDictionary: maxValueData)
		}
		if let minValueData = dictionary["minValue"] as? NSDictionary{
			minValue = KpiValue(fromDictionary: minValueData)
		}
		if let timePeriodData = dictionary["timePeriod"] as? NSDictionary{
			timePeriod = TimePeriod(fromDictionary: timePeriodData)
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if avgValue != nil{
			dictionary["avgValue"] = avgValue.toDictionary()
		}
		if maxValue != nil{
			dictionary["maxValue"] = maxValue.toDictionary()
		}
		if minValue != nil{
			dictionary["minValue"] = minValue.toDictionary()
		}
		if timePeriod != nil{
			dictionary["timePeriod"] = timePeriod.toDictionary()
		}
		return dictionary
	}

}