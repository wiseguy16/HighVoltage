//
//  HighVoltageTableViewCell.m
//  HighVoltage
//
//  Created by Gregory Weiss on 7/28/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "HighVoltageTableViewCell.h"
#import "UnitsListTableViewController.h"

@interface HighVoltageTableViewCell() //  <UITextFieldDelegate>





@end

@implementation HighVoltageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //[self.valueTextField.delegate = self];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
 

    // Configure the view for the selected state
}

//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [self.valueTextField resignFirstResponder];
//    return YES;
//}

// <UITextFieldDelegate>

@end
