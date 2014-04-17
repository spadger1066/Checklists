//
//  Checklist.h
//  Checklists
//
//  Created by Stephen on 16/04/2014.
//  Copyright (c) 2014 Vantech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *items;

@end
