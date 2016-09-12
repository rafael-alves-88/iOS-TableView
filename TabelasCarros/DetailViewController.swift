//
//  DetailViewController.swift
//  TabelasCarros
//
//  Created by Thales Toniolo on 9/27/15.
//  Copyright © 2015 Flameworks. All rights reserved.
//
import UIKit

// MARK: - Class Declaration
class DetailViewController: UIViewController {
	// MARK: - Public Objects
	
	// MARK: - Private Objects
	
	// MARK: - Interface Objects
	
	// MARK: - Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	// MARK: - Private Methods
	
	// MARK: - Action Methods
	
	// MARK: - Public Methods
	
	// MARK: - Delegate/Datasource
	
	// MARK: - Navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if (segue.identifier == "mySegue") {
			//...
		}
	}
	
	// MARK: - Death Cycle
	override func viewDidDisappear(animated: Bool) {
		//...
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
