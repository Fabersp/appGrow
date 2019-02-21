//
//  CalagemNovaTable.h
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 26/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

@interface SojaNovaTable : UITableViewController  {
    IBOutlet UITextField * txtProprietario;
    IBOutlet UITextField * txtPropriedade;
    NSString * ValorFinal;
    
    double ValorP2O5Embrapa;
    double ValorK2OEmbrapa;
    double DoubleValorP;
    double DoubleValorK;
    
    __weak IBOutlet UIBarButtonItem *Salvar;
    
    __weak IBOutlet UIButton *btnCalcular;
}

@property (strong) NSManagedObject * adubacao;

@property (nonatomic, retain) NSString * strProprietario, * strPropriedade, * ValorFinal;
@property (weak, nonatomic) IBOutlet UITextField *txtSolo;

@property (nonatomic, retain) NSMutableArray * listaSelect;
@property (nonatomic, retain) NSIndexPath *selectedIndexPath;
@property (nonatomic, retain) IBOutlet UITextField *txtProprietario;
@property (nonatomic, retain) IBOutlet UITextField *txtPropriedade;
@property (weak, nonatomic) IBOutlet UITextField *txtData;
@property (weak, nonatomic) IBOutlet UITextField *txtElementoArgila;
@property (weak, nonatomic) IBOutlet UITextField *txtElementoAl;
@property (weak, nonatomic) IBOutlet UITextField *txtElementoCa;
@property (weak, nonatomic) IBOutlet UITextField *txtAmostra;

@property (weak, nonatomic) IBOutlet UITextField *txtElementoP;
@property (weak, nonatomic) IBOutlet UITextField *txtElementoK;

@property (weak, nonatomic) IBOutlet UITextField *txtFormuladoN;
@property (weak, nonatomic) IBOutlet UITextField *txtFormuladoP2O5;
@property (weak, nonatomic) IBOutlet UITextField *txtFormuladoK2O;

@property (weak, nonatomic) IBOutlet UITextField *txtPadraoEmbrapaN;
@property (weak, nonatomic) IBOutlet UITextField *txtPadraoEmbrapaP2O5;
@property (weak, nonatomic) IBOutlet UITextField *txtPadraoEmbrapaK2O;

@property (weak, nonatomic) IBOutlet UITextField *txtConcentracaoN;
@property (weak, nonatomic) IBOutlet UITextField *txtConcentracaoP2O5;
@property (weak, nonatomic) IBOutlet UITextField *txtConcentracaoK20;

@property (weak, nonatomic) IBOutlet UITextField *txtExcessoN;
@property (weak, nonatomic) IBOutlet UITextField *txtExcessoP2O5;
@property (weak, nonatomic) IBOutlet UITextField *txtExcessoK2O;


@property (weak, nonatomic) IBOutlet UILabel *lbRecomendacoes;
@property (weak, nonatomic) IBOutlet UILabel *lbNivelP;
@property (weak, nonatomic) IBOutlet UILabel *lbNivelK;


@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingSpinner;


@end
