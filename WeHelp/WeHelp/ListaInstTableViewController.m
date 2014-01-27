//
//  ListaInstTableViewController.m
//  WeHelp
//
//  Created by Jáder Borba Nunes on 27/01/14.
//  Copyright (c) 2014 Jáder Borba Nunes. All rights reserved.
//

#import "ListaInstTableViewController.h"
#import "Instituicao.h"

@interface ListaInstTableViewController ()

@property Instituicao *inst;
@property NSMutableArray *listaInst;

@property int quantInst;
@end

@implementation ListaInstTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.inst = [[Instituicao alloc]init];
    [self CarregaImagens];
}

-(void) CarregaImagens
{
    self.quantInst = 1;
    for (int i = 1; i <=self.quantInst; i++)
    {
        NSString *nomeImagem = @"logo2.png";
        UIImage *imagemArq = [UIImage imageNamed:nomeImagem];
        self.inst.imagem = imagemArq;
        [self.listaInst addObject:self.inst];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return self.listaInst.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.listaInst.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    return cell;
}

@end
