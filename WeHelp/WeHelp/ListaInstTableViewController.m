//
//  ListaInstTableViewController.m
//  WeHelp
//
//  Created by Jáder Borba Nunes on 27/01/14.
//  Copyright (c) 2014 Jáder Borba Nunes. All rights reserved.
//

#import "ListaInstTableViewController.h"
@interface ListaInstTableViewController ()
{
    NSMutableDictionary *dicSections;
}
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
    
    dicSections = [[NSMutableDictionary alloc] init];
    _listaInst = [[NSMutableArray alloc] init];
    
    self.inst1 = [[Instituicao alloc]init];
    self.inst2 = [[Instituicao alloc]init];
    
    [self CarregaImagens];
}

-(void) CarregaImagens
{
    
    NSString *nomeImagem = @"logo2.png";
    UIImage *imagemArq1 = [UIImage imageNamed:nomeImagem];
    
    self.inst1.nome = @"Instituição 1";
    self.inst1.imagem = imagemArq1;
    
    self.inst2.nome = @"Instituição 2";
    self.inst2.imagem = imagemArq1;

    [dicSections setObject:self.inst1 forKey:@"Instituicao1"];
    [dicSections setObject:self.inst2 forKey:@"Instituicao2"];
    
    [self OrdenaInstituicoes];
}

-(void)OrdenaInstituicoes
{
    NSArray *keys = [dicSections allKeys];
    NSArray *sKeys = [keys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    for(id k in sKeys) {
        id val = [dicSections objectForKey:k];
        [_listaInst addObject:val];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    return _listaInst.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellInstituicao";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
//    cell.imageView.image = [[self.listaInst objectAtIndex:indexPath.row]imagem];
//    Instituicao *instObj = (Instituicao *)dicSections[dicSections.allKeys[indexPath.section]];
//    UILabel *label = (UILabel *)[cell viewWithTag:2];
//    labelNomeInst.backgroundColor = [UIColor lightGrayColor];
    
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    imageView.image = [_listaInst[indexPath.row]imagem];
    UILabel *labelNomeInst = (UILabel *)[cell viewWithTag:5];
    labelNomeInst.text = [_listaInst[indexPath.row]nome];
    cell.tag = indexPath.row;
    
    return cell;
}
//
//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
//{
//    return 1;
//}
//
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return dicSections.allKeys[section];
//}




@end
