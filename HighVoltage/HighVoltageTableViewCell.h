//
//  HighVoltageTableViewCell.h
//  HighVoltage
//
//  Created by Gregory Weiss on 7/28/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HighVoltageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *valueNameLabel;

@property (weak, nonatomic) IBOutlet UITextField *valueTextField;

@end
