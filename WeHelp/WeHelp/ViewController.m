//
//  ViewController.m
//  WeHelp
//
//  Created by Bruno Rovea Soares on 24/01/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#define Rgb2UIColor(r, g, b)[UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIColor *navColor = [UIColor colorWithRed:((14) / 255.0) green:((170) / 255.0) blue:((237) / 255.0) alpha:1.0];
    self.navigationController.navigationBar.barTintColor = navColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
