//
//  PPSHomeRootItem.m
//  BlockEx
//
//  Created by Paopaosa on 13-3-22.
//  Copyright (c) 2013年 Paopaosa. All rights reserved.
//

#import "PPSHomeRootItem.h"

@implementation PPSHomeRootItem

- (id)getJsonResult:(NSDictionary *)jsonDict {
    id workAList = [PPSWorkItem mappingWithKey:@"workA" mapping:nil];
    id workBList = [PPSWorkItem mappingWithKey:@"workB" mapping:nil];
    id workCList = [PPSWorkItem mappingWithKey:@"workC" mapping:nil];
    NSDictionary *rootMapping = @{@"workA":workAList,
                                  @"workB":workBList,
                                  @"workC":workCList};
    return [[self class] objectFromJSONObject:jsonDict mapping:rootMapping];
}

@end
