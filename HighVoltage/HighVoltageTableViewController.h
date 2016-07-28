//
//  HighVoltageTableViewController.h
//  HighVoltage
//
//  Created by Gregory Weiss on 7/28/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UnitsListDelegate

- (void)unitWasChosen:(NSString *)unitName;

@end

@interface HighVoltageTableViewController : UITableViewController

@end
