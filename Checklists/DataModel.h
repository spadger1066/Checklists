//
//  DataModel.h
//  Checklists
//
//  Created by Stephen on 17/04/2014.
//  Copyright (c) 2014 Vantech. All rights reserved.
//

#import "Foundation/Foundation.h"

@interface DataModel : NSObject

@property (nonatomic, strong) NSMutableArray *lists;

-(void)saveChecklists;

@end
