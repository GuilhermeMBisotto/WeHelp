//
//  ViewController.m
//  WeHelp
//
//  Created by Bruno Rovea Soares on 24/01/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "Instituicao.h"
#import "ListaInstTableViewController.h"
#define Rgb2UIColor(r, g, b)[UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *oi;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;


@property int quantInst;
@end

@implementation ViewController
- (IBAction)heu:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"alert" message:@"Sauna Hour o/" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:@"Cancel", nil];
    [alert show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIColor *navColor = [UIColor colorWithRed:((14) / 255.0) green:((170) / 255.0) blue:((237) / 255.0) alpha:1.0];
    self.navigationController.navigationBar.barTintColor = navColor;
    _listaInstituicao = [[NSMutableArray alloc]init];
    [self CriaInstituicoes];
    
    [_campoBusca setDelegate:self];
    
    NSMutableDictionary *navBarTextAttributes = [NSMutableDictionary dictionaryWithCapacity:1];
    
    [navBarTextAttributes setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName ];
    
    self.navigationController.navigationBar.titleTextAttributes = navBarTextAttributes;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return 6;
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return @"nome da cor";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"gotoListagemInstituicoes"])
    {
        ListaInstTableViewController *tableViewInst = (ListaInstTableViewController *)segue.destinationViewController;
        
        tableViewInst.quantInst = _quantInst;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.campoBusca resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)CriaInstituicoes
{
    
    NSString *nomeImagem = @"logo2.png";
    UIImage *imagemArq1 = [UIImage imageNamed:nomeImagem];
    
    Instituicao *inst1 = [[Instituicao alloc]init];
    Instituicao *inst2 = [[Instituicao alloc]init];
    Instituicao *inst3 = [[Instituicao alloc]init];
    
    inst1.nome = @"Insti 1";
    inst1.imagem = imagemArq1;
    inst1.areaAtuacao = @"Dependentes Quimicos";
    inst1.endereco = @"Avenida Ipiranga";
    inst1.telefone = @"8888-8888";
    inst1.email = @"inst1@inst1.com.br";
    inst1.site = @"www.inst1.com.br";
    inst1.bairro = @"Medianeira";
    inst1.cidade = @"Porto Alegre";
    inst1.uf = @"RS";
    inst1.brevePerfil = @"bre1";
    inst1.missao = @"miss1";
    inst1.principaisParceiros = @"princ1";
    inst1.projeto = @"proj1";
    inst1.comoAjudar = @"Ajuda1";
    inst1.listaImagens = @[@""];
    
    inst2.nome = @"Insti 2";
    inst2.imagem = imagemArq1;
    inst2.areaAtuacao = @"Idoso";
    inst2.endereco = @"Padre Cacique";
    inst2.telefone = @"7777-7777";
    inst2.email = @"inst2@inst2.com.br";
    inst2.site = @"www.inst2.com.br";
    inst2.bairro = @"Mooca";
    inst2.cidade = @"São Paulo";
    inst2.uf = @"SP";
    inst2.brevePerfil = @"bre2";
    inst2.missao = @"miss2";
    inst2.principaisParceiros = @"princ2";
    inst2.projeto = @"proj2";
    inst2.comoAjudar = @"Ajudar2";
    inst2.listaImagens = @[@""];
    
    inst3.nome = @"Insti 3";
    inst3.imagem = imagemArq1;
    inst3.areaAtuacao = @"Crianças";
    inst3.endereco = @"José Bonifácio";
    inst3.telefone = @"6666-6666";
    inst3.email = @"inst3@inst3.com.br";
    inst3.site = @"www.inst3.com.br";
    inst3.bairro = @"Ipanema";
    inst3.cidade = @"Rio de Janeiro";
    inst3.uf = @"RJ";
    inst3.brevePerfil = @"bre3";
    inst3.missao = @"miss3";
    inst3.principaisParceiros = @"princ3";
    inst3.projeto = @"proj3";
    inst3.comoAjudar = @"Ajudar3";
    inst3.listaImagens = @[@""];
    
    [_listaInstituicao addObject:inst1];
    [_listaInstituicao addObject:inst2];
    [_listaInstituicao addObject:inst3];
    
    _quantInst = _listaInstituicao.count;
    
    //Salva os dados
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    for(int i = 0; i < _listaInstituicao.count;i++)
    {
        Instituicao *aux = [_listaInstituicao objectAtIndex:i];
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
//        NSString *keyTelefone = [NSString stringWithFormat:@"telefone%d",i];
        
        
        NSString *imagemName = [[NSString alloc]init];
        imagemName = aux.imagem.description;
        
        [defaults setObject:aux.nome forKey:keyNome];
        [defaults setObject:imagemName forKey:keyImagem];
        [defaults setObject:aux.areaAtuacao forKey:keyAreaAtuacao];
        [defaults setObject:aux.endereco forKey:keyEndereco];
        [defaults setObject:aux.telefone forKey:keyTelefone];
        
        [defaults setObject:aux.email forKey:keyEmail];
        [defaults setObject:aux.site forKey:keySite];
        [defaults setObject:aux.bairro forKey:keyBairro];
        [defaults setObject:aux.cidade forKey:keyCidade];
        [defaults setObject:aux.uf forKey:keyUf];
        [defaults setObject:aux.brevePerfil forKey:keyBrevePerfil];
        [defaults setObject:aux.missao forKey:keyMissao];
        [defaults setObject:aux.principaisParceiros forKey:keyPrincipaisParceiros];
        [defaults setObject:aux.projeto forKey:keyProjeto];
        [defaults setObject:aux.comoAjudar forKey:keyComoAjudar];
//        [defaults setObject:aux.telefone forKey:keyTelefone];
    }
    
//    [defaults synchronize];
}

@end
