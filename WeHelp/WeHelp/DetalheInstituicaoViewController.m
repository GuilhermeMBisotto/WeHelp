//
//  DetalheInstituicaoViewController.m
//  WeHelp
//
//  Created by Bruno Rovea Soares on 05/02/14.
//  Copyright (c) 2014 Bruno Rovea Soares. All rights reserved.
//

#import "DetalheInstituicaoViewController.h"

@interface DetalheInstituicaoViewController ()

@end

@implementation DetalheInstituicaoViewController
@synthesize scrollView;
@synthesize tableView;

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

    arrayImage = [[NSMutableArray alloc]init];
    
    UIImageView *imageView = (UIImageView *)[scrollView viewWithTag:101];
    UIImageView *imageView2 = (UIImageView *)[scrollView viewWithTag:102];
    UIImageView *imageView3 = (UIImageView *)[scrollView viewWithTag:103];
    UIImageView *imageView4 = (UIImageView *)[scrollView viewWithTag:104];
    UIImageView *imageView5 = (UIImageView *)[scrollView viewWithTag:105];
    
    imageView.backgroundColor = [UIColor redColor];
        imageView2.backgroundColor = [UIColor blackColor];
        imageView3.backgroundColor = [UIColor yellowColor];
        imageView4.backgroundColor = [UIColor redColor];
        imageView5.backgroundColor = [UIColor orangeColor];
    //    imageView.image = [UIImage imageNamed:self.instituicao.listaImagens[1]];
//    imageView2.image = [UIImage imageNamed:self.instituicao.listaImagens[0]];
//    imageView3.image = [UIImage imageNamed:self.instituicao.listaImagens[2]];
//    imageView4.image = [UIImage imageNamed:self.instituicao.listaImagens[3]];
//    imageView5.image = [UIImage imageNamed:self.instituicao.listaImagens[4]];
    
    arrayImage = @[imageView,imageView2,imageView3,imageView4,imageView5];
    
    esquerda = (UIImageView *)[self.view viewWithTag:1];
    direita = (UIImageView *)[self.view viewWithTag:2];
   
//    NSLog(@"TOTAL IMAGENS: %ld",self.instituicao.listaImagens.count);
//    for (int i = 0 ; i < self.instituicao.listaImagens.count; i++)
//    {
//        
//        //        UIImage *image = [UIImage imageNamed:[self.instituicao.listaImagens objectAtIndex:i]];
//        //        image = [self.instituicao.listaImagens objectAtIndex:i];
//        
//        NSLog(@"NOME IMAGEM: %@",self.instituicao.nome);
//        //        [arrayImage addObject:image];
//    }

    
    [NSTimer scheduledTimerWithTimeInterval:0.75 target:self selector:@selector(adjustScroll) userInfo:nil repeats:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(adjustScroll) userInfo:nil repeats:NO];
}

- (void)adjustScroll
{
    scrollView.contentSize = CGSizeMake((scrollView.frame.size.width) * arrayImage.count, scrollView.frame.size.height);
    pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width);
//    CGPoint offSet = CGPointMake(5 * scrollView.bounds.size.width, 0);
//    [scrollView setContentOffset:offSet animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section){
        case 0:{
            return @"Informações Gerais";
            break;
        }
        case 1:{
            return @"Breve perfil e histórico";
            break;
        }
        case 2:{
            return @"Missão/Valores";
            break;
        }
        case 3:{
            return @"Área de atuação";
            break;
        }
        case 4:{
            return @"Principais parceiros";
            break;
        }
        case 5:{
            return @"Projetos";
            break;
        }
        case 6:{
            return @"Como ajudar";
            break;
        }
        case 7:{
            return @"Faça sua doação em dinheiro";
            break;
        }
    } return @"";
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section){
        case 0:{
            return 7;
            break;
        }
        case 1:{
            return 1;
            break;
        }
        case 2:{
            return 1;
            break;
        }
        case 3:{
            return 1;
            break;
        }
        case 4:{
            return 1;
            break;
        }
        case 5:{
            return 1;
            break;
        }
        case 6:{
            return 1;
            break;
        }
        case 7:{
            return 1;
            break;
        }
    } return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 7){
        return 150;
    }
    else {
        return 45;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    switch (indexPath.section){
        case 0:{//Informações Gerais
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection0" forIndexPath:indexPath];
            UILabel *lblTitulo = (UILabel *)[cell viewWithTag:11];
            UILabel *lblDesc = (UILabel *)[cell viewWithTag:12];
            UIButton *butBut = (UIButton *)[cell viewWithTag:13];
            
            switch (indexPath.row){
                case 0:{
                    lblDesc.hidden = YES;
                    lblTitulo.text = @"Site: ";
                    [butBut setTitle:self.instituicao.site forState:UIControlStateNormal];
                    break;
                }
                case 1:{
                    lblDesc.hidden = YES;
                    lblTitulo.text = @"E-mail: ";
                    [butBut setTitle:self.instituicao.email forState:UIControlStateNormal];
                    break;
                }
                case 2:{
                    lblDesc.hidden = YES;
                    lblTitulo.text = @"Telefone: ";
                    [butBut setTitle:self.instituicao.telefone forState:UIControlStateNormal];
                    break;
                }
                case 3:{
                    butBut.hidden = YES;
                    lblTitulo.text = @"Endereço: ";
                    [lblDesc setText:self.instituicao.endereco];
                    break;
                }
                case 4:{
                    butBut.hidden = YES;
                    lblTitulo.text = @"Bairro: ";
                    [lblDesc setText:self.instituicao.bairro];
                    break;
                }
                case 5:{
                    butBut.hidden = YES;
                    lblTitulo.text = @"Cidade: ";
                    [lblDesc setText:self.instituicao.cidade];
                    break;
                }
                case 6:{
                    butBut.hidden = YES;
                    lblTitulo.text = @"UF: ";
                    [lblDesc setText:self.instituicao.uf];
                    break;
                }
            }
            break;
        }
        case 1:{//Breve Perfil
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection1" forIndexPath:indexPath];
            UILabel *lblSaibaMais = (UILabel *)[cell viewWithTag:21];
            UILabel *lblTexto = (UILabel *)[cell viewWithTag:22];
            lblSaibaMais.text = @"Saiba mais";
            lblSaibaMais.adjustsFontSizeToFitWidth = YES;
            lblTexto.text = self.instituicao.brevePerfil;
            
            break;
            
        }
        case 2:{//Missao
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection2" forIndexPath:indexPath];
            UILabel *lblSaibaMais = (UILabel *)[cell viewWithTag:31];
            UILabel *lblTexto = (UILabel *)[cell viewWithTag:32];
            lblSaibaMais.text = @"Saiba mais";
            lblSaibaMais.adjustsFontSizeToFitWidth = YES;
            lblTexto.text = self.instituicao.missao;
            break;
        }
        case 3:{//Area Atuacao
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection3" forIndexPath:indexPath];
            UILabel *lblSaibaMais = (UILabel *)[cell viewWithTag:41];
            UILabel *lblTexto = (UILabel *)[cell viewWithTag:42];
            lblSaibaMais.text = @"Saiba mais";
            lblSaibaMais.adjustsFontSizeToFitWidth = YES;
            lblTexto.text = self.instituicao.areaAtuacao;
            break;
        }
        case 4:{//Principais Parceiros
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection4" forIndexPath:indexPath];
            UILabel *lblSaibaMais = (UILabel *)[cell viewWithTag:51];
            UILabel *lblTexto = (UILabel *)[cell viewWithTag:52];
            lblSaibaMais.text = @"Saiba mais";
            lblSaibaMais.adjustsFontSizeToFitWidth = YES;
            lblTexto.text = self.instituicao.principaisParceiros;
            break;
        }
        case 5:{//Projetos
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection5" forIndexPath:indexPath];
            UILabel *lblSaibaMais = (UILabel *)[cell viewWithTag:61];
            UILabel *lblTexto = (UILabel *)[cell viewWithTag:62];
            lblSaibaMais.text = @"Saiba mais";
            lblSaibaMais.adjustsFontSizeToFitWidth = YES;
            lblTexto.text = self.instituicao.projeto;
            break;
        }
        case 6:{//Como Ajudar
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection6" forIndexPath:indexPath];
            UILabel *lblSaibaMais = (UILabel *)[cell viewWithTag:71];
            UILabel *lblTexto = (UILabel *)[cell viewWithTag:72];
            lblSaibaMais.text = @"Saiba mais";
            lblSaibaMais.adjustsFontSizeToFitWidth = YES;
            lblTexto.text = self.instituicao.comoAjudar;
            break;
        }
        case 7:{//Faça sua doacao em dinheiro
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection7" forIndexPath:indexPath];
            break;
        }
    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (scrollView.tag == 01)
    {
        pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width);
    }
    
    if (round(scrollView.contentOffset.x / scrollView.frame.size.width) == 0){
        esquerda.hidden = YES;
    }
    else
        esquerda.hidden = NO;
    
    if (round(scrollView.contentOffset.x / scrollView.frame.size.width) == 4) {
        direita.hidden = YES;
    }
    else
        direita.hidden = NO;
}


@end
