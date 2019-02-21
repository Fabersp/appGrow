//
//  CalagemTable.m
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 26/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import "RelatorioGessagem.h"
#import "CalagemNovaTable.h"
#import "CalagemCell.h"
#import "PDFRenderer.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <MessageUI/MessageUI.h>
#import "PDFViewController.h"
#import "PDFCalagem.h"
#import <CoreText/CoreText.h>



#import "AppDelegate.h"




#define tamanhoCorpo 10
#define tamanhoCabecalho 12
#define tamanhoTitulo 14
#define tamanhoTituloPrincipal 16

#define fonteNormal @"Helvetica"
#define fonteNegrito @"Helvetica-Bold"

#define linhaSupResultado 230
#define linhaInfrResultado 245

@interface RelatorioGessagem () {
    CGSize pageSize;
}

@end

@implementation RelatorioGessagem

@synthesize Gessagem;
@synthesize Agronomo;  //obj context
@synthesize Agronomos; //arraymutable

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
    
}


#pragma mark GADBannerViewDelegate implementation

// We've received an ad successfully.

- (NSManagedObjectContext *) managedObjectContext
{
    NSManagedObjectContext * context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSManagedObjectContext * moc = [self managedObjectContext];
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Gessagem"];
    Gessagem = [[moc executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return Gessagem.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CalagemCell *cell = (CalagemCell *)[tableView dequeueReusableCellWithIdentifier:@"CalagemCell"];
    
    NSManagedObject * gessagem = [Gessagem objectAtIndex:indexPath.row];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    cell.LbProprietario.text   = [gessagem valueForKey:@"proprietario"];
    cell.Propriedade.text      = [gessagem valueForKey:@"propriedade"];
    cell.DataCalagem.text      = [gessagem valueForKey:@"data"];
    cell.Amostra.text          = [gessagem valueForKey:@"amostra"];
    cell.ResultadoCalagem.text = [NSString stringWithFormat:@"%@ (t/ha).",[formatter stringForObjectValue:[gessagem valueForKey:@"resultado"]]];
    cell.LegendaResultado.text = [gessagem valueForKey:@"legendaResultado"];
    
    NSString * ValorResultado = [gessagem valueForKey:@"resultado"];
    
    double ValorResult = [ValorResultado doubleValue];
    
    if (ValorResult > 0) {
        cell.ResultadoCalagem.textColor = [UIColor redColor];
        cell.LegendaResultado.textColor = [UIColor redColor];
    } else {
        cell.ResultadoCalagem.textColor = [UIColor blackColor];
        cell.LegendaResultado.textColor = [UIColor blackColor];
    }
    return cell;
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    
    //	[self dismissModalViewControllerAnimated:YES];
    [self becomeFirstResponder];
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   
    if ([[segue identifier] isEqualToString:@"RelatorioCalagem"]) {
        NSManagedObject * selectedCar = [Gessagem objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        PDFViewController * destViewController = segue.destinationViewController;
        destViewController.calagem = selectedCar;
        destViewController.title = @"Editar";
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        
    NSManagedObject * selectedCalagem = [Gessagem objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
    
    // montar as variaávies
    NSString *strProprietario = [NSString stringWithFormat:@"Proprietário: %@", [selectedCalagem valueForKey:@"proprietario"]];
    NSString *strPropriedade  = [NSString stringWithFormat:@"Propriedade: %@", [selectedCalagem valueForKey:@"propriedade"]];
    NSString *strData         = [NSString stringWithFormat:@"Data: %@", [selectedCalagem valueForKey:@"data"]];
    NSString *strAmostra      = [NSString stringWithFormat:@"Amostra: %@", [selectedCalagem valueForKey:@"amostra"]];
    NSString *strClasseSolo   = [NSString stringWithFormat:@"Solo: %@", [selectedCalagem valueForKey:@"tipoSolo"]];
    
    NSString * Proprietadade = [[selectedCalagem valueForKey:@"propriedade"] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSString * Amostra       = [[selectedCalagem valueForKey:@"amostra"] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSString * data          = [[selectedCalagem valueForKey:@"Data"] stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    NSString * NomeArquivo = [NSString stringWithFormat:@"%@_%@_Amostra_%@.pdf", Proprietadade, data, Amostra];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSString * ValorArgila    = [formatter stringForObjectValue:[selectedCalagem valueForKey:@"argila"]];
    NSString * ValorCa        = [formatter stringForObjectValue:[selectedCalagem valueForKey:@"calcio"]];
    NSString * ValorAl        = [formatter stringForObjectValue:[selectedCalagem valueForKey:@"aluminio"]];

    NSString * ResultadoFinal = [NSString stringWithFormat:@"%@ (t/ha)", [formatter stringForObjectValue:[selectedCalagem valueForKey:@"resultado"]]];
    
    NSString * LegendaResultado = [selectedCalagem valueForKey:@"legendaResultado"];
    
    NSString * valorResultado = [selectedCalagem valueForKey:@"resultado"];
    
    double NumberResultado = [valorResultado doubleValue];
    
    NSString * fileName = [self getPDFFileName:NomeArquivo];
    
    // Create the PDF context using the default page size of 612 x 792.
    UIGraphicsBeginPDFContextToFile(fileName, CGRectZero, nil);
    // Mark the beginning of a new page.
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
    
    [self textoDinamico:@"Relatório de Gessagem" Fn:fonteNegrito Ft:tamanhoTituloPrincipal x:210 y:60];
    
    // Começa a desenhar o cabeçalho //
    [self textoDinamico:strProprietario Fn:fonteNegrito Ft:tamanhoCabecalho x:60 y:100];
    [self textoDinamico:strPropriedade  Fn:fonteNegrito Ft:tamanhoCabecalho x:60 y:120];
    
    [self textoDinamico:strData         Fn:fonteNormal  Ft:tamanhoCabecalho x:60 y:140];
    [self textoDinamico:strAmostra      Fn:fonteNormal  Ft:tamanhoCabecalho x:60 y:160];
    
    [self textoDinamico:strClasseSolo   Fn:fonteNormal  Ft:tamanhoCabecalho x:60 y:180];
   // [self textoDinamico:strCultivo    Fn:fonteNormal  Ft:tamanhoCabecalho x:60 y:200];

    // Linha depois do cabeçalho
    CGPoint PrimeiraFrom = CGPointMake(50, 200);
    CGPoint PrimeiraTo = CGPointMake(560, 200);
    [self Linha:PrimeiraFrom toPoint:PrimeiraTo];
 
    // começo do corpo do relatório //
    [self textoDinamico:@"Resultados" Fn:fonteNegrito  Ft:tamanhoTitulo x:250 y:205];
    
    // Resultados //
    [self textoDinamico:@"Argila g/kg" Fn:fonteNormal  Ft:tamanhoCorpo x:180 y:linhaSupResultado];
    [self textoDinamico:[ValorArgila stringByReplacingOccurrencesOfString:@"." withString:@","] Fn:fonteNormal  Ft:tamanhoCorpo x:180 y:linhaInfrResultado];
    [self textoDinamico:@"Ca" Fn:fonteNormal  Ft:tamanhoCorpo x:280 y:linhaSupResultado];
    [self textoDinamico:[ValorCa   stringByReplacingOccurrencesOfString:@"." withString:@","] Fn:fonteNormal  Ft:tamanhoCorpo x:280 y:linhaInfrResultado];
    
    [self textoDinamico:@"Al" Fn:fonteNormal  Ft:tamanhoCorpo x:340 y:linhaSupResultado];
    [self textoDinamico:[ValorAl   stringByReplacingOccurrencesOfString:@"." withString:@","] Fn:fonteNormal  Ft:tamanhoCorpo x:340 y:linhaInfrResultado]; // 245
    
    // Resultado final //
    [self textoDinamico:@"NC:" Fn:fonteNegrito Ft:tamanhoCabecalho x:130 y:260];
    [self textoDinamico:ResultadoFinal   Fn:fonteNegrito  Ft:tamanhoCabecalho x:155 y:260];
    
    [self textoDinamico:LegendaResultado Fn:fonteNegrito Ft:tamanhoCabecalho x:230 y:260];
 
    // Linha depois do cabeçalho - 245
    CGPoint SegundaFrom = CGPointMake(50, 280);
    CGPoint SegundaTo = CGPointMake(560, 280);
    [self Linha:SegundaFrom toPoint:SegundaTo];
  
    // começo do corpo do relatório //
    [self textoDinamico:@"Recomendações" Fn:fonteNegrito Ft:tamanhoTitulo x:230 y:285];
    
    if (NumberResultado > 0) {
        [self textoDinamico:@"O uso do gesso agrícola associado com o calcário minimiza o possível desequilíbrio nutricional." Fn:fonteNormal Ft:tamanhoCorpo x:60 y:310];
        [self textoDinamico:@"Em solo arenoso com menos de 150g argila por kg, o risco de alta dosagem pode provocar desequilíbrio nutricional." Fn:fonteNormal Ft:tamanhoCorpo x:60 y:325];
        [self textoDinamico:@"O produto deve estar seco." Fn:fonteNormal Ft:tamanhoCorpo x:60 y:340];
    }
    
    NSManagedObjectContext * moc = [self managedObjectContext];
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Agronomo"];
    Agronomos = [[moc executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
    if ([Agronomos count] == 1){
        Agronomo = [Agronomos objectAtIndex:0];
        [self textoDinamico:[NSString stringWithFormat:@"%@ - CREA:%@", [Agronomo valueForKey:@"nome"], [Agronomo valueForKey:@"crea"]]     Fn:fonteNegrito Ft:tamanhoCorpo x:170 y:700];
    
        [self textoDinamico:[NSString stringWithFormat:@"Telefone:%@ - Celular:%@", [Agronomo valueForKey:@"telefone"], [Agronomo valueForKey:@"celular"]]  Fn:fonteNegrito Ft:tamanhoCorpo x:170 y:720];
        
        [self textoDinamico:[NSString stringWithFormat:@"Email: %@", [Agronomo valueForKey:@"email"]]   Fn:fonteNegrito Ft:tamanhoCorpo x:170 y:740];
        
    }
    // Close the PDF context and write the contents out.
    UIGraphicsEndPDFContext();
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc]init];
        mail.mailComposeDelegate= (id)self;
        
        [[mail navigationBar] setTintColor:[UIColor whiteColor]];
        
        [mail setSubject:[NSString stringWithFormat:@"Relatório de Gessagem %@ - %@ amostra %@ ", [selectedCalagem valueForKey:@"propriedade"], [selectedCalagem valueForKey:@"data"], [selectedCalagem valueForKey:@"amostra"]]];
        [self presentViewController:mail animated:YES completion:nil];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *file = [documentsDirectory stringByAppendingPathComponent:NomeArquivo];
        NSData *data = [NSData dataWithContentsOfFile:file];
        
        /// Set up argument to attach PDF to email.
        [mail addAttachmentData:data mimeType:@"application/pdf" fileName:NomeArquivo];
        [self presentViewController:mail animated:YES completion:^{NSLog (@"Action Completed");}];
        
    }
    else
    {
        NSLog(@"Message cannot be sent");
    }
}

-(NSString*)getPDFFileName:(NSString *)nomeArquivo
{
    NSString* fileName = nomeArquivo;
    
    NSArray *arrayPaths =
    NSSearchPathForDirectoriesInDomains(
                                        NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    NSString *path = [arrayPaths objectAtIndex:0];
    NSString* pdfFileName = [path stringByAppendingPathComponent:fileName];
    
    return pdfFileName;

}
- (void) textoDinamico:(NSString *)Texto Fn:(NSString *)fonteNome Ft:(NSInteger)fonteTamanho x:(NSInteger)valorX y:(NSInteger)valorY{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIFont * font = [UIFont fontWithName:fonteNome size:fonteTamanho];
    CGContextSetFillColorWithColor(context, [[UIColor blackColor]CGColor]);
    CGRect textRect = CGRectMake(valorX, valorY, pageSize.width, pageSize.height);

    [Texto drawInRect:textRect withFont:font lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentCenter];
}







-(void)Linha:(CGPoint)from toPoint:(CGPoint)to
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.2, 0.2, 0.2, 0.3};
    CGColorRef color = CGColorCreate(colorspace, components);
    CGContextSetStrokeColorWithColor(context, color);
    CGContextMoveToPoint(context, from.x, from.y);
    CGContextAddLineToPoint(context, to.x, to.y);
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}

@end
