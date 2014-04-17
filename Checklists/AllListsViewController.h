//
//  AllListsViewController.h
//  Checklists
//
//  Created by Stephen on 16/04/2014.
//  Copyright (c) 2014 Vantech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"

@class DataModel;

@interface AllListsViewController : UITableViewController <ListDetailViewControllerDelegate>

@property (nonatomic, strong) DataModel *dataModel;

@end
