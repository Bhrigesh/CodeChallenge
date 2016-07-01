//
//	TimePeriod.swift
//
//	Create by Bhrigesh Chawda on 30/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class TimePeriod{

	var sliceCount : Int!
	var sliceUnit : String!
	var sliceUnitCount : Int!
	var periodEnd : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		sliceCount = dictionary["sliceCount"] as? Int
		sliceUnit = dictionary["sliceUnit"] as? String
		sliceUnitCount = dictionary["sliceUnitCount"] as? Int
		periodEnd = dictionary["periodEnd"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if sliceCount != nil{
			dictionary["sliceCount"] = sliceCount
		}
		if sliceUnit != nil{
			dictionary["sliceUnit"] = sliceUnit
		}
		if sliceUnitCount != nil{
			dictionary["sliceUnitCount"] = sliceUnitCount
		}
		if periodEnd != nil{
			dictionary["periodEnd"] = periodEnd
		}
		return dictionary
	}

}