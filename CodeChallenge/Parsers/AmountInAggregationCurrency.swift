//
//	AmountInAggregationCurrency.swift
//
//	Create by Bhrigesh Chawda on 30/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class AmountInAggregationCurrency{

	var unit : String!
	var value : Float!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		unit = dictionary["unit"] as? String
		value = dictionary["value"] as? Float
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if unit != nil{
			dictionary["unit"] = unit
		}
        if value != nil{
			dictionary["value"] = value
		}
		return dictionary
	}

}