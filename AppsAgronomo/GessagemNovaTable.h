//
//  CalagemNovaTable.h
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 26/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "RMDateSelectionViewController.h"

#import "AppDelegate.h"

@interface GessagemNovaTable : UITableViewController  {
    IBOutlet UITextField * txtProprietario;
    IBOutlet UITextField * txtPropriedade;
    NSString * ValorFinal;
    __weak IBOutlet UIBarButtonItem *Salvar;
    
    __weak IBOutlet UIButton *btnCalcular;
    
}

@property (strong) NSManagedObject * gessagem;

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
@property (weak, nonatomic) IBOutlet UILabel *LbResultadoFinal;

@property (weak, nonatomic) IBOutlet UILabel *LbLegendaResultado;


@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingSpinner;




@end
