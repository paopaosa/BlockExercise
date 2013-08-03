//
//  @file PPSAppDelegate.h 程序委托
//  BlockEx
//
//  Created by Paopaosa on 13-3-22.
//  Copyright (c) 2013年 Paopaosa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PPSViewController;
/** 文档B.
 *
 * 文档B的详细描述.
 */
@interface PPSAppDelegate : UIResponder <UIApplicationDelegate>
{
    int _lastIndex;         ///< 最近一次的索引位
    int _currentIndex;      ///< 当前索引位置
}

@property (strong, nonatomic) UIWindow *window;                     ///< 系统主窗口

@property (strong, nonatomic) PPSViewController *viewController;    ///< 主ViewController

@end
