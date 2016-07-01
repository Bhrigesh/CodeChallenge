//
//	AvgValue.swift
//
//	Create by Bhrigesh Chawda on 30/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class AvgValue{

	var amountInAggregationCurrency : AmountInAggregationCurrency!
	var quantity : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let amountInAggregationCurrencyData = dictionary["amountInAggregationCurrency"] as? NSDictionary{
			amountInAggregationCurrency = AmountInAggregationCurrency(fromDictionary: amountInAggregationCurrencyData)
		}
		quantity = dictionary["quantity"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if amountInAggregationCurrency != nil{
			dictionary["amountInAggregationCurrency"] = amountInAggregationCurrency.toDictionary()
		}
		if quantity != nil{
			dictionary["quantity"] = quantity
		}
		return dictionary
	}

}