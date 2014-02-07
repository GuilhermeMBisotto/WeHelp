//
//  DetalheInstituicaoV3ViewController.h
//  WeHelp
//
//  Created by Bruno Rovea Soares on 06/02/14.
//  Copyright (c) 2014 Bruno Rovea Soares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Instituicao.h"

@interface DetalheInstituicaoV3ViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDataSource, UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property Instituicao *instituicao;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@end
