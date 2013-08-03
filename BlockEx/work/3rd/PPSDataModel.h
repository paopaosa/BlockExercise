//
//  PPSDataModel.h
//  BlockEx
//
//  Created by Paopaosa on 13-3-22.
//  Copyright (c) 2013年 Paopaosa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JTObjectMapping/NSObject+JTObjectMapping.h>

@interface PPSDataModel : NSObject

- (id)getJsonResult:(NSDictionary *)jsonDict;

+ (void)getOffline:(NSString *)filename success:(void(^)(id object))success;

@end
