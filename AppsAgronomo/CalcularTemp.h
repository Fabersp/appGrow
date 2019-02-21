//
//  Calcular.h
//  ConversorAgrario
//
//  Created by Fabricio Aguiar de Padua on 02/11/13.
//  Copyright (c) 2013 Pro Master Solution. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalcularTemp : NSObject {
    double *ValorDe;
    double *ValorPara;
    NSMutableArray *ArrayValores;
    int V_De, V_Para, subtracao;
}

@property double *ValorDe;
@property double *ValorPara;
@property NSMutableArray *ArrayValores;
@property int V_De, V_Para, subtracao;


- (NSString *)Calcular_Temperatura:(NSString *)Valor_Temperatura :(NSString *)De_Temperatura :(NSString *)Para_Temperatura;

- (NSMutableArray *)CarregarArray;

//------------ Celsius --------------//
- (NSString *)Celsius_fahreneiht:(double)Valor;
- (NSString *)Celsius_kelvin:(double)Valor;
- (NSString *)Celsius_Rankine:(double)Valor;
- (NSString *)Celsius_Reaumur:(double)Valor;

// ---------- fahreneiht ------------//
- (NSString *)fahreneiht_Celsius:(double)Valor;
- (NSString *)fahreneiht_kelvin:(double)Valor;
- (NSString *)fahreneiht_Rankine:(double)Valor;
- (NSString *)fahreneiht_Reaumur:(double)Valor;

// ---------- kelvin ------------//
- (NSString *)kelvin_fahreneiht:(double)Valor;
- (NSString *)kelvin_Celsius:(double)Valor;
- (NSString *)kelvin_Rankine:(double)Valor;
- (NSString *)kelvin_Reaumur:(double)Valor;

// ---------- Rankine ------------//
- (NSString *)Rankine_fahreneiht:(double)Valor;
- (NSString *)Rankine_Celsius:(double)Valor;
- (NSString *)Rankine_Reaumur:(double)Valor;
- (NSString *)Rankine_Kelvin:(double)Valor;

// ---------- Réaumur ------------//
- (NSString *)Reaumur_fahreneiht:(double)Valor;
- (NSString *)Reaumur_Celsius:(double)Valor;
- (NSString *)Reaumur_Rankine:(double)Valor;
- (NSString *)Reaumur_Kelvin:(double)Valor;





@end
