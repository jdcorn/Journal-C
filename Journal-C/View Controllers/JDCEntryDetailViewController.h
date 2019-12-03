//
//  JDCEntryDetailViewController.h
//  Journal-C
//
//  Created by jdcorn on 12/2/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDCEntryController.h"

NS_ASSUME_NONNULL_BEGIN

// Create EntryDetailViewController as a subclass of UIViewController
@interface JDCEntryDetailViewController : UIViewController

// MARK: - Properties
@property (nonatomic, strong) JDCEntry *entry;

@end

NS_ASSUME_NONNULL_END
