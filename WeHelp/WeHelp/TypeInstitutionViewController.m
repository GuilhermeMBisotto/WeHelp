//
//  TypeInstitutionViewController.m
//  WeHelp
//
//  Created by Guilherme Moresco Bisotto on 1/28/14.
//  Copyright (c) 2014 Guilherme Moresco Bisotto. All rights reserved.
//

#import "TypeInstitutionViewController.h"

@interface TypeInstitutionViewController ()

@end

@implementation TypeInstitutionViewController
{
    NSArray *typesOfInstitution;
    NSMutableArray *checks;
    NSMutableArray *auxListTypes;
}

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

    NSMutableDictionary *navBarTextAttributes = [NSMutableDictionary dictionaryWithCapacity:1];
    self.navigationItem.hidesBackButton = YES;
    [navBarTextAttributes setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName ];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.titleTextAttributes = navBarTextAttributes;
    NSArray *auxList = @[@"Idosos", @"Crianças Carente", @"Crianças com Deficiencia", @"Jovens e Adultos Carentes", @"Jáder", @"Novinhas"];
    typesOfInstitution = auxList;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return typesOfInstitution.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellTypes";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *lblTitle = (UILabel *)[cell viewWithTag:9000];
    lblTitle.text = [typesOfInstitution objectAtIndex:indexPath.row];
    cell.tag = indexPath.row;

    if([_arrayTypes indexOfObject:cell.textLabel.text] != NSNotFound)
    {
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath   *)indexPath
{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if(cell.accessoryType == UITableViewCellSelectionStyleNone)
    {
        [_arrayTypes addObject:cell.textLabel.text];
    }
    else
    {
        [_arrayTypes removeObject:cell.textLabel.text];
    }
    [self.tableView reloadData];
}

//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"Desmarcou");
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//    [self.arrayTypes removeObject:cell.textLabel.text];
//    [self.tableView reloadData];
//}

- (IBAction)goBack:(id)sender {
    
    [self performSegueWithIdentifier:@"goBackToMaster" sender:nil];
}

@end

