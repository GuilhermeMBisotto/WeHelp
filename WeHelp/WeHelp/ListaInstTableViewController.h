//
//  ListaInstTableViewController.h
//  WeHelp
//
//  Created by Jáder Borba Nunes on 27/01/14.
//  Copyright (c) 2014 Jáder Borba Nunes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Instituicao.h"
@interface ListaInstTableViewController : UITableViewController
@property Instituicao *inst1;
@property Instituicao *inst2;
@property NSMutableArray *listaInst;
@end
