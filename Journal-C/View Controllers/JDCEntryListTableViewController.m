//
//  JDCEntryTableViewController.m
//  Journal-C
//
//  Created by jdcorn on 12/2/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

#import "JDCEntryListTableViewController.h"
#import "JDCEntryController.h"
#import "JDCEntryDetailViewController.h"

@interface JDCEntryListTableViewController ()

@end

@implementation JDCEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return JDCEntryController.shared.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    JDCEntry *entry = JDCEntryController.shared.entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    return cell;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }   
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toAddEntry"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        JDCEntry *entry = JDCEntryController.shared.entries[indexPath.row];
        JDCEntryDetailViewController *detailViewController =
        segue.destinationViewController;
        detailViewController.entry = entry;
    }

}

@end
