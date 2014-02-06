//
//  DetalheInstituicaoViewController.h
//  WeHelp
//
//  Created by Bruno Rovea Soares on 05/02/14.
//  Copyright (c) 2014 Bruno Rovea Soares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Instituicao.h"

@interface DetalheInstituicaoViewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>{
    NSArray *arrayImage;
    NSInteger pageNumber;
    UIImageView *esquerda;
    UIImageView *direita;
}

@property Instituicao *instituicao;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
