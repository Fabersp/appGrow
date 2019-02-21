//
//  PDFCalagem.m
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 08/06/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import "PDFCalagem.h"
#import "PDFViewController.h"
//#import "RelatorioCalagemTable.h"

@implementation PDFCalagem

@synthesize lbResponsavel;
@synthesize lbNumeroCrea;
@synthesize lbTelefone;
@synthesize lbCelular;
@synthesize lbEmail;


@synthesize lbProprietario;
@synthesize lbPropriedade;
@synthesize lbEndereco;
@synthesize lbCidade;
@synthesize lbPropTelefone;
@synthesize lbProCelular;

@synthesize lbAmostra;
@synthesize lbSolo;
@synthesize lbCultivo;
@synthesize lbV2SoloeCultivo;

@synthesize lbValorK;

@synthesize lbValorCa;
@synthesize lbValorMg;
@synthesize lbValorHal;
@synthesize lbValorCtc;
@synthesize lbValorV1;
@synthesize lbValorV2;
@synthesize lbValorSB;
@synthesize lbValorPRNT;

@synthesize ValorFinalNC;
@synthesize lbLegendaResultado;
@synthesize calagem;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self CarregarDados];
    
    }
    return self;
}

-(void) CarregarDados{
    
    
    lbProprietario.text = @"texto proprietario";
    
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
