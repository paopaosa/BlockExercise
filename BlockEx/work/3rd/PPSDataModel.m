//
//  PPSDataModel.m
//  BlockEx
//
//  Created by Paopaosa on 13-3-22.
//  Copyright (c) 2013年 Paopaosa. All rights reserved.
//

#import "PPSDataModel.h"

@implementation PPSDataModel

- (id)getJsonResult:(NSDictionary *)jsonDict {
    return nil;
}


+ (void)getOffline:(NSString *)filename success:(void(^)(id object))success {
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:jsonData
                                              options:NSJSONReadingAllowFragments
                                                error:&error];
    if (error == nil && success) {
        id output = [[[[self class] alloc] init] getJsonResult:json];
        if (output) {
            success(output);
        }
    }
}

@end
