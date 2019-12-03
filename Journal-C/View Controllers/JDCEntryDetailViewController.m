//
//  JDCEntryDetailViewController.m
//  Journal-C
//
//  Created by jdcorn on 12/2/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

#import "JDCEntryDetailViewController.h"
#import "JDCEntryController.h"

                                        // set the delegate relationship
@interface JDCEntryDetailViewController () <UITextFieldDelegate>

#pragma mark - Outlets
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation JDCEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    if (!self.entry) return;
    
    self.titleTextField.text = self.entry.title;
    self.bodyTextView.text = self.entry.body;
}

#pragma mark - Actions

- (IBAction)clearButtonTapped:(id)sender
{
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
}
- (IBAction)saveButtonTapped:(id)sender
{
    if (self.entry) {
        
        self.entry.title = self.titleTextField.text;
        self.entry.body = self.bodyTextView.text;
        self.entry.timestamp = [NSDate date];
        
    } else {
        
        JDCEntry *entry = [[JDCEntry alloc] initWithTitle:self.titleTextField.text body:self.bodyTextView timestamp:[NSDate date]];
        
        [[JDCEntryController shared] addEntry:entry];
        
        self.entry = entry;
    }
    
    [self.navigationController popViewControllerAnimated:true];
}


#pragma mark - Delegate Methods
// Implement the delegate methods textFieldShouldReturn to resign first responder to dismiss the keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)setEntry:(JDCEntry *)entry
{
    if (entry != _entry) {
        _entry = entry;
        [self updateViews];
    }
}

@end
