//
//  ChecklistsViewController.h
//  Checklists
//
//  Created by Stephen on 15/04/2014.
//  Copyright (c) 2014 Vantech. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@class Checklist;

@interface ChecklistViewController : UITableViewController <ItemDetailViewControllerDelegate>

@property (nonatomic, strong) Checklist *checklist;

@end
