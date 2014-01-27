//
//  ViewController.m
//  WeHelp
//
//  Created by Bruno Rovea Soares on 24/01/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *oi;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end

@implementation ViewController
- (IBAction)heu:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"alert" message:@"Sauna Hour o/" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:@"Cancel", nil];
    [alert show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return 6;
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return @"nome da cor";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
