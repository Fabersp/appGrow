//
//  PDFViewController.m
//  PDFCreate
//
//  Created by Fabricio Aguiar de Padua on 06/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import "PDFViewController.h"
#import "PDFRenderer.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <MessageUI/MessageUI.h>
#import "PDFCalagem.h"

@interface PDFViewController ()

@end

@implementation PDFViewController

@synthesize strProprietario;



@synthesize calagem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) CarregarDados {
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *keys = [[[calagem entity] attributesByName] allKeys];
    DicionarioCalagem = [calagem dictionaryWithValuesForKeys:keys];
    
    [calagem setValuesForKeysWithDictionary:DicionarioCalagem];

    PDFRenderer * pdfRend = [[PDFRenderer alloc]init];
  //  [pdfRend CarregarDados:@"sststs"];
    
  
//   pdfcalagem.lbPropriedade.text      = [calagem valueForKey:@"propriedade"];
//   pdfcalagem.lbSolo.text             = [calagem valueForKey:@"solo"];
//    pdfcalagem.lbCultivo.text          = [calagem valueForKey:@"cultivo"];
//    [pdfcalagem.lb setText:[calagem valueForKey:@"data"]];
//    pdfcalagem.lbAmostra.text          = [calagem valueForKey:@"amostra"];
//    pdfcalagem.lbLegendaResultado.text = [calagem valueForKey:@"legendaResultado"];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSString * ValorV2     = [formatter stringForObjectValue:[calagem valueForKey:@"v2"]];
    NSString * ValorPrnt   = [formatter stringForObjectValue:[calagem valueForKey:@"prnt"]];
    NSString * ValorK      = [formatter stringForObjectValue:[calagem valueForKey:@"k"]];
    NSString * ValorCa     = [formatter stringForObjectValue:[calagem valueForKey:@"ca"]];
    NSString * ValorHAL    = [formatter stringForObjectValue:[calagem valueForKey:@"hal"]];
    NSString * ValorMg     = [formatter stringForObjectValue:[calagem valueForKey:@"mg"]];
    NSString * ValorSB     = [formatter stringForObjectValue:[calagem valueForKey:@"sb"]];
    NSString * ValorCTB    = [formatter stringForObjectValue:[calagem valueForKey:@"ctcph"]];
    NSString * ValorV1     = [formatter stringForObjectValue:[calagem valueForKey:@"v1"]];
    NSString * ResultadoFinal = [formatter stringForObjectValue:[calagem valueForKey:@"resultado"]];
    
 /*   [LbResultadoV2    setText:[ValorV2   stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [txtPrnt          setText:[ValorPrnt stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [txtElementok     setText:[ValorK    stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [txtElementoCa    setText:[ValorCa   stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [txtElementoHAL   setText:[ValorHAL  stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [txtElementoMg    setText:[ValorMg   stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [txtResultadoSB   setText:[ValorSB   stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [txtResultadoCTC  setText:[ValorCTB  stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [txtResultadoV1   setText:[ValorV1   stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [LbResultadoFinal setText:[NSString  stringWithFormat:@"%@ (t/ha)", [ResultadoFinal stringByReplacingOccurrencesOfString:@"." withString:@","]]];
*/
    NSString* fileName = [self getPDFFileName];

    [PDFRenderer drawPDF:fileName];
    [self showPDFFile];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


-(NSString*)getPDFFileName
{
    NSString* fileName = @"Calagem.pdf";
    
    NSArray *arrayPaths =
    NSSearchPathForDirectoriesInDomains(
                                        NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    NSString *path = [arrayPaths objectAtIndex:0];
    NSString* pdfFileName = [path stringByAppendingPathComponent:fileName];
    
    return pdfFileName;
}

-(void)showPDFFile
{
    NSString* fileName = @"Calagem.pdf";
    
    NSArray *arrayPaths =
    NSSearchPathForDirectoriesInDomains(
                                        NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    NSString *path = [arrayPaths objectAtIndex:0];
    NSString* pdfFileName = [path stringByAppendingPathComponent:fileName];
    
    UIWebView* webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 960)];
    
    NSURL *url = [NSURL fileURLWithPath:pdfFileName];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView setScalesPageToFit:YES];
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
}

-(IBAction)btnEnviarEmail:(id)sender{
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc]init];
        mail.mailComposeDelegate= (id)self;
        [mail setSubject:@"PDF File"];
        
        ///1 Set up the proper arguments to obtain the generated file in the previous saved file directory.
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *file = [documentsDirectory stringByAppendingPathComponent:@"Calagem.pdf"];
        NSData *data = [NSData dataWithContentsOfFile:file];
        
        [PDFRenderer drawPDF:file];
        
        /// Set up argument to attach PDF to email.
        [mail addAttachmentData:data mimeType:@"application/pdf" fileName:@"Calagem.pdf"];
        [self presentViewController:mail animated:YES completion:^{NSLog (@"Action Completed");}];
        
    }
    else
    {
        NSLog(@"Message cannot be sent");
    }
    
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    [self dismissViewControllerAnimated:YES completion:^{NSLog(@"MAIL FINISHED"); }];
}




@end
