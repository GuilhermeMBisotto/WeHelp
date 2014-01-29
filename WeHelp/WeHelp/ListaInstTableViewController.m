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
 //   NSMutableDictionary *dicSections;
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
    
//    dicSections = [[NSMutableDictionary alloc] init];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self CarregaInstituicoes];
}

-(void) CarregaInstituicoes
{
    NSMutableArray *listIns = [[NSMutableArray alloc]init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    for(int i = 0; i < _quantInst;i++)
    {
        Instituicao *inst = [[Instituicao alloc]init];
        NSString *keyNome = [NSString stringWithFormat:@"nome%d",i];
        NSString *keyImagem = [NSString stringWithFormat:@"imagem%d",i];
        NSString *keyAreaAtuacao = [NSString stringWithFormat:@"areaAtuacao%d",i];
        NSString *keyEndereco = [NSString stringWithFormat:@"endereco%d",i];
        NSString *keyTelefone = [NSString stringWithFormat:@"telefone%d",i];
        
        NSString *nomeImagem = @"logo2.png";
        UIImage *imagemArq1 = [UIImage imageNamed:nomeImagem];
        
        inst.imagem = imagemArq1;
        
        inst.nome = [defaults objectForKey:keyNome];
        inst.areaAtuacao = [defaults objectForKey:keyAreaAtuacao];
        inst.endereco = [defaults objectForKey:keyEndereco];
        inst.telefone = [defaults objectForKey:keyTelefone];
        
        [listIns addObject:inst];
    }
    
    _listaInstituicoesReceiv = listIns;
    
//    Instituicao *inst1 = [[Instituicao alloc]init];
//    Instituicao *inst2 = [[Instituicao alloc]init];
//    
//    NSString *nomeImagem = @"logo2.png";
//    UIImage *imagemArq1 = [UIImage imageNamed:nomeImagem];
//    
//    inst1.nome = @"Instituição 1";
//    inst1.imagem = imagemArq1;
//    
//    inst2.nome = @"Instituição 2";
//    inst2.imagem = imagemArq1;

//    [dicSections setObject:inst1 forKey:@"Instituicao1"];
//    [dicSections setObject:inst2 forKey:@"Instituicao2"];
    
    
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
    return _listaInstituicoesReceiv.count;
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
    imageView.image = [_listaInstituicoesReceiv[indexPath.row]imagem];
    
    UILabel *labelNomeInst = (UILabel *)[cell viewWithTag:5];
    labelNomeInst.text = [_listaInstituicoesReceiv[indexPath.row]nome];
    
    UILabel *labelAreaAtuacaoInst = (UILabel *)[cell viewWithTag:2];
    [labelAreaAtuacaoInst setText:[_listaInstituicoesReceiv[indexPath.row]areaAtuacao]];

    UILabel *labelEnderecoInst = (UILabel *)[cell viewWithTag:3];
    [labelEnderecoInst setText:[_listaInstituicoesReceiv[indexPath.row]endereco]];

    
    NSLog(@"TELEFONE: %@",[_listaInstituicoesReceiv[indexPath.row]telefone]);
    
    
    UIButton *botaoTelefone = (UIButton *)[cell viewWithTag:4];
    UILabel *labelButton = [[UILabel alloc]init];
    labelButton.text = [_listaInstituicoesReceiv[indexPath.row]telefone];
    
    [botaoTelefone setTitle:labelButton.text forState:UIControlStateNormal];
    
    NSLog(@"TAG: %ld",botaoTelefone.titleLabel.tag);
    NSLog(@"TEXTO: %@",botaoTelefone.titleLabel.text);
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
