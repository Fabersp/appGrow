//
//  CalagemNovaTable.h
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 26/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>


@interface ColheitaNovaTable : UIViewController  {
    IBOutlet UITextField * txtProprietario;
    IBOutlet UITextField * txtPropriedade;
    NSString * ValorFinal, * StrDataPrevista;
    NSDate * VarDataPrevista;
    
    __weak IBOutlet UIBarButtonItem *Salvar;
    
    __weak IBOutlet UIButton *btnCalcular;

}

@property (strong) NSManagedObject * colheita;

@property (nonatomic, retain) NSString * strProprietario, * strPropriedade, * ValorFinal, * StrDataPrevista;
@property (nonatomic, retain) NSDate * VarDataPrevista;

@property (nonatomic, retain) NSDateFormatter * DataFormatter;

@property (nonatomic, retain) NSMutableArray * listaSelect;
@property (nonatomic, retain) NSIndexPath *selectedIndexPath;
@property (nonatomic, retain) IBOutlet UITextField *txtProprietario;
@property (nonatomic, retain) IBOutlet UITextField *txtPropriedade;

@property (weak, nonatomic) IBOutlet UITextField *txtLote;
@property (weak, nonatomic) IBOutlet UITextField *txtVariedade;
@property (weak, nonatomic) IBOutlet UITextField *txtDataPlantio;
@property (weak, nonatomic) IBOutlet UITextField *txtDiaAtraso;
@property (weak, nonatomic) IBOutlet UITextField *txtCiclo;
@property (weak, nonatomic) IBOutlet UITextField *txtDataprevista;


+ (NSDate *)addDays:(NSInteger)days toDate:(NSDate *)originalDate;


@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingSpinner;





@end
