//
//  ItemDetailViewControllerTableViewController.h
//  Checklists
//
//  Created by Stephen on 15/04/2014.
//  Copyright (c) 2014 Vantech. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemDetailViewController;
@class ChecklistItem;

@protocol ItemDetailViewControllerDelegate <NSObject>

- (void)itemDetailViewControllerDidCancel: (ItemDetailViewController *)controller;
- (void)itemDetailViewController: (ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *)item;
- (void)itemDetailViewController: (ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)item;

@end

@interface ItemDetailViewController : UITableViewController <UITextFieldDelegate>

-(IBAction)cancel;
-(IBAction)done;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) ChecklistItem *itemToEdit;
@property (nonatomic, weak) id <ItemDetailViewControllerDelegate> delegate;

@end
