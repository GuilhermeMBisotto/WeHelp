//
//  TestViewController.m
//  WeHelp
//
//  Created by Bruno Rovea Soares on 06/02/14.
//  Copyright (c) 2014 Bruno Rovea Soares. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController
@synthesize theScrollView, instituicao;

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
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(320, 0, 320, 250)];
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(640, 0, 320, 250)];
    UIImageView *imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(960, 0, 320, 250)];
    UIImageView *imageView5 = [[UIImageView alloc] initWithFrame:CGRectMake(1280, 0, 320, 250)];
    
    imageView.image = [UIImage imageNamed:self.instituicao.listaImagens[1]];
    imageView2.image = [UIImage imageNamed:self.instituicao.listaImagens[0]];
    imageView3.image = [UIImage imageNamed:self.instituicao.listaImagens[2]];
    imageView4.image = [UIImage imageNamed:self.instituicao.listaImagens[3]];
    imageView5.image = [UIImage imageNamed:self.instituicao.listaImagens[4]];
    
    [theScrollView addSubview:imageView];
    [theScrollView addSubview:imageView2];
    [theScrollView addSubview:imageView3];
    [theScrollView addSubview:imageView4];
    [theScrollView addSubview:imageView5];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    theScrollView.contentSize = CGSizeMake(1600, 250);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
