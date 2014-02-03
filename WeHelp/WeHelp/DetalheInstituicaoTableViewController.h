//
//  DetalheInstituicaoTableViewController.h
//  WeHelp
//
//  Created by Bruno Rovea Soares on 27/01/14.
//  Copyright (c) 2014 Bruno Rovea Soares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Instituicao.h"
@interface DetalheInstituicaoTableViewController : UITableViewController <UIScrollViewDelegate>
@property Instituicao *instituicao;
@end
