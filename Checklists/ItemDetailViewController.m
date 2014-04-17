//
//  ItemDetailtemViewControllerTableViewController.m
//  Checklists
//
//  Created by Stephen on 15/04/2014.
//  Copyright (c) 2014 Vantech. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ChecklistItem.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	if (self.itemToEdit != nil){
		self.title = @"Edit Item";
		self.textField.text = self.itemToEdit.text;
		self.doneBarButton.enabled = YES;
	}

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel
{
	[self.delegate itemDetailViewControllerDidCancel:self];
}
- (IBAction)done
{
	if (self.itemToEdit == nil){
		ChecklistItem *item = [[ChecklistItem alloc] init];
		item.text = self.textField.text;
		item.checked = NO;

		[self.delegate itemDetailViewController:self didFinishAddingItem:item];
	} else {
		self.itemToEdit.text = self.textField.text;
		[self.delegate itemDetailViewController:self didFinishEditingItem:self.itemToEdit];
	}
}

-(NSIndexPath *) tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	return nil;
}

-(void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

	[self.textField becomeFirstResponder];
}

-(BOOL) textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	NSString *newText = [theTextField.text stringByReplacingCharactersInRange:range withString:string];

	self.doneBarButton.enabled = [newText length] > 0;

	return YES;
}

@end
