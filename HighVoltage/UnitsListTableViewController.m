//
//  UnitsListTableViewController.m
//  HighVoltage
//
//  Created by Gregory Weiss on 7/28/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "UnitsListTableViewController.h"

@interface UnitsListTableViewController ()

@end

@implementation UnitsListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   // [self.tableView reloadData];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.units.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UnitsCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *unitName = self.units[indexPath.row];
    cell.textLabel.text = unitName;
    
    return cell;
}


#pragma mark - UITableView delegate



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES]; // Turns off the highlight!!!
    NSString *unitName = self.units[indexPath.row];
    [self.delegate unitWasChosen:unitName];
    
    // ********* Make it go to the text field and bring up the keyboard ************

    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}






@end
