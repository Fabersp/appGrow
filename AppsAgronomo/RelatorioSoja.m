//
//  CalagemTable.m
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 26/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import "RelatorioSoja.h"
#import "CalagemNovaTable.h"
#import "CalagemCell.h"

#import <MobileCoreServices/MobileCoreServices.h>
#import <MessageUI/MessageUI.h>
#import <CoreText/CoreText.h>



#define INTERSTITIAL_AD_UNIT_ID @"ca-app-pub-6439752646521747/3360842512"
#define simulador @"377d635157683106a48cd155a9d9bb8a"

#define tamanhoCorpo 10
#define tamanhoCabecalho 12
#define tamanhoTitulo 14
#define tamanhoTituloPrincipal 16

#define fonteNormal @"Helvetica"
#define fonteNegrito @"Helvetica-Bold"

#define linhaSupResultado 240
#define linhaInfrResultado 255

@interface RelatorioSoja () {
    CGSize pageSize;
}

@end

@implementation RelatorioSoja

@synthesize Adubacao;
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
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Adubacao"];
    Adubacao = [[moc executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
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
    return Adubacao.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CalagemCell *cell = (CalagemCell *)[tableView dequeueReusableCellWithIdentifier:@"CalagemCell"];
    
    NSManagedObject * adubacao = [Adubacao objectAtIndex:indexPath.row];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    cell.LbProprietario.text   = [adubacao valueForKey:@"proprietario"];
    cell.Propriedade.text      = [adubacao valueForKey:@"propriedade"];
    cell.DataCalagem.text      = [adubacao valueForKey:@"data"];
    cell.Amostra.text          = [adubacao valueForKey:@"amostra"];
    cell.LegendaResultado.text = [adubacao valueForKey:@"recomendacoes"];
    
    return cell;
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    
    //	[self dismissModalViewControllerAnimated:YES];
    [self becomeFirstResponder];
    [self dismissViewControllerAnimated:NO completion:nil];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSManagedObject * selectedAdubacao = [Adubacao objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
    
    // montar as variaávies
    NSString *strProprietario = [NSString stringWithFormat:@"Proprietário: %@", [selectedAdubacao valueForKey:@"proprietario"]];
    NSString *strPropriedade  = [NSString stringWithFormat:@"Propriedade: %@", [selectedAdubacao valueForKey:@"propriedade"]];
    NSString *strData         = [NSString stringWithFormat:@"Data: %@", [selectedAdubacao valueForKey:@"data"]];
    NSString *strAmostra      = [NSString stringWithFormat:@"Amostra: %@", [selectedAdubacao valueForKey:@"amostra"]];
    
    NSString * Proprietadade = [[selectedAdubacao valueForKey:@"propriedade"] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSString * Amostra       = [[selectedAdubacao valueForKey:@"amostra"] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSString * data          = [[selectedAdubacao valueForKey:@"Data"] stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    NSString * NomeArquivo = [NSString stringWithFormat:@"%@_%@_Amostra_%@.pdf", Proprietadade, data, Amostra];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSString * ValorP  = [NSString stringWithFormat:@"Valor de P: %@",[formatter stringForObjectValue:[selectedAdubacao valueForKey:@"p"]]];
    NSString * ValorK  = [NSString stringWithFormat:@"Valor de K: %@",[formatter stringForObjectValue:[selectedAdubacao valueForKey:@"k"]]];
    
    NSString * formuladoN    = [formatter stringForObjectValue:[selectedAdubacao valueForKey:@"formuladoN"]];
    NSString * formuladoK2O  = [formatter stringForObjectValue:[selectedAdubacao valueForKey:@"formuladoK2O"]];
    NSString * formuladoP2O5 = [formatter stringForObjectValue:[selectedAdubacao valueForKey:@"formuladoP2O5"]];
    
    NSString * MatchFormulado = [NSString stringWithFormat:@"N:%@  P2O5:%@  K2O:%@", formuladoN, formuladoP2O5, formuladoK2O];
    
    NSString * necessidadeN    = [formatter stringForObjectValue:[selectedAdubacao valueForKey:@"necessidadeN"]];
    NSString * necessidadeK2O  = [formatter stringForObjectValue:[selectedAdubacao valueForKey:@"necessidadeK2O"]];
    NSString * necessidadeP2O5 = [formatter stringForObjectValue:[selectedAdubacao valueForKey:@"necessidadeP2O5"]];
    
    NSString * MatchNecessidade = [NSString stringWithFormat:@"N:%@  P2O5:%@  K2O:%@", necessidadeN, necessidadeP2O5, necessidadeK2O];
    
    NSString * concentracaoN    = [formatter stringForObjectValue:[selectedAdubacao valueForKey:@"concentracaoN"]];
    NSString * concentracaoK2O  = [formatter stringForObjectValue:[selectedAdubacao valueForKey:@"concentracaoK2O"]];
    NSString * concentracaoP2O5 = [formatter stringForObjectValue:[selectedAdubacao valueForKey:@"concentracaoP2O5"]];
    
    NSString * MatchConcentracao = [NSString stringWithFormat:@"N:%@  P2O5:%@  K2O:%@", concentracaoN, concentracaoP2O5, concentracaoK2O];
    
    NSString * excessoN    = [formatter stringForObjectValue:[selectedAdubacao valueForKey:@"excessoN"]];
    NSString * excessoK2O  = [formatter stringForObjectValue:[selectedAdubacao valueForKey:@"excessoK2O"]];
    NSString * excessoP2O5 = [formatter stringForObjectValue:[selectedAdubacao valueForKey:@"excessoP2O5"]];
    
    NSString * MatchExcesso = [NSString stringWithFormat:@"N:%@  P2O5:%@  K2O:%@", excessoN, excessoP2O5, excessoK2O];
    
    NSString * recomendacoes = [selectedAdubacao valueForKey:@"recomendacoes"];
    
    NSString * nivelP = [NSString stringWithFormat:@"Nível de P:%@",[selectedAdubacao valueForKey:@"nivelP"]];
    NSString * nivelK = [NSString stringWithFormat:@"Nível de K:%@",[selectedAdubacao valueForKey:@"nivelK"]];
    
    NSString * fileName = [self getPDFFileName:NomeArquivo];
    
    // Create the PDF context using the default page size of 612 x 792.
    UIGraphicsBeginPDFContextToFile(fileName, CGRectZero, nil);
    // Mark the beginning of a new page.
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
    
    [self textoDinamico:@"Relatório Adubação para o plantio da soja" Fn:fonteNegrito Ft:tamanhoTituloPrincipal x:160 y:60];
    
    // Começa a desenhar o cabeçalho //
    [self textoDinamico:strProprietario Fn:fonteNegrito Ft:tamanhoCabecalho x:60 y:100];
    [self textoDinamico:strPropriedade  Fn:fonteNegrito Ft:tamanhoCabecalho x:60 y:120];
    
    [self textoDinamico:strData         Fn:fonteNormal  Ft:tamanhoCabecalho x:60 y:140];
    [self textoDinamico:strAmostra      Fn:fonteNormal  Ft:tamanhoCabecalho x:60 y:160];
    
    [self textoDinamico:ValorP          Fn:fonteNormal  Ft:tamanhoCabecalho x:60 y:180];
    [self textoDinamico:ValorK          Fn:fonteNormal  Ft:tamanhoCabecalho x:60 y:200];
    
    // Linha depois do cabeçalho
    CGPoint PrimeiraFrom = CGPointMake(50, 220);
    CGPoint PrimeiraTo = CGPointMake(560, 220);
    [self Linha:PrimeiraFrom toPoint:PrimeiraTo];
 
    // começo do corpo do relatório //
    [self textoDinamico:@"Resultados" Fn:fonteNegrito  Ft:tamanhoTitulo x:250 y:220];
    
    // Resultados //
    [self textoDinamico:@"Necessidade da soja" Fn:fonteNormal Ft:tamanhoCorpo x:60 y:linhaSupResultado];
    [self textoDinamico:MatchNecessidade       Fn:fonteNegrito Ft:tamanhoCorpo x:60 y:linhaInfrResultado];
    
    [self textoDinamico:@"Formulado" Fn:fonteNormal  Ft:tamanhoCorpo x:185 y:linhaSupResultado];
    [self textoDinamico:[MatchFormulado stringByReplacingOccurrencesOfString:@"." withString:@","] Fn:fonteNegrito  Ft:tamanhoCorpo x:185 y:linhaInfrResultado];
    
    [self textoDinamico:@"Concentração" Fn:fonteNormal  Ft:tamanhoCorpo x:315 y:linhaSupResultado];
    [self textoDinamico:[MatchConcentracao   stringByReplacingOccurrencesOfString:@"." withString:@","] Fn:fonteNegrito  Ft:tamanhoCorpo x:315 y:linhaInfrResultado];
    
    [self textoDinamico:@"Excesso/Sobra" Fn:fonteNormal  Ft:tamanhoCorpo x:440 y:linhaSupResultado];
    [self textoDinamico:[MatchExcesso   stringByReplacingOccurrencesOfString:@"." withString:@","] Fn:fonteNegrito  Ft:tamanhoCorpo x:440 y:linhaInfrResultado]; // 245
    
    [self textoDinamico:nivelP Fn:fonteNegrito  Ft:tamanhoCabecalho x:200 y:275];
    [self textoDinamico:nivelK Fn:fonteNegrito  Ft:tamanhoCabecalho x:300 y:275];
    
    // Linha depois do cabeçalho - 245
    CGPoint SegundaFrom = CGPointMake(50, 295);
    CGPoint SegundaTo = CGPointMake(560, 295);
    [self Linha:SegundaFrom toPoint:SegundaTo];
  
    // começo do corpo do relatório //
    [self textoDinamico:@"Recomendações" Fn:fonteNegrito Ft:tamanhoTitulo x:230 y:300];
    
    [self textoDinamico:recomendacoes Fn:fonteNegrito Ft:tamanhoCabecalho x:60 y:320];
    [self textoDinamico:@"Indicação de adubação com fósforo e potásio para a soja no Estado do Paraná em solos " Fn:fonteNegrito Ft:tamanhoCabecalho x:60 y:335];
    [self textoDinamico:@"com teor de argila maior que 40%" Fn:fonteNegrito Ft:tamanhoCabecalho x:60 y:350];
    
    
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
        [mail setSubject:[NSString stringWithFormat:@"Rel. Adubação do plantio da soja %@ - %@ amostra %@ ", [selectedAdubacao valueForKey:@"propriedade"], [selectedAdubacao valueForKey:@"data"], [selectedAdubacao valueForKey:@"amostra"]]];
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
