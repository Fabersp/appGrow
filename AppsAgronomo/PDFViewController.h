//
//  PDFViewController.h
//  PDFCreate
//
//  Created by Fabricio Aguiar de Padua on 06/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "AppDelegate.h"

@interface PDFViewController : UIViewController{
    
    NSString * strProprietario;
    NSDictionary * DicionarioCalagem;
}

@property (strong) NSManagedObject * calagem;
@property (strong) NSDictionary * DicionarioCalagem;

-(void)showPDFFile;

-(void) CarregarDados;

-(NSString *)getPDFFileName;

@property (nonatomic, retain) NSString * strProprietario;

@property (weak, nonatomic) IBOutlet UILabel *lbProprietario;
@property (weak, nonatomic) IBOutlet UILabel *lbPropriedade;
@property (weak, nonatomic) IBOutlet UILabel *lbEndereco;
@property (weak, nonatomic) IBOutlet UILabel *lbCidade;
@property (weak, nonatomic) IBOutlet UILabel *lbPropTelefone;
@property (weak, nonatomic) IBOutlet UILabel *lbProCelular;




@end
