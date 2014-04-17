//
//  ChecklistItem.m
//  Checklists
//
//  Created by Stephen on 15/04/2014.
//  Copyright (c) 2014 Vantech. All rights reserved.
//

#import "ChecklistItem.h"

@implementation ChecklistItem

- (void) toggleChecked {
	self.checked = !self.checked;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.text forKey:@"Text"];
	[aCoder encodeBool:self.checked forKey:@"Checked"];
}

- (id) initWithCoder:(NSCoder *)aDecoder {
	if ((self = [super init])) {
		self.text = [aDecoder decodeObjectForKey:@"Text"];
		self.checked = [aDecoder decodeBoolForKey:@"Checked"];
	}
	return self;
}


@end
