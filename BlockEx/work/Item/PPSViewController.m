//
//  PPSViewController.m
//  BlockEx
//
//  Created by Paopaosa on 13-3-22.
//  Copyright (c) 2013年 Paopaosa. All rights reserved.
//

#import "PPSViewController.h"
#import "PPSHomeRootItem.h"

@interface PPSViewController ()

- (void)initiCarsouel;
- (void)getDownload;

@end

@implementation PPSViewController

#pragma mark - PrivateMethods
- (void)initiCarsouel {
    NSArray *lists = @[_iCarsouelA,_iCarsouelB,_iCarsouelC];
    for (iCarousel *item in lists) {
        item.type = iCarouselTypeLinear;
        item.vertical = YES;
        item.centerItemWhenSelected = NO;
    }
}

- (void)getDownload {
    [PPSHomeRootItem getOffline:@"sample.json"
                        success:^(id object) {
                            NSLog(@"sample:%@, count:%d",object, [[(PPSHomeRootItem *)object workA] count]);
                            self.rootItem = object;
                            self.itemsA = (NSMutableArray *)[(PPSHomeRootItem *)object workA];
                            self.itemsB = (NSMutableArray *)[(PPSHomeRootItem *)object workB];
                            self.itemsC = (NSMutableArray *)[(PPSHomeRootItem *)object workC];
                            NSArray *lists = @[_iCarsouelA,_iCarsouelB,_iCarsouelC];
                            for (iCarousel *item in lists) {
                                [item reloadData];
                            }
                        }];
}

//#pragma mark - UITableViewDataSource
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.items.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *cellIndent = @"abce";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndent];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]init];
//    }
//    cell.textLabel.text = @"1234";
//    return cell;
//}

#pragma mark - iCarsouelDataSource
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
        //return the total number of items in the carousel
    if ([carousel isEqual:_iCarsouelA]) {
        return [_itemsA count];
    }
    else if ([carousel isEqual:_iCarsouelB]) {
        return [_itemsB count];
    } else {
        return [_itemsC count];
    }
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
        //create new view if no view is available for recycling
    if (view == nil)
    {
            //don't do anything specific to the index within
            //this `if (view == nil) {...}` statement because the view will be
            //recycled and used with other index values later
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80.0f, 80.0f)];
        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
        view.contentMode = UIViewContentModeCenter;
        
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:50];
        label.tag = 1;
        label.backgroundColor = [UIColor redColor];
        [view addSubview:label];
    }
    else
    {
            //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
    if ([_iCarsouelA isEqual:carousel]) {
        label.text = [[_itemsA objectAtIndex:index] name];
    }
    else if ([_iCarsouelB isEqual:carousel]) {
        label.text = [[_itemsB objectAtIndex:index] name];
    }
    else  {
        label.text = [[_itemsC objectAtIndex:index] name];
    }
    
    
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return 1.0f;
    }
    else if (option == iCarouselOptionWrap) {
        return YES;
    }
    else if (option == iCarouselOptionVisibleItems) {
        return 8;
    }
    return value;
}
#pragma mark - Origin
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initiCarsouel];
    
    [self getDownload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

@end
