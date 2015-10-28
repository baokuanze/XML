//
//  MainViewController.h
//  XML
//
//  Created by bkz on 15-7-23.
//  Copyright (c) 2015年 neworigin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDataXMLNode.h"
@interface MainViewController : UIViewController<NSXMLParserDelegate>
- (IBAction)Click:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextView *TextView;

@end
