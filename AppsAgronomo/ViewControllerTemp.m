//
//  ViewController.m
//  ConversorAgrario
//
//  Created by Fabricio Aguiar de Padua on 30/10/13.
//  Copyright (c) 2013 Pro Master Solution. All rights reserved.
//
#import "AppDelegate.h"
#import "ViewControllerTemp.h"
#import "SWRevealViewController.h"



@interface ViewControllerTemp ()

@end

@implementation ViewControllerTemp

@synthesize ItemDe    = _ItemDe;
@synthesize ItemPara  = _ItemPara;
@synthesize TextoDe   = _TextoDe;
@synthesize TextoPara = _TextoPara;
@synthesize ViewApper;
@synthesize TitlePurchase;
@synthesize DescriptionPurchase;

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self Carregar_Itens];
    
    [ViewApper setFrame:[[UIScreen mainScreen] bounds]];
    
    [self.navigationController.view addSubview:ViewApper];
    
    // [self.view addSubview:ViewApper];
    
    self.title = @"Temperatura";
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_LabelDE      resignFirstResponder];
    [_LabelPara    resignFirstResponder];
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    CalcularTemp * ObjCalcular = [[CalcularTemp alloc]init];
    _LabelPara.text = [ObjCalcular Calcular_Temperatura:str : ItemDe : ItemPara];
    
    return YES;
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [_LabelDE resignFirstResponder];
    
    return YES;
}


- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == De)
        return [ArrayDe count];
    if (component == Para)
        return [ArrayPara count];
    
    return 0;
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == De)
        return [ArrayDe objectAtIndex:row];
    
    if (component == Para)
        return [ArrayPara objectAtIndex:row];
    
    return 0;
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    CalcularTemp * ObjCalcular = [[CalcularTemp alloc]init];
    
    ItemDe   = [ArrayDe objectAtIndex:[pickerView selectedRowInComponent:0]];
    ItemPara = [ArrayPara objectAtIndex:[pickerView selectedRowInComponent:1]];
    
    _LabelPara.text = [ObjCalcular Calcular_Temperatura:_LabelDE.text : ItemDe : ItemPara];
    
}
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:[ArrayDe objectAtIndex:row] attributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    return attString;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) Carregar_Itens {
    CalcularTemp * ObjCalcular = [[CalcularTemp alloc]init];
    ArrayDe   = [ObjCalcular CarregarArray];
    ArrayPara = [ObjCalcular CarregarArray];
}

@end
