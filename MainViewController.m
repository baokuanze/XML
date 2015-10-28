//
//  MainViewController.m
//  XML
//
//  Created by bkz on 15-7-23.
//  Copyright (c) 2015年 neworigin. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController (){
    NSMutableDictionary *paresedic;
    NSMutableArray*parearray;
    NSMutableString *parestring;
    NSArray *elementsArray;
}

@end

@implementation MainViewController

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
    elementsArray=[[NSArray alloc]initWithObjects:@"bookName",@"author",@"price" ,nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Click:(UIButton *)sender {
    NSString *path=[[NSBundle mainBundle]pathForResource:@"XMLFile" ofType:@".xml"];
    NSData*date=[NSData dataWithContentsOfFile:path];
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:date];
    parser.delegate=self;
    [parser parse];
  //self.TextView.text
}


-(void)parserDidStartDocument:(NSXMLParser *)parser{
    paresedic=[[NSMutableDictionary alloc]init];
    parearray=[[NSMutableArray alloc]init];
    parestring=[[NSMutableString alloc]init];
  

}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"book"]) {
        [paresedic removeAllObjects];
    }else if ([elementsArray containsObject:elementName]){
    [parestring setString:@""];
    }
    
    
    /*else if([elementName isEqualToString:@"bookName"]){
        [parestring setString:@""];
    }else if([elementName isEqualToString:@"author"]){
        [parestring setString:@""];
    }else if ([elementName isEqualToString:@"price"]){
    
        [parestring setString:@""];
    }*/


}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    [parestring setString:string];

}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    /*if ([elementName isEqualToString:@"bookName"]) {
        [paresedic setObject:[NSString stringWithString:parestring] forKey:elementName];
        NSLog(@"%@",parestring);
    }else if ([elementName isEqualToString:@"author"]){
        [paresedic setObject:[NSString stringWithString:parestring] forKey:elementName];
    }else if ([elementName isEqualToString:@"price"]){
        [paresedic setObject:[NSString stringWithString:parestring] forKey:elementName];
    }*/
    if ([elementsArray containsObject:elementName]) {
        [paresedic setObject:[NSString stringWithString:parestring] forKey:elementName];
    }else if ([elementName isEqualToString:@"book"]){
        [parearray addObject:[NSDictionary dictionaryWithDictionary:paresedic]];
    }

}
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"%@",parearray);
    NSMutableString *str=[[NSMutableString alloc]init];
    for(NSDictionary *dic in parearray){
[str appendFormat:@"%@ %@ %@ \n",dic[@"bookName"],dic[@"author"],dic[@"price"]];
    }
    self.TextView.text=str;
}

@end
