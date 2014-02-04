//
//  DetalheInstituicaoTableViewController.m
//  WeHelp
//
//  Created by Bruno Rovea Soares on 27/01/14.
//  Copyright (c) 2014 Bruno Rovea Soares. All rights reserved.
//

#import "DetalheInstituicaoTableViewController.h"

@interface DetalheInstituicaoTableViewController ()

@end

@implementation DetalheInstituicaoTableViewController
{
    NSArray *arrayImage;
    NSInteger pageNumber;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrayImage = [[NSMutableArray alloc]init];
    UIImage *image1 = [UIImage imageNamed:self.instituicao.listaImagens[0]];
    UIImage *image2 = [UIImage imageNamed:self.instituicao.listaImagens[1]];
    UIImage *image3 = [UIImage imageNamed:self.instituicao.listaImagens[2]];
    UIImage *image4 = [UIImage imageNamed:self.instituicao.listaImagens[3]];
    UIImage *image5 = [UIImage imageNamed:self.instituicao.listaImagens[4]];
    
//
    
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section){
        case 0:{
            return @"Detalhes";
            break;
        }
        case 1:{
            return @"Informações Gerais";
            break;
        }
        case 2:{
            return @"Breve perfil e histórico";
            break;
        }
        case 3:{
            return @"Missão/Valores";
            break;
        }
        case 4:{
            return @"Área de atuação";
            break;
        }
        case 5:{
            return @"Principais parceiros";
            break;
        }
        case 6:{
            return @"Projetos";
            break;
        }
        case 7:{
            return @"Como ajudar";
            break;
        }
        case 8:{
            return @"Faça sua doação em dinheiro";
            break;
        }
    } return @"";
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section){
        case 0:{
            return 1;
            break;
        }
        case 1:{
            return 7;
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
        case 8:{
            return 1;
            break;
        }
        case 9:{
            return 1;
            break;
        }
    } return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 249;
    } else if (indexPath.section == 8){
            return 150;
    } else if (indexPath.section == 9){
        return 55;
    }
    else {
        return 45;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    switch (indexPath.section){
        case 0:{//Imagens
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection0" forIndexPath:indexPath];
            
            UIScrollView *scrImage = (UIScrollView *)[cell viewWithTag:01];
            scrImage.contentSize = CGSizeMake((scrImage.frame.size.width) * arrayImage.count, scrImage.frame.size.height);
            
            pageNumber = round(scrImage.contentOffset.x / scrImage.frame.size.width);

            UIImageView * esquerda = (UIImageView *)[cell viewWithTag:8];
            UIImageView * direita = (UIImageView *)[cell viewWithTag:7];
            
            if (round(scrImage.contentOffset.x / scrImage.frame.size.width) == 0){
                esquerda.hidden = YES;
            }
            else
                esquerda.hidden = NO;
            
            if (round(scrImage.contentOffset.x / scrImage.frame.size.width) == 4) {
                direita.hidden = YES;
            }
            else
                direita.hidden = NO;
            
            UIImageView *imageView = (UIImageView *)[scrImage viewWithTag:02];
            UIImageView *imageView2 = (UIImageView *)[scrImage viewWithTag:03];
            UIImageView *imageView3 = (UIImageView *)[scrImage viewWithTag:04];
            UIImageView *imageView4 = (UIImageView *)[scrImage viewWithTag:05];
            UIImageView *imageView5 = (UIImageView *)[scrImage viewWithTag:06];
            imageView.image = arrayImage[0];
            imageView2.image = arrayImage[1];
            imageView3.image = arrayImage[2];
            imageView4.image = arrayImage[3];
            imageView5.image = arrayImage[4];
            
            break;
        }
        case 1:{//Informações Gerais
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection1" forIndexPath:indexPath];
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
        case 2:{//Breve Perfil
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection2" forIndexPath:indexPath];
            UILabel *lblSaibaMais = (UILabel *)[cell viewWithTag:21];
            UILabel *lblTexto = (UILabel *)[cell viewWithTag:22];
            lblSaibaMais.text = @"Saiba mais";
            lblSaibaMais.adjustsFontSizeToFitWidth = YES;
            lblTexto.text = self.instituicao.brevePerfil;
            
            break;
            
        }
        case 3:{//Missao
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection3" forIndexPath:indexPath];
            UILabel *lblSaibaMais = (UILabel *)[cell viewWithTag:31];
            UILabel *lblTexto = (UILabel *)[cell viewWithTag:32];
            lblSaibaMais.text = @"Saiba mais";
            lblSaibaMais.adjustsFontSizeToFitWidth = YES;
            lblTexto.text = self.instituicao.missao;
            break;
        }
        case 4:{//Area Atuacao
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection4" forIndexPath:indexPath];
            UILabel *lblSaibaMais = (UILabel *)[cell viewWithTag:41];
            UILabel *lblTexto = (UILabel *)[cell viewWithTag:42];
            lblSaibaMais.text = @"Saiba mais";
            lblSaibaMais.adjustsFontSizeToFitWidth = YES;
            lblTexto.text = self.instituicao.areaAtuacao;
            break;
        }
        case 5:{//Principais Parceiros
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection5" forIndexPath:indexPath];
            UILabel *lblSaibaMais = (UILabel *)[cell viewWithTag:51];
            UILabel *lblTexto = (UILabel *)[cell viewWithTag:52];
            lblSaibaMais.text = @"Saiba mais";
            lblSaibaMais.adjustsFontSizeToFitWidth = YES;
            lblTexto.text = self.instituicao.principaisParceiros;
            break;
        }
        case 6:{//Projetos
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection6" forIndexPath:indexPath];
            UILabel *lblSaibaMais = (UILabel *)[cell viewWithTag:61];
            UILabel *lblTexto = (UILabel *)[cell viewWithTag:62];
            lblSaibaMais.text = @"Saiba mais";
            lblSaibaMais.adjustsFontSizeToFitWidth = YES;
            lblTexto.text = self.instituicao.projeto;
            break;
        }
        case 7:{//Como Ajudar
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection7" forIndexPath:indexPath];
            UILabel *lblSaibaMais = (UILabel *)[cell viewWithTag:71];
            UILabel *lblTexto = (UILabel *)[cell viewWithTag:72];
            lblSaibaMais.text = @"Saiba mais";
            lblSaibaMais.adjustsFontSizeToFitWidth = YES;
            lblTexto.text = self.instituicao.comoAjudar;
            break;
        }
        case 8:{//Faça sua doacao em dinheiro
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection8" forIndexPath:indexPath];
            break;
        }
        case 9:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection9" forIndexPath:indexPath];
            break;

        }
    }
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 01)
    {
        pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width);
    }
}

@end