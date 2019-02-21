//
//  CalagemNovaTable.m
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 26/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import "ColheitaNovaTable.h"
#import "BuscarProprietarioTable.h"
#import "IQActionSheetPickerView.h"



#define N 0
#define P2O5 60
#define K2O 40



IB_DESIGNABLE
@interface ColheitaNovaTable ()<IQActionSheetPickerViewDelegate>

@end

@implementation ColheitaNovaTable

@synthesize txtProprietario;
@synthesize txtPropriedade;

@synthesize listaSelect;

@synthesize colheita;
@synthesize ValorFinal = _ValorFinal;
@synthesize txtLote;
@synthesize txtVariedade;
@synthesize txtDataPlantio;
@synthesize txtDataprevista;
@synthesize txtDiaAtraso;
@synthesize txtCiclo;
@synthesize VarDataPrevista;
@synthesize StrDataPrevista;


@synthesize selectedIndexPath = _selectedIndexPath;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    btnCalcular.layer.cornerRadius = 8.0f;
    btnCalcular.layer.masksToBounds = YES;
    
    if (colheita){
        
        [txtProprietario setText:[colheita valueForKey:@"proprietario"]];
        [txtPropriedade  setText:[colheita valueForKey:@"propriedade"]];
        [txtLote         setText:[colheita valueForKey:@"lote"]];
        [txtVariedade    setText:[colheita valueForKey:@"variedade"]];
        [txtDataPlantio  setText:[colheita valueForKey:@"dataPlantio"]];
        [txtDiaAtraso    setText:[colheita valueForKey:@"diasAtraso"]];
        [txtCiclo        setText:[colheita valueForKey:@"diasCiclo"]];
        [txtDataprevista setText:[colheita valueForKey:@"dataPrevistaStr"]];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)actionSheetPickerView:(IQActionSheetPickerView *)pickerView didSelectDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; // here we create
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];// here set format which you want...
    NSString *convertedString = [dateFormatter stringFromDate:date];
    NSLog(@"Converted String : %@",convertedString);
    txtDataPlantio.text = convertedString;
}



- (IBAction)btnCalendario:(id)sender {
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"" delegate:self];
    [picker setActionSheetPickerStyle:IQActionSheetPickerStyleDatePicker];
    [picker show];

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
        
        if (colheita) {
            // update calagem
            [colheita setValue:txtProprietario.text forKey:@"proprietario"];
            [colheita setValue:txtPropriedade.text  forKey:@"propriedade"];
            [colheita setValue:txtLote.text         forKey:@"lote"];
            [colheita setValue:txtVariedade.text    forKey:@"variedade"];
            [colheita setValue:txtDataPlantio.text  forKey:@"dataPlantio"];
            
            if ([txtDiaAtraso.text isEqualToString:@""]){
                txtDiaAtraso.text = @"0";
            }
            if ([txtCiclo.text isEqualToString:@""]){
                txtCiclo.text = @"0";
            }
            
            [colheita setValue:txtCiclo.text        forKey:@"diasCiclo"];
            [colheita setValue:txtDiaAtraso.text    forKey:@"diasAtraso"];
            
            //Converter String para Data//
            NSString *dateString = txtDataprevista.text;
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            // this is imporant - we set our input date format to match our input string
            // if format doesn't match you'll get nil from your string, so be careful
            [formatter setDateStyle:NSDateFormatterShortStyle];
            NSDate *dateFromString = [NSDate date];
            
            dateFromString = [formatter dateFromString:dateString];
            // Termina a conversao //
            
            NSLog(@"Data data: %@",dateFromString);
            
            [colheita setValue:dateFromString forKey:@"dataPrevista"];
            
            [colheita setValue:txtDataprevista.text forKey:@"dataPrevistaStr"];
            
        } else {
            //criar nova calagem
            NSManagedObject * novaColheita = [NSEntityDescription insertNewObjectForEntityForName:@"Colheita" inManagedObjectContext:context];
            
            [novaColheita setValue:txtProprietario.text forKey:@"proprietario"];
            [novaColheita setValue:txtPropriedade.text  forKey:@"propriedade"];
            [novaColheita setValue:txtLote.text         forKey:@"lote"];
            [novaColheita setValue:txtVariedade.text    forKey:@"variedade"];
            [novaColheita setValue:txtDataPlantio.text  forKey:@"dataPlantio"];
            
            if ([txtDiaAtraso.text isEqualToString:@""]){
                txtDiaAtraso.text = @"0";
            }
            if ([txtCiclo.text isEqualToString:@""]){
                txtCiclo.text = @"0";
            }

            [novaColheita setValue:txtDiaAtraso.text    forKey:@"diasAtraso"];
            [novaColheita setValue:txtCiclo.text        forKey:@"diasCiclo"];
            
            NSString *dateString = txtDataprevista.text;
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            // this is imporant - we set our input date format to match our input string
            // if format doesn't match you'll get nil from your string, so be careful
            [dateFormatter setDateStyle:NSDateFormatterShortStyle];
            NSDate *dateFromString = [[NSDate alloc] init];
            // voila!
            dateFromString = [dateFormatter dateFromString:dateString];
            // Termina a conversao //
            
            [novaColheita setValue:dateFromString forKey:@"dataPrevista"];
            
            [novaColheita setValue:txtDataprevista.text forKey:@"dataPrevistaStr"];
        }
        
        NSError * error = nil;
        if (![context save:&error]) {
            //  NSLog(@"Falha ao salvar!", error, [error localizedDescription]);
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return listaSelect.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *attString = [[NSString alloc] initWithString:[listaSelect objectAtIndex:row]];
    return attString;
    // return [NSString stringWithFormat:@"Row %lu", (long)row];
}

- (IBAction)btnCalcular:(id)sender {
    [self Calcular];
}

- (void) Calcular {
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    
    ///// pega a data em string e coverte para data ////
    NSDate *dataPlantio = [dateFormat dateFromString:txtDataPlantio.text];
    
    NSInteger diasCiclo = [txtCiclo.text integerValue];
    
    if ([txtDiaAtraso.text isEqualToString:@""]){
        txtDiaAtraso.text = @"0";
    }
    // pega os dias de atraso
    NSInteger diasAtraso = [txtDiaAtraso.text integerValue];

    //// soma os dias do ciclo com o atraso ////
    NSInteger diasPlantio = diasCiclo + diasAtraso;
    // seta os dias no componente //
    NSDateComponents *components= [[NSDateComponents alloc] init];
    [components setDay:diasPlantio];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // cria uma nova data para a colheita
    NSDate * dataColheita = [[NSDate alloc]init];
    // paga data do plantio, data inicial //
    dataColheita = [calendar dateByAddingComponents:components toDate:dataPlantio options:0];
    // depois de criada a data gera uma nova string de data
    NSString *convertedString = [dateFormat stringFromDate:dataColheita];

    txtDataprevista.text = convertedString;
    
  //  NSLog(@"Data colheita: %@", convertedString);
    
    
   
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtLote         resignFirstResponder];
    [txtVariedade    resignFirstResponder];
    [txtDataPlantio  resignFirstResponder];
    [txtDataprevista resignFirstResponder];
    [txtVariedade    resignFirstResponder];
    [txtDiaAtraso    resignFirstResponder];
    [txtCiclo        resignFirstResponder];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [txtLote         resignFirstResponder];
    [txtVariedade    resignFirstResponder];
    [txtDataPlantio  resignFirstResponder];
    [txtDataprevista resignFirstResponder];
    [txtVariedade    resignFirstResponder];
    [txtDiaAtraso    resignFirstResponder];
    [txtCiclo        resignFirstResponder];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"buscarProprietario"]) {
        BuscarProprietarioTable * destViewController = segue.destinationViewController;
        destViewController.textoProprietario = txtProprietario;
        destViewController.textoPropriedade = txtPropriedade;
    }
}

@end
