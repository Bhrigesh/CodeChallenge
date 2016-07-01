//
//	RootClass.swift
//
//	Create by Bhrigesh Chawda on 30/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class RootClass{

	var code : String!
	var kpiValue : KpiValue!
	var label : String!
	var surroundingPeriodData : SurroundingPeriodData!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		code = dictionary["code"] as? String
		if let kpiValueData = dictionary["kpiValue"] as? NSDictionary{
			kpiValue = KpiValue(fromDictionary: kpiValueData)
		}
		label = dictionary["label"] as? String
		if let surroundingPeriodDataData = dictionary["surroundingPeriodData"] as? NSDictionary{
			surroundingPeriodData = SurroundingPeriodData(fromDictionary: surroundingPeriodDataData)
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if code != nil{
			dictionary["code"] = code
		}
		if kpiValue != nil{
			dictionary["kpiValue"] = kpiValue.toDictionary()
		}
		if label != nil{
			dictionary["label"] = label
		}
		if surroundingPeriodData != nil{
			dictionary["surroundingPeriodData"] = surroundingPeriodData.toDictionary()
		}
		return dictionary
	}

}