//
//  PPSHomeRootItem.h
//  BlockEx
//
//  Created by Paopaosa on 13-3-22.
//  Copyright (c) 2013年 Paopaosa. All rights reserved.
//

#import "PPSDataModel.h"
#import "PPSWorkItem.h"

@interface PPSHomeRootItem : PPSDataModel

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *version;
@property (nonatomic,copy) NSArray *workA;
@property (nonatomic,copy) NSArray *workB;
@property (nonatomic,copy) NSArray *workC;

@end
