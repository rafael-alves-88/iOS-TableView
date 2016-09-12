//
//  CarrosTableViewController.swift
//  TabelasCarros
//
//  Created by Thales Toniolo on 9/27/15.
//  Copyright © 2015 Flameworks. All rights reserved.
//
import UIKit

class CarrosTableViewController: UITableViewController {

	var arrItens: [[String: String]] = [["nome" : "Fusca", "cod" : "0"], ["nome" : "Fiat 147", "cod" : "1"], ["nome" : "Landal", "cod" : "2"], ["nome" : "Brasilia", "cod" : "3"],
										["nome" : "Variante", "cod" : "4"], ["nome" : "Lada", "cod" : "5"], ["nome" : "Escort", "cod" : "6"], ["nome" : "Fuscão", "cod" : "7"], ["nome" : "Uno", "cod" : "8"]]
	var arrSections: [[[String: String]]] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

		self.navigationItem.rightBarButtonItem = self.editButtonItem()

		for (var i = 0; i < self.tableView.numberOfSections; i++) {
			self.arrSections.append(self.getItensToSection(i))
		}

		self.refreshControl = UIRefreshControl()
		self.refreshControl?.addTarget(self, action: "doRefresh", forControlEvents: UIControlEvents.ValueChanged)
		self.refreshControl?.tintColor = UIColor.redColor()
    }

	func doRefresh() {
		self.refreshControl?.endRefreshing()
	}

	func getItensToSection(aSectionNum:Int) -> [[String: String]] {
		var arrRet:[[String: String]] = []
		if (aSectionNum == 0) {
			for dic in self.arrItens {
				if (Int(dic["cod"]!) < 4) {
					arrRet.append(dic)
				}
			}
		} else {
			for dic in self.arrItens {
				if (Int(dic["cod"]!) >= 4) {
					arrRet.append(dic)
				}
			}
		}
		return arrRet
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrSections[section].count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID", forIndexPath: indexPath) as! MyTableViewCell

		let secArr: [[String : String]] = self.arrSections[indexPath.section]
		let dict: [String : String] = secArr[indexPath.row]
//		cell.myTitleLabel.text = dict["nome"]
		cell.textLabel?.text = dict["nome"]
		cell.imageView?.image = UIImage(named: "carro")
		cell.detailTextLabel?.text = "Texto secundario"
		cell.accessoryType = UITableViewCellAccessoryType.DetailButton

        return cell
    }

	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 100.0
	}

	override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
		let alert: UIAlertController = UIAlertController(title: "Accessory Tap", message: "Indice \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
		self.presentViewController(alert, animated: true, completion: nil)
	}

	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let header: UIImageView = UIImageView(image: UIImage(named: "header"))
		return header
	}

	override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 50.0
	}

	override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let footer: UIImageView = UIImageView(image: UIImage(named: "footer"))
		return footer
	}

	override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 50.0
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		self.performSegueWithIdentifier("toDetailSegue", sender: nil)
	}

	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if (editingStyle == UITableViewCellEditingStyle.Delete) {
			self.arrSections[indexPath.section].removeAtIndex(indexPath.row)
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
		}
	}
}
