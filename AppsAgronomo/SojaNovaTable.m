//
//  CalagemNovaTable.m
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 26/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import "SojaNovaTable.h"
#import "BuscarProprietarioTable.h"
#import "IQActionSheetPickerView.h"

#define N 0
#define P2O5 60
#define K2O 40




@interface SojaNovaTable () <IQActionSheetPickerViewDelegate>

@end

@implementation SojaNovaTable

@synthesize txtProprietario;
@synthesize txtPropriedade;
@synthesize txtData;
@synthesize listaSelect;
@synthesize txtAmostra;
@synthesize adubacao;
@synthesize ValorFinal = _ValorFinal;
@synthesize txtFormuladoN;
@synthesize txtFormuladoP2O5;
@synthesize txtFormuladoK2O;
@synthesize txtConcentracaoN;
@synthesize txtConcentracaoP2O5;
@synthesize txtConcentracaoK20;
@synthesize txtExcessoN;
@synthesize txtExcessoP2O5;
@synthesize txtExcessoK2O;
@synthesize txtElementoP;
@synthesize txtElementoK;
@synthesize txtPadraoEmbrapaN;
@synthesize txtPadraoEmbrapaP2O5;
@synthesize txtPadraoEmbrapaK2O;
@synthesize lbRecomendacoes;
@synthesize lbNivelK;
@synthesize lbNivelP;


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

    
    if (adubacao){
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        
        [txtProprietario setText:[adubacao valueForKey:@"proprietario"]];
        [txtPropriedade setText:[adubacao valueForKey:@"propriedade"]];
        [txtData setText:[adubacao valueForKey:@"data"]];
        [txtAmostra setText:[adubacao valueForKey:@"amostra"]];
    
        
        NSString * ValorP  = [formatter stringForObjectValue:[adubacao valueForKey:@"p"]];
        NSString * ValorK  = [formatter stringForObjectValue:[adubacao valueForKey:@"k"]];

        [txtElementoP setText:[ValorP stringByReplacingOccurrencesOfString:@"." withString:@","]];
        [txtElementoK setText:[ValorK stringByReplacingOccurrencesOfString:@"." withString:@","]];
    
        
        NSString * formuladoN    = [formatter stringForObjectValue:[adubacao valueForKey:@"formuladoN"]];
        NSString * formuladoK2O  = [formatter stringForObjectValue:[adubacao valueForKey:@"formuladoK2O"]];
        NSString * formuladoP2O5 = [formatter stringForObjectValue:[adubacao valueForKey:@"formuladoP2O5"]];
        
        [txtFormuladoN    setText:[formuladoN    stringByReplacingOccurrencesOfString:@"." withString:@","]];
        [txtFormuladoK2O  setText:[formuladoK2O  stringByReplacingOccurrencesOfString:@"." withString:@","]];
        [txtFormuladoP2O5 setText:[formuladoP2O5 stringByReplacingOccurrencesOfString:@"." withString:@","]];
        
        
        NSString * necessidadeN    = [formatter stringForObjectValue:[adubacao valueForKey:@"necessidadeN"]];
        NSString * necessidadeK2O  = [formatter stringForObjectValue:[adubacao valueForKey:@"necessidadeK2O"]];
        NSString * necessidadeP2O5 = [formatter stringForObjectValue:[adubacao valueForKey:@"necessidadeP2O5"]];
        
        [txtPadraoEmbrapaN    setText:[necessidadeN    stringByReplacingOccurrencesOfString:@"." withString:@","]];
        [txtPadraoEmbrapaK2O  setText:[necessidadeK2O  stringByReplacingOccurrencesOfString:@"." withString:@","]];
        [txtPadraoEmbrapaP2O5 setText:[necessidadeP2O5 stringByReplacingOccurrencesOfString:@"." withString:@","]];
        
        
        NSString * concentracaoN    = [formatter stringForObjectValue:[adubacao valueForKey:@"concentracaoN"]];
        NSString * concentracaoK2O  = [formatter stringForObjectValue:[adubacao valueForKey:@"concentracaoK2O"]];
        NSString * concentracaoP2O5 = [formatter stringForObjectValue:[adubacao valueForKey:@"concentracaoP2O5"]];
        
        [txtConcentracaoN    setText:[concentracaoN    stringByReplacingOccurrencesOfString:@"." withString:@","]];
        [txtConcentracaoK20  setText:[concentracaoK2O  stringByReplacingOccurrencesOfString:@"." withString:@","]];
        [txtConcentracaoP2O5 setText:[concentracaoP2O5 stringByReplacingOccurrencesOfString:@"." withString:@","]];

        
        NSString * excessoN    = [formatter stringForObjectValue:[adubacao valueForKey:@"excessoN"]];
        NSString * excessoK2O  = [formatter stringForObjectValue:[adubacao valueForKey:@"excessoK2O"]];
        NSString * excessoP2O5 = [formatter stringForObjectValue:[adubacao valueForKey:@"excessoP2O5"]];
        
        [txtExcessoN    setText:[excessoN    stringByReplacingOccurrencesOfString:@"." withString:@","]];
        [txtExcessoK2O  setText:[excessoK2O  stringByReplacingOccurrencesOfString:@"." withString:@","]];
        [txtExcessoP2O5 setText:[excessoP2O5 stringByReplacingOccurrencesOfString:@"." withString:@","]];
    
        [lbRecomendacoes setText:[adubacao valueForKey:@"recomendacoes"]];
        
        [lbNivelP setText:[adubacao valueForKey:@"nivelP"]];
        [lbNivelK setText:[adubacao valueForKey:@"nivelK"]];
    }
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
        
        if (adubacao) {
            // update calagem
            NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            
            [adubacao setValue:txtProprietario.text forKey:@"proprietario"];
            [adubacao setValue:txtPropriedade.text forKey:@"propriedade"];
            [adubacao setValue:txtAmostra.text forKey:@"amostra"];
            [adubacao setValue:txtData.text forKey:@"data"];
            
            [adubacao setValue:[f numberFromString:[txtElementoP.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"p"];
            [adubacao setValue:[f numberFromString:[txtElementoK.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"k"];
            
            [adubacao setValue:[f numberFromString:[txtFormuladoN.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"formuladoN"];
            [adubacao setValue:[f numberFromString:[txtFormuladoK2O.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"formuladoK2O"];
            [adubacao setValue:[f numberFromString:[txtFormuladoP2O5.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"formuladoP2O5"];
            
            [adubacao setValue:[f numberFromString:[txtPadraoEmbrapaN.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"necessidadeN"];
            [adubacao setValue:[f numberFromString:[txtPadraoEmbrapaK2O.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"necessidadeK2O"];
            [adubacao setValue:[f numberFromString:[txtPadraoEmbrapaP2O5.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"necessidadeP2O5"];
            
            [adubacao setValue:[f numberFromString:[txtConcentracaoN.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"concentracaoN"];
            [adubacao setValue:[f numberFromString:[txtConcentracaoK20.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"concentracaoK2O"];
            [adubacao setValue:[f numberFromString:[txtConcentracaoP2O5.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"concentracaoP2O5"];
            
            [adubacao setValue:[f numberFromString:[txtExcessoN.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"excessoN"];
            [adubacao setValue:[f numberFromString:[txtExcessoK2O.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"excessoK2O"];
            [adubacao setValue:[f numberFromString:[txtExcessoP2O5.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"excessoP2O5"];
            [adubacao setValue:lbRecomendacoes.text forKey:@"recomendacoes"];
            
            [adubacao setValue:lbNivelP.text forKey:@"nivelP"];
            [adubacao setValue:lbNivelK.text forKey:@"nivelK"];
            
        } else {
            //criar nova calagem
            NSManagedObject * novaAdubacao = [NSEntityDescription insertNewObjectForEntityForName:@"Adubacao" inManagedObjectContext:context];
            
            NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            
            [novaAdubacao setValue:txtProprietario.text forKey:@"proprietario"];
            [novaAdubacao setValue:txtPropriedade.text forKey:@"propriedade"];
            [novaAdubacao setValue:txtAmostra.text forKey:@"amostra"];
            [novaAdubacao setValue:txtData.text forKey:@"data"];
            
            [novaAdubacao setValue:[f numberFromString:[txtElementoP.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"p"];
            [novaAdubacao setValue:[f numberFromString:[txtElementoK.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"k"];
            
            [novaAdubacao setValue:[f numberFromString:[txtFormuladoN.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"formuladoN"];
            [novaAdubacao setValue:[f numberFromString:[txtFormuladoK2O.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"formuladoK2O"];
            [novaAdubacao setValue:[f numberFromString:[txtFormuladoP2O5.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"formuladoP2O5"];
            
            [novaAdubacao setValue:[f numberFromString:[txtPadraoEmbrapaN.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"necessidadeN"];
            [novaAdubacao setValue:[f numberFromString:[txtPadraoEmbrapaK2O.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"necessidadeK2O"];
            [novaAdubacao setValue:[f numberFromString:[txtPadraoEmbrapaP2O5.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"necessidadeP2O5"];
            
            [novaAdubacao setValue:[f numberFromString:[txtConcentracaoN.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"concentracaoN"];
            [novaAdubacao setValue:[f numberFromString:[txtConcentracaoK20.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"concentracaoK2O"];
            [novaAdubacao setValue:[f numberFromString:[txtConcentracaoP2O5.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"concentracaoP2O5"];
            
            [novaAdubacao setValue:[f numberFromString:[txtExcessoN.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"excessoN"];
            [novaAdubacao setValue:[f numberFromString:[txtExcessoK2O.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"excessoK2O"];
            [novaAdubacao setValue:[f numberFromString:[txtExcessoP2O5.text stringByReplacingOccurrencesOfString:@"." withString:@","]] forKey:@"excessoP2O5"];
            
            [novaAdubacao setValue:lbRecomendacoes.text forKey:@"recomendacoes"];
            
            [novaAdubacao setValue:lbNivelP.text forKey:@"nivelP"];
            [novaAdubacao setValue:lbNivelK.text forKey:@"nivelK"];
        
        }
        
        NSError * error = nil;
        if (![context save:&error]) {
            //  NSLog(@"Falha ao salvar!", error, [error localizedDescription]);
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}



- (IBAction)btnCalcular:(id)sender {
    [self Calcular];
}


-(void) TabelaEmbrapa{
    
    float ValorP = [[txtElementoP.text stringByReplacingOccurrencesOfString:@"," withString:@"."] doubleValue];
    float ValorK = [[txtElementoK.text stringByReplacingOccurrencesOfString:@"," withString:@"."] doubleValue];
    
    txtPadraoEmbrapaN.text = @"0";
    
    if (ValorP <3.0) {
        lbNivelP.text = @"Baixo";
        if (ValorK < 0.10) {
            lbNivelK.text = @"Muito baixo";
            txtPadraoEmbrapaP2O5.text = @"100";
            txtPadraoEmbrapaK2O.text  = @"90";
        }
        if (ValorK >=0.10 && ValorK <0.20) {
            lbNivelK.text = @"Baixo";
            txtPadraoEmbrapaP2O5.text = @"100";
            txtPadraoEmbrapaK2O.text  = @"70";
        }
        if (ValorK >=0.20 && ValorK <0.30) {
            lbNivelK.text = @"Médio";
            txtPadraoEmbrapaP2O5.text = @"100";
            txtPadraoEmbrapaK2O.text  = @"50";
        }
        if (ValorK >0.30) {
            lbNivelK.text = @"Alto";
            txtPadraoEmbrapaP2O5.text = @"100";
            txtPadraoEmbrapaK2O.text  = @"40";
        }
    }
    
    if (ValorP >=3.0 && ValorP < 6.0) {
        lbNivelP.text = @"Médio";
        if (ValorK < 0.10) {
            lbNivelK.text = @"Muito baixo";
            txtPadraoEmbrapaP2O5.text = @"80";
            txtPadraoEmbrapaK2O.text  = @"90";
        }
        if (ValorK >=0.10 && ValorK <0.20) {
            lbNivelK.text = @"Baixo";
            txtPadraoEmbrapaP2O5.text = @"80";
            txtPadraoEmbrapaK2O.text  = @"70";
        }
        if (ValorK >=0.20 && ValorK <0.30) {
            lbNivelK.text = @"Médio";
            txtPadraoEmbrapaP2O5.text = @"80";
            txtPadraoEmbrapaK2O.text  = @"50";
        }
        if (ValorK >0.30) {
            lbNivelK.text = @"Alto";
            txtPadraoEmbrapaP2O5.text = @"80";
            txtPadraoEmbrapaK2O.text  = @"40";
        }
    }
    
    if (ValorP >=6.0) {
        lbNivelP.text = @"Alto";
        if (ValorK < 0.10) {
            lbNivelK.text = @"Muito baixo";
            txtPadraoEmbrapaP2O5.text = @"60";
            txtPadraoEmbrapaK2O.text  = @"90";
        }
        if (ValorK >=0.10 && ValorK <0.20) {
            lbNivelK.text = @"Baixo";
            txtPadraoEmbrapaP2O5.text = @"60";
            txtPadraoEmbrapaK2O.text  = @"70";
        }
        if (ValorK >=0.20 && ValorK <0.30) {
            lbNivelK.text = @"Médio";
            txtPadraoEmbrapaP2O5.text = @"60";
            txtPadraoEmbrapaK2O.text  = @"50";
        }
        
        if (ValorK > 0.3) {
        //if (ValorK >0.30) {
            lbNivelK.text = @"Alto";
            txtPadraoEmbrapaP2O5.text = @"60";
            txtPadraoEmbrapaK2O.text  = @"40";
        }
    }
}

- (void) Calcular {
    
    [self TabelaEmbrapa];
    
    NSString * ValorStrN    = [txtFormuladoN.text    stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString * ValorStrP2O5 = [txtFormuladoP2O5.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString * ValorStrK2O  = [txtFormuladoK2O.text  stringByReplacingOccurrencesOfString:@"," withString:@"."];
    
    NSString *UnirFormulado = [NSString stringWithFormat:@"%@ %@ %@", ValorStrN, ValorStrP2O5, ValorStrK2O];
    
    
    float ValorN    = [ValorStrN    doubleValue];
    float ValorP2O5 = [ValorStrP2O5 doubleValue];
    float ValorK2O  = [ValorStrK2O  doubleValue];
    
    ValorP2O5Embrapa     = [txtPadraoEmbrapaP2O5.text doubleValue];
    ValorK2OEmbrapa      = [txtPadraoEmbrapaK2O.text  doubleValue];
    float ValorNEmbrapa = 0;
    
    // começa o calculo //
    // valor de define P2O5 / (P2O5 (formulado) /100) //
    float ValorKg = ValorP2O5Embrapa / (ValorP2O5/100);
    
    lbRecomendacoes.text = [[NSString stringWithFormat:@"%.f kg/ha do formulado =>> %@", ValorKg, UnirFormulado] stringByReplacingOccurrencesOfString:@"." withString:@","];
    
    // valor de N  //
    float ResultadoN    = ValorKg * (ValorN / 100);
    // valor de P2O5  //
    float ResultadoP2O5 = ValorKg * (ValorP2O5 / 100);
    // valor de K2O  //
    float ResultadoK2O  = ValorKg * (ValorK2O / 100);
    // valor do excesso //
    float excessoN    = ResultadoN - ValorNEmbrapa;
    float excessoP2O5 = ResultadoP2O5 - ValorP2O5Embrapa;
    float excessoK2O  = ResultadoK2O - ValorK2OEmbrapa;
    
    // resultado da concentração //
    txtConcentracaoN.text    = [[NSString stringWithFormat:@"%.f", ResultadoN]    stringByReplacingOccurrencesOfString:@"." withString:@","];
    txtConcentracaoP2O5.text = [[NSString stringWithFormat:@"%.f", ResultadoP2O5] stringByReplacingOccurrencesOfString:@"." withString:@","];
    txtConcentracaoK20.text  = [[NSString stringWithFormat:@"%.f", ResultadoK2O]  stringByReplacingOccurrencesOfString:@"." withString:@","];
    
    // resultado do excesso //
    txtExcessoN.text    = [[NSString stringWithFormat:@"%.f", excessoN]    stringByReplacingOccurrencesOfString:@"." withString:@","];
    txtExcessoP2O5.text = [[NSString stringWithFormat:@"%.f", excessoP2O5] stringByReplacingOccurrencesOfString:@"." withString:@","];
    txtExcessoK2O.text  = [[NSString stringWithFormat:@"%.f", excessoK2O]  stringByReplacingOccurrencesOfString:@"." withString:@","];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtAmostra resignFirstResponder];
    [txtData resignFirstResponder];
    [txtElementoP resignFirstResponder];
    [txtElementoK resignFirstResponder];
    [txtFormuladoN resignFirstResponder];;
    [txtFormuladoP2O5 resignFirstResponder];
    [txtFormuladoK2O resignFirstResponder];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [txtAmostra resignFirstResponder];
    [txtData resignFirstResponder];
    [txtElementoP resignFirstResponder];
    [txtElementoK resignFirstResponder];
    [txtFormuladoN resignFirstResponder];;
    [txtFormuladoP2O5 resignFirstResponder];
    [txtFormuladoK2O resignFirstResponder];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"buscarProprietario"]) {
        BuscarProprietarioTable * destViewController = segue.destinationViewController;
        destViewController.textoProprietario = txtProprietario;
        destViewController.textoPropriedade = txtPropriedade;
    }
}

@end
