//
//  SecondViewController.m
//  XML
//
//  Created by bkz on 15-7-23.
//  Copyright (c) 2015年 neworigin. All rights reserved.
//

#import "SecondViewController.h"
#import "GDataXMLNode.h"
@interface SecondViewController (){
    NSMutableArray *array;
}

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    array=[[NSMutableArray alloc]init];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Click:(UIButton *)sender {
    NSString *path=[[NSBundle mainBundle]pathForResource:@"XMLFile.xml" ofType:nil];
    NSData *date=[NSData dataWithContentsOfFile:path];
 
    GDataXMLDocument *xmlDoucment=[[GDataXMLDocument alloc]initWithData:date options:0 error:nil];
    
    GDataXMLElement*rootElement=[xmlDoucment rootElement];
    
    NSArray *elementArray=[rootElement elementsForName:@"book"];
    for (GDataXMLElement *element in elementArray) {
        GDataXMLElement *bookelemet=[[element elementsForName:@"bookName"]lastObject];
        GDataXMLElement *autherelement=[[element elementsForName:@"author"]lastObject];
        GDataXMLElement *priceelement=[[element elementsForName:@"price"]lastObject];
        NSString *bookname=[bookelemet stringValue];
        NSString *auther=[autherelement stringValue];
        NSString *price=[priceelement stringValue];
        
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:
            bookname,@"bookName",
            auther,@"author",
            price,@"price", nil];
        [array addObject:dic];
    }
    NSLog(@"%@",array);

}
@end
