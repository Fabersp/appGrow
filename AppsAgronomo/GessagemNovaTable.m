//
//  CalagemNovaTable.m
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 26/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import "GessagemNovaTable.h"
#import "BuscarProprietarioTable.h"
#import "IQActionSheetPickerView.h"




@interface GessagemNovaTable ()<IQActionSheetPickerViewDelegate>

@end

@implementation GessagemNovaTable

@synthesize txtProprietario;
@synthesize txtPropriedade;
@synthesize txtData;
@synthesize txtElementoAl;
@synthesize txtElementoCa;
@synthesize txtElementoArgila;
@synthesize listaSelect;
@synthesize txtAmostra;
@synthesize LbResultadoFinal;
@synthesize gessagem;
@synthesize ValorFinal = _ValorFinal;
@synthesize LbLegendaResultado;
@synthesize txtSolo;

@synthesize selectedIndexPath = _selectedIndexPath;


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
    btnCalcular.layer.cornerRadius = 8.0f;
    btnCalcular.layer.masksToBounds = YES;
    
    if (gessagem){
        [txtProprietario setText:[gessagem valueForKey:@"proprietario"]];
        [txtPropriedade setText:[gessagem valueForKey:@"propriedade"]];
        [txtData setText:[gessagem valueForKey:@"data"]];
        [txtAmostra setText:[gessagem valueForKey:@"amostra"]];
        [txtSolo setText:[gessagem valueForKey:@"tipoSolo"]];
        [LbLegendaResultado setText:[gessagem valueForKey:@"legendaResultado"]];
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        
        NSString * ValorArgila    = [formatter stringForObjectValue:[gessagem valueForKey:@"argila"]];
        NSString * ValorCa        = [formatter stringForObjectValue:[gessagem valueForKey:@"calcio"]];
        NSString * ValorAl        = [formatter stringForObjectValue:[gessagem valueForKey:@"aluminio"]];
        NSString * ResultadoFinal = [formatter stringForObjectValue:[gessagem valueForKey:@"resultado"]];
        
        [txtElementoArgila setText:[ValorArgila stringByReplacingOccurrencesOfString:@"." withString:@","]];
        [txtElementoCa     setText:[ValorCa   stringByReplacingOccurrencesOfString:@"." withString:@","]];
        [txtElementoAl     setText:[ValorAl   stringByReplacingOccurrencesOfString:@"." withString:@","]];
        [LbResultadoFinal  setText:[NSString  stringWithFormat:@"%@ (t/ha) de cal.", [ResultadoFinal stringByReplacingOccurrencesOfString:@"." withString:@","]]];
    }
    // ***** Botão direito **** //
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    // Note: Edit SampleConstants.h to update kSampleAdUnitId with your interstitial ad unit id.
    
    [self.loadingSpinner startAnimating];
    /*NSUserDefaults *SaveApp = [NSUserDefaults standardUserDefaults];
     bool saved = [SaveApp boolForKey:Coluna];
     if (!saved) {
     Salvar.enabled = YES;
     btnCalcular.enabled = YES;
     }else {
     Salvar.enabled = NO;
     btnCalcular.enabled = NO;
     }*/


    
}


#pragma mark GADBannerViewDelegate implementation

// We've received an ad successfully.


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.loadingSpinner.center = CGPointMake(CGRectGetWidth(self.view.bounds) / 2,
                                             self.loadingSpinner.center.y);
}

#pragma mark GADInterstitialDelegate implementation



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnCalendario:(id)sender {
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"" delegate:self];
    [picker setActionSheetPickerStyle:IQActionSheetPickerStyleDatePicker];
    [picker show];
}



-(void)actionSheetPickerView:(IQActionSheetPickerView *)pickerView didSelectDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; // here we create
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];// here set format which you want...
    NSString *convertedString = [dateFormatter stringFromDate:date];
    NSLog(@"Converted String : %@",convertedString);
    txtData.text = convertedString;
}




- (IBAction)Voltar:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSManagedObjectContext *) managedObjectContext
{
    NSManagedObjectContext * context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (IBAction)Salvar:(id)sender {
    [self Calcular];
    if ([txtProprietario.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Erro"
                              message:@"É necessário preencher o Nome!!"
                              delegate:nil cancelButtonTitle:nil
                              otherButtonTitles:@"ok", nil];
        [alert show];
    } else {
        NSManagedObjectContext * context = [self managedObjectContext];
        
        if (gessagem) {
            // update calagem
            NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            
            NSNumber * ValorArgila    = [f numberFromString:[txtElementoArgila.text stringByReplacingOccurrencesOfString:@"." withString:@","]];
            NSNumber * ValorAl        = [f numberFromString:[txtElementoAl.text  stringByReplacingOccurrencesOfString:@"." withString:@","]];
            NSNumber * ValorCa        = [f numberFromString:[txtElementoCa.text stringByReplacingOccurrencesOfString:@"." withString:@","]];
            
            NSNumber * ResultadoFinal = [f numberFromString:[_ValorFinal stringByReplacingOccurrencesOfString:@"." withString:@","]];
            
            [gessagem setValue:txtProprietario.text forKey:@"proprietario"];
            [gessagem setValue:txtPropriedade.text forKey:@"propriedade"];
            [gessagem setValue:ValorArgila forKey:@"argila"];
            [gessagem setValue:ValorCa forKey:@"calcio"];
            [gessagem setValue:ValorAl forKey:@"aluminio"];
            [gessagem setValue:txtAmostra.text forKey:@"amostra"];
            [gessagem setValue:txtData.text forKey:@"data"];
            [gessagem setValue:txtSolo.text forKey:@"tipoSolo"];
            [gessagem setValue:ResultadoFinal forKey:@"resultado"];
            [gessagem setValue:LbLegendaResultado.text forKey:@"legendaResultado"];
            
        } else {
            //criar nova calagem
            NSManagedObject * novaCalagem = [NSEntityDescription insertNewObjectForEntityForName:@"Gessagem" inManagedObjectContext:context];
            
            NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            
            NSNumber * valorArgila    = [f numberFromString:txtElementoArgila.text];
            NSNumber * valorCa        = [f numberFromString:txtElementoCa.text];
            NSNumber * ValorAl        = [f numberFromString:txtElementoAl.text];
            NSNumber * ResultadoFinal = [f numberFromString:_ValorFinal];
            
            [novaCalagem setValue:txtProprietario.text forKey:@"proprietario"];
            [novaCalagem setValue:txtPropriedade.text forKey:@"propriedade"];
            [novaCalagem setValue:txtData.text forKey:@"data"];
            [novaCalagem setValue:txtAmostra.text forKey:@"amostra"];
            [novaCalagem setValue:valorArgila forKey:@"argila"];
            [novaCalagem setValue:valorCa forKey:@"calcio"];
            [novaCalagem setValue:ValorAl forKey:@"aluminio"];
            [novaCalagem setValue:txtSolo.text forKey:@"tipoSolo"];
            [novaCalagem setValue:ResultadoFinal forKey:@"resultado"];
            [novaCalagem setValue:LbLegendaResultado.text forKey:@"legendaResultado"];
        }
        
        NSError * error = nil;
        if (![context save:&error]) {
            //  NSLog(@"Falha ao salvar!", error, [error localizedDescription]);
        }
        

        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)actionSheetPickerView:(IQActionSheetPickerView *)pickerView didSelectTitles:(NSArray *)titles
{
     txtSolo.text = [titles objectAtIndex:0];
}


- (IBAction)btnPesquisarSolo:(id)sender {
    listaSelect = [[NSMutableArray alloc] init];
    [listaSelect addObject:@"Argiloso e Arenoso"];
    [listaSelect addObject:@"Argiloso"];
    
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"" delegate:self];
    
    [picker setTitlesForComponenets:@[listaSelect]];
    [picker show];
    
    
    /* NSString * result = [[selectedRows valueForKey:@"description"] componentsJoinedByString:@""];
        
        if ([result isEqualToString:@"0"]) {
            txtSolo.text = @"Argiloso e Arenoso";
        }
        if ([result isEqualToString:@"1"]) {
            txtSolo.text = @"Argiloso";
        }
   */
    LbResultadoFinal.text = @"";
    LbLegendaResultado.text = @"";
}

- (IBAction)btnCalcular:(id)sender {
    [self Calcular];
}

- (void) Calcular {
    NSString * ValorCaStr     = [txtElementoCa.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString * ValorAlStr     = [txtElementoAl.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString * ValorArgilaStr = [txtElementoArgila.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    
    double ValorCa     = [ValorCaStr     doubleValue];
    double ValorArgila = [ValorArgilaStr doubleValue];
    double ValorAl     = [ValorAlStr     doubleValue];

    //**** regras para teste ******//
    // 1 -
    if ([txtSolo.text isEqualToString:@"Argiloso e Arenoso"]) {
        if (ValorCa < 0.3) {
            // Começa o calculo
            if (ValorArgila < 150){
                LbResultadoFinal.text = @"0,5 (t/ha) de cal.";
                LbLegendaResultado.text = @"É necessário fazer a gessagem.";
                _ValorFinal = @"0,5";
            } else
                if (ValorArgila >= 150 && ValorArgila < 350){
                    LbResultadoFinal.text = @"1,0 (t/ha) de cal.";
                    LbLegendaResultado.text = @"É necessário fazer a gessagem.";
                    _ValorFinal = @"1,0";
                } else
                    if (ValorArgila >= 350 && ValorArgila < 600){
                        LbResultadoFinal.text = @"1,5 (t/ha) de cal.";
                        LbLegendaResultado.text = @"É necessário fazer a gessagem.";
                        _ValorFinal = @"1,5";
                    } else
                        if (ValorArgila >= 600){
                            LbResultadoFinal.text = @"2,0 (t/ha) de cal.";
                            LbLegendaResultado.text = @"É necessário fazer a gessagem.";
                            _ValorFinal = @"2,0";
                        } else {
                            // fala que não é preciso realizar o GESSAGEM!!
                            LbResultadoFinal.text = @"0,0 (t/ha) de cal.";
                            LbLegendaResultado.text = @"Não é necessário fazer a gessagem.";
                            _ValorFinal = @"0,0";
                        }
        } else {
            LbResultadoFinal.text = @"0,0 (t/ha) de cal.";
            LbLegendaResultado.text = @"Não é necessário fazer a gessagem.";
            _ValorFinal = @"0,0";
        }
    }
    
    if ([txtSolo.text isEqualToString:@"Argiloso"]) {
        if (ValorAl > 0.5) {
            if (ValorArgila < 150){
                LbResultadoFinal.text = @"0,5 (t/ha) de cal.";
                LbLegendaResultado.text = @"É necessário fazer a gessagem.";
                _ValorFinal = @"0,5";
            } else
                if (ValorArgila >= 150 && ValorArgila < 350){
                    LbResultadoFinal.text = @"1,0 (t/ha) de cal.";
                    LbLegendaResultado.text = @"É necessário fazer a gessagem.";
                    _ValorFinal = @"1,0";
                } else
                    if (ValorArgila >= 350 && ValorArgila < 600){
                        LbResultadoFinal.text = @"1,5 (t/ha) de cal.";
                        LbLegendaResultado.text = @"É necessário fazer a gessagem.";
                        _ValorFinal = @"1,5";
                    } else
                        if (ValorArgila >= 600){
                            LbResultadoFinal.text = @"2,0 (t/ha) de cal.";
                            LbLegendaResultado.text = @"É necessário fazer a gessagem.";
                            _ValorFinal = @"2,0";
                        } else {
                            // fala que não é preciso realizar o GESSAGEM!!
                            LbResultadoFinal.text = @"0,0 (t/ha) de cal.";
                            LbLegendaResultado.text = @"Não é necessário fazer a gessagem.";
                            _ValorFinal = @"0,0";
                        }
        } else {
            // fala que não é preciso realizar o GESSAGEM!!
            LbResultadoFinal.text = @"0,0 (t/ha) de cal.";
            LbLegendaResultado.text = @"Não é necessário fazer a gessagem.";
            _ValorFinal = @"0,0";
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtElementoCa resignFirstResponder];
    [txtElementoAl resignFirstResponder];
    [txtElementoArgila resignFirstResponder];
    [txtAmostra resignFirstResponder];
    [txtData resignFirstResponder];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [txtElementoCa resignFirstResponder];
    [txtElementoAl resignFirstResponder];
    [txtElementoArgila resignFirstResponder];
    [txtAmostra resignFirstResponder];
    [txtData resignFirstResponder];}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"buscarProprietario"]) {
        BuscarProprietarioTable * destViewController = segue.destinationViewController;
        destViewController.textoProprietario = txtProprietario;
        destViewController.textoPropriedade = txtPropriedade;
    }
}

@end
