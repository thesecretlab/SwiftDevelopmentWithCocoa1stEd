//
//  GridViewController.swift
//  AwesomeGrid
//
//  Created by Jon Manning on 7/08/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class GridViewController: UICollectionViewController {
    
    // BEGIN ios_collectionview_data_property
    var numbers : [Int] = []
    // END ios_collectionview_data_property
    

    // BEGIN ios_collectionview_data_setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...200 {
            numbers.append(i)
        }

    }
    // END ios_collectionview_data_setup


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    // BEGIN ios_collectionview_cell_counts
    override func numberOfSectionsInCollectionView
                                (collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView,
                 numberOfItemsInSection section: Int) -> Int {
        return self.numbers.count
    }
    // END ios_collectionview_cell_counts

    // BEGIN ios_collectionview_cells
    override func collectionView(collectionView: UICollectionView,
               cellForItemAtIndexPath indexPath: NSIndexPath)
                                                        -> UICollectionViewCell
    {
        let cell =
          collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier,
                                forIndexPath: indexPath) as UICollectionViewCell
        
        if let gridCell = cell as? GridCell {
            gridCell.label.text = String(self.numbers[indexPath.row])
        }
    
        return cell
    }
    // END ios_collectionview_cells

}
