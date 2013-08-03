//
//  PPSViewController.h
//  BlockEx
//
//  Created by Paopaosa on 13-3-22.
//  Copyright (c) 2013年 Paopaosa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iCarousel/iCarousel.h>

@class PPSHomeRootItem;

@interface PPSViewController : UIViewController <iCarouselDataSource,iCarouselDelegate>

@property (nonatomic,strong) PPSHomeRootItem *rootItem;
@property (nonatomic,strong) NSMutableArray *itemsA;
@property (nonatomic,strong) NSMutableArray *itemsB;
@property (nonatomic,strong) NSMutableArray *itemsC;
@property (weak, nonatomic) IBOutlet iCarousel *iCarsouelA;
@property (weak, nonatomic) IBOutlet iCarousel *iCarsouelB;
@property (weak, nonatomic) IBOutlet iCarousel *iCarsouelC;

@end
