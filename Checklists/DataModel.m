//
//  DataModel.m
//  Checklists
//
//  Created by Stephen on 17/04/2014.
//  Copyright (c) 2014 Vantech. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

-(id)init{
	if((self = [super init])) {
		[self loadChecklists];
	}
	return self;
}

- (NSString *)documentsDirectory
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths firstObject];
	return documentsDirectory;
}
- (NSString *)dataFilePath
{
	return [[self documentsDirectory]stringByAppendingPathComponent:@"Checklists.plist"];
}
- (void)saveChecklists
{
	NSMutableData *data = [[NSMutableData alloc] init];
	NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
	[archiver encodeObject:self.lists forKey:@"Checklists"];
	[archiver finishEncoding];
	[data writeToFile:[self dataFilePath] atomically:YES];
}
- (void)loadChecklists
{
	NSString *path = [self dataFilePath];
	if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
		NSData *data = [[NSData alloc] initWithContentsOfFile:path];
		NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
		self.lists = [unarchiver decodeObjectForKey:@"Checklists"];
		[unarchiver finishDecoding];
	} else {
		self.lists = [[NSMutableArray alloc] initWithCapacity:20];
	}
}

@end
