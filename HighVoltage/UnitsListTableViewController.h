//
//  UnitsListTableViewController.h
//  HighVoltage
//
//  Created by Gregory Weiss on 7/28/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HighVoltageTableViewController.h" // protocol was defined from this class

@interface UnitsListTableViewController : UITableViewController


// Public property
@property (strong, nonatomic) NSArray *units;
@property (strong, nonatomic) id<UnitsListDelegate> delegate; // we are going to set this later


@end
