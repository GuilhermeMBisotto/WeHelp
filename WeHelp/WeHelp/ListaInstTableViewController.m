//
//  ListaInstTableViewController.m
//  WeHelp
//
//  Created by Jáder Borba Nunes on 27/01/14.
//  Copyright (c) 2014 Jáder Borba Nunes. All rights reserved.
//

#import "ListaInstTableViewController.h"
#import "DetalheInstituicaoTableViewController.h"
@interface ListaInstTableViewController ()
{
 //   NSMutableDictionary *dicSections;
    int instSelected;
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
    NSMutableDictionary *navBarTextAttributes = [NSMutableDictionary dictionaryWithCapacity:1];
    [navBarTextAttributes setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName ];
    self.navigationController.navigationBar.titleTextAttributes = navBarTextAttributes;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
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
        NSString *keyEmail = [NSString stringWithFormat:@"email%d",i];
        NSString *keySite = [NSString stringWithFormat:@"site%d",i];
        NSString *keyBairro = [NSString stringWithFormat:@"bairro%d",i];
        NSString *keyCidade = [NSString stringWithFormat:@"cidade%d",i];
        NSString *keyUf = [NSString stringWithFormat:@"uf%d",i];
        NSString *keyBrevePerfil = [NSString stringWithFormat:@"brevePerfil%d",i];
        NSString *keyMissao = [NSString stringWithFormat:@"missao%d",i];
        NSString *keyPrincipaisParceiros = [NSString stringWithFormat:@"principaisParceiros%d",i];
        NSString *keyProjeto = [NSString stringWithFormat:@"projeto%d",i];
        NSString *keyComoAjudar = [NSString stringWithFormat:@"comoAjdar%d",i];
        
        NSString *nomeImagem = [NSString stringWithFormat:@"image%dinst%d.jpeg",i+1,i+1];
        UIImage *imagemArq1 = [UIImage imageNamed:nomeImagem];
        
        inst.imagem = imagemArq1;
        
        inst.nome = [defaults objectForKey:keyNome];
        inst.areaAtuacao = [defaults objectForKey:keyAreaAtuacao];
        inst.endereco = [defaults objectForKey:keyEndereco];
        inst.telefone = [defaults objectForKey:keyTelefone];
        inst.email = [defaults objectForKey:keyEmail];
        inst.site = [defaults objectForKey:keySite];
        inst.bairro = [defaults objectForKey:keyBairro];
        inst.cidade = [defaults objectForKey:keyCidade];
        inst.uf = [defaults objectForKey:keyUf];
        inst.brevePerfil = [defaults objectForKey:keyBrevePerfil];
        inst.missao = [defaults objectForKey:keyMissao];
        inst.principaisParceiros = [defaults objectForKey:keyPrincipaisParceiros];
        inst.projeto = [defaults objectForKey:keyProjeto];
        inst.comoAjudar = [defaults objectForKey:keyComoAjudar];
        
        NSMutableArray *arrayImage = [[NSMutableArray alloc]init];
//        arrayImage = [[NSMutableArray alloc]init];
        
        for(int j = 1; j <= 5;j++){
            NSString *imgName = [NSString stringWithFormat:@"image%dinst%d.jpeg",j,i+1];
//            UIImageView *image1 = [[UIImageView alloc]init];
//            image1.image = [UIImage imageNamed:imgName];
            [arrayImage addObject:imgName];
//            [inst.listaImagens addObject:imgName];
        }
        
        inst.listaImagens = arrayImage;
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

    
//    NSLog(@"TELEFONE: %@",[_listaInstituicoesReceiv[indexPath.row]telefone]);
    
    
    UIButton *botaoTelefone = (UIButton *)[cell viewWithTag:4];
    UILabel *labelButton = [[UILabel alloc]init];
    labelButton.text = [_listaInstituicoesReceiv[indexPath.row]telefone];
    
    [botaoTelefone setTitle:labelButton.text forState:UIControlStateNormal];
    
//    NSLog(@"TAG: %ld",botaoTelefone.titleLabel.tag);
//    NSLog(@"TEXTO: %@",botaoTelefone.titleLabel.text);
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

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    instSelected = indexPath.row;
    return indexPath;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"gotoDetalheInstituicao"])
    {
        DetalheInstituicaoTableViewController *detalheInst = (DetalheInstituicaoTableViewController *)segue.destinationViewController;
        
        [detalheInst.navigationItem setTitle:[_listaInstituicoesReceiv[instSelected]nome]];
        detalheInst.instituicao = _listaInstituicoesReceiv[instSelected];
    }
}








@end
