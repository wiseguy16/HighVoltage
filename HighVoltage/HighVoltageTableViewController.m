//
//  HighVoltageTableViewController.m
//  HighVoltage
//
//  Created by Gregory Weiss on 7/28/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "HighVoltageTableViewController.h"
#import "UnitsListTableViewController.h"

#import "HighVoltageTableViewCell.h"

#import "HighVoltageBrain.h"

@interface HighVoltageTableViewController () <UIPopoverPresentationControllerDelegate, UnitsListDelegate, UITextFieldDelegate>

@property (strong, nonatomic) HighVoltageBrain *brain;
// This is the private interface******************************
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@property (strong, nonatomic) NSMutableArray *visibleUnits;
@property (strong, nonatomic) NSMutableArray *remainingUnits;
@property (strong, nonatomic) NSMutableArray *textFieldArray;

@property (strong, nonatomic) NSDictionary *allUnits;

@property (strong, nonatomic) UITextField *voltsTextField;
@property (strong, nonatomic) UITextField *wattsTextField;
@property (strong, nonatomic) UITextField *ampsTextField;
@property (strong, nonatomic) UITextField *ohmsTextField;
@property (strong, nonatomic) NSString *voltsString;
@property (strong, nonatomic) NSString *wattsString;
@property (strong, nonatomic) NSString *ampsString;
@property (strong, nonatomic) NSString *ohmsString;

@property (strong, nonatomic) NSMutableString *comboString;


//@property int returnPressedCount;



@end

@implementation HighVoltageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.visibleUnits = [[NSMutableArray alloc] init];
    
    self.allUnits = @{@"Volts": @"Electrical Potential", @"Watts": @"Power", @"Amps": @"Current", @"Ohms": @"Resistance"};
    self.remainingUnits = [[self.allUnits allKeys] mutableCopy];
    self.textFieldArray = [[NSMutableArray alloc] init];
    
    self.comboString = [[NSMutableString alloc] init];
    
    self.returnPressedCount = 0;
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"UnitsNamePopoverSegue"])
    {
        UnitsListTableViewController *hVListVC = [segue destinationViewController];
        hVListVC.units = self.remainingUnits;
        hVListVC.popoverPresentationController.delegate = self;
        hVListVC.delegate = self; // This assigns a value to the delegate
        int contentHeight = 44.0f * self.remainingUnits.count;
        hVListVC.preferredContentSize = CGSizeMake(200.0f, contentHeight);
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}



#pragma mark UIPopover stuff

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.visibleUnits.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HighVoltageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HiVoltCell" forIndexPath:indexPath];
    
    // Configure the cell...
    [cell.valueTextField becomeFirstResponder];
    cell.valueTextField.delegate = self;
    
    NSString *labelNameKey = self.visibleUnits[indexPath.row];
    NSString *labelNameValue = [self.allUnits objectForKey:labelNameKey];

    
    cell.valueNameLabel.text = labelNameValue;
    cell.valueTextField.placeholder = labelNameKey;
    
    if ([labelNameKey isEqualToString:@"Volts"])
    {
        self.voltsTextField = cell.valueTextField;
    }
    else if ([labelNameKey isEqualToString:@"Watts"])
    {
        self.wattsTextField = cell.valueTextField;
    }
    else if ([labelNameKey isEqualToString:@"Amps"])
    {
        self.ampsTextField = cell.valueTextField;
    }
    else if ([labelNameKey isEqualToString:@"Ohms"])
    {
        self.ohmsTextField = cell.valueTextField;
    }
    
    
//    self.operand1ValueAsString = cell.valueTextField.text;
    
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clearTapped:(UIBarButtonItem *)sender
{
    // self.HighVoltageBrain = nil;
    self.visibleUnits = [[NSMutableArray alloc] init];
    self.allUnits = @{@"Volts": @"Electrical Potential", @"Watts": @"Power", @"Amps": @"Current", @"Ohms": @"Resistance"};
    
    self.remainingUnits = [[self.allUnits allKeys] mutableCopy];
    [self.tableView reloadData];
}


#pragma mark - CharacterList delegate
-(void)unitWasChosen:(NSString*)unitName
{
    
    [self.visibleUnits addObject:unitName];
    [self.remainingUnits removeObject:unitName];
    if (self.remainingUnits.count == 0)
    {
        [self.addButton setEnabled:NO];
    }
    [self.tableView reloadData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.returnPressedCount = self.returnPressedCount + 1;
    
    if (!self.brain)
    {
        self.brain = [[HighVoltageBrain alloc] init];
        
     }
    //********* This picks the right textField ********************
        if (textField == self.voltsTextField)
        {
            self.voltsString = textField.text;
            [self.comboString appendString:@"Volts"];
          //  [self.brain getReturnCount:self.returnPressedCount];
        }
        else if (textField == self.wattsTextField)
        {
            self.wattsString = textField.text;
            [self.comboString appendString:@"Watts"];
          //  [self.brain getReturnCount:self.returnPressedCount];
        }
        else if (textField == self.ampsTextField)
        {
            self.ampsString = textField.text;
            [self.comboString appendString:@"Amps"];
          //  [self.brain getReturnCount:self.returnPressedCount];

        }
        else if (textField == self.ohmsTextField)
        {
            self.ohmsString = textField.text;
            [self.comboString appendString:@"Ohms"];
           // [self.brain getReturnCount:self.returnPressedCount];

        }
    
//********* This decides first or second digit ********************
        
        if (self.returnPressedCount <3)
        {
            [self.brain addOperandDigit: textField.text];
//            [self.brain addOperator:self.comboString];
            [self.brain getReturnCount:self.returnPressedCount];

           // self.brain.thisOperator = 12;
        }
        else
        {
            [self.brain addOperandDigit: textField.text];
            [self.brain getReturnCount:self.returnPressedCount];

           // [self.brain performCalculationIfPossible];

        }
    
//********* This happens after 2nd number entered ********************
    //      Equation is picked from comboString
    //      Calculation is performed
    
    if (self.returnPressedCount == 2)
    {
        [self.brain getReturnCount:self.returnPressedCount];
        [self.brain addOperator:self.comboString];
       // [self.brain performCalculationIfPossible];
    }
    
    
//    NSLog(@"num is : %@", textField.text);
//    NSLog(@"volts : %@", self.voltsString);
//    NSLog(@"amps is : %@", self.ampsString);
//    NSLog(@"watts is : %@", self.wattsString);
//    NSLog(@"ohms is : %@", self.ohmsString);
    NSLog(@"combo is : %@", self.comboString);
    NSLog(@"returnPressedCount is : %d", self.returnPressedCount);
//    NSLog(@"addOperandDigit is : %@", @"check the brain");


    

    
    [textField resignFirstResponder];
    return YES;
}


@end
