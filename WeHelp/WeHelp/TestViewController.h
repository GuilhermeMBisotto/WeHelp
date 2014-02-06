//
//  TestViewController.h
//  WeHelp
//
//  Created by Bruno Rovea Soares on 06/02/14.
//  Copyright (c) 2014 Bruno Rovea Soares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Instituicao.h"

@interface TestViewController : UIViewController <UIScrollViewDelegate>
{
    NSArray *arrayImage;
}

@property (strong, nonatomic) IBOutlet UIScrollView *theScrollView;

@property Instituicao *instituicao;

@end
