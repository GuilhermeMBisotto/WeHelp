//
//  ViewController.h
//  WeHelp
//
//  Created by Bruno Rovea Soares on 24/01/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *campoBusca;
@property NSMutableArray *listaInstituicao;
-(BOOL)textFieldShouldReturn:(UITextField *)textField;
@end
