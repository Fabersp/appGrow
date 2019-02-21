//
//  Calcular.m
//  ConversorAgrario
//
//  Created by Fabricio Aguiar de Padua on 02/11/13.
//  Copyright (c) 2013 Pro Master Solution. All rights reserved.
//

#import "CalcularTemp.h"


@implementation CalcularTemp

@synthesize ValorDe = _ValorDe;
@synthesize ValorPara = _ValorPara;
@synthesize ArrayValores = _ArrayValores;

@synthesize V_De = _V_De;
@synthesize V_Para = _V_Para;
@synthesize subtracao = _subtracao;


- (NSInteger)Calc:(NSInteger)Value1 :(NSInteger) From :(NSString *) To {
    return 10;
}


- (NSString *)Calcular_Temperatura:(NSString *)Valor_Temperatura :(NSString *)De_Temperatura :(NSString *)Para_Temperatura
{
    
    double D_Valor_Temp = [Valor_Temperatura doubleValue];
    
    NSString * Resultado;
    
    if ([De_Temperatura isEqualToString: @" Celsius, ºC"  ]) {
        if ([Para_Temperatura isEqualToString: @" Fahrenheit, ºF"  ]){
            return [self Celsius_fahreneiht:D_Valor_Temp];
        } else
            if ([Para_Temperatura isEqualToString: @" Kelvin, ºK"  ]){
                return [self Celsius_kelvin:D_Valor_Temp];
            } else
                if ([Para_Temperatura isEqualToString: @" Rankine, ºR"  ]){
                    return [self Celsius_Rankine:D_Valor_Temp];
                } else
                    if ([Para_Temperatura isEqualToString: @" Réaumur, ºRé"  ]){
                        return [self Celsius_Reaumur:D_Valor_Temp];
                    } else {
                        return [NSString stringWithFormat:@"%.2f",D_Valor_Temp];
                    }
    }
    if ([De_Temperatura isEqualToString: @" Fahrenheit, ºF"  ]) {
        if ([Para_Temperatura isEqualToString: @" Celsius, ºC"  ]){
            return [self fahreneiht_Celsius:D_Valor_Temp];
        } else
            if ([Para_Temperatura isEqualToString: @" Kelvin, ºK"  ]){
                return [self fahreneiht_kelvin:D_Valor_Temp];
            } else
                if ([Para_Temperatura isEqualToString: @" Rankine, ºR"  ]){
                    return [self fahreneiht_Rankine:D_Valor_Temp];
                } else
                    if ([Para_Temperatura isEqualToString: @" Réaumur, ºRé"  ]){
                        return [self fahreneiht_Reaumur:D_Valor_Temp];
                    } else {
                        return [NSString stringWithFormat:@"%.2f",D_Valor_Temp];
                    }
    }
    
    if ([De_Temperatura isEqualToString: @" Kelvin, ºK"  ]) {
        if ([Para_Temperatura isEqualToString: @" Celsius, ºC"  ]){
            return [self kelvin_Celsius:D_Valor_Temp];
        } else
            if ([Para_Temperatura isEqualToString: @" Fahrenheit, ºF"  ]){
                return [self kelvin_fahreneiht:D_Valor_Temp];
            } else
                if ([Para_Temperatura isEqualToString: @" Rankine, ºR"  ]){
                    return [self kelvin_Rankine:D_Valor_Temp];
                } else
                    if ([Para_Temperatura isEqualToString: @" Réaumur, ºRé"  ]){
                        return [self kelvin_Reaumur:D_Valor_Temp];
                    } else {
                        return [NSString stringWithFormat:@"%.2f",D_Valor_Temp];
                    }
    }
    if ([De_Temperatura isEqualToString: @" Rankine, ºR"  ]) {
        if ([Para_Temperatura isEqualToString: @" Celsius, ºC"  ]){
            return [self Rankine_Celsius:D_Valor_Temp];
        } else
            if ([Para_Temperatura isEqualToString: @" Fahrenheit, ºF"  ]){
                return [self Rankine_fahreneiht:D_Valor_Temp];
            } else
                if ([Para_Temperatura isEqualToString: @" Kelvin, ºK"  ]){
                    return [self Rankine_Kelvin:D_Valor_Temp];
                } else
                    if ([Para_Temperatura isEqualToString: @" Réaumur, ºRé"  ]){
                        return [self Rankine_Reaumur:D_Valor_Temp];
                    } else {
                        return [NSString stringWithFormat:@"%.2f",D_Valor_Temp];
                    }
    }
    
    if ([De_Temperatura isEqualToString: @" Réaumur, ºRé"  ]) {
        if ([Para_Temperatura isEqualToString: @" Celsius, ºC"  ]){
            return [self Reaumur_Celsius:D_Valor_Temp];
        } else
            if ([Para_Temperatura isEqualToString: @" Fahrenheit, ºF"  ]){
                return [self Reaumur_fahreneiht:D_Valor_Temp];
            } else
                if ([Para_Temperatura isEqualToString: @" Rankine, ºR"  ]){
                    return [self Reaumur_Rankine:D_Valor_Temp];
                } else
                    if ([Para_Temperatura isEqualToString: @" Kelvin, ºK"  ]){
                        return [self Reaumur_Kelvin:D_Valor_Temp];
                    } else {
                        return [NSString stringWithFormat:@"%.2f",D_Valor_Temp];
                    }
    }

    return Resultado;
    
}

- (NSMutableArray *)CarregarArray
{
    _ArrayValores = [[NSMutableArray alloc] init];
    [_ArrayValores addObject:@" Celsius, ºC"];
    [_ArrayValores addObject:@" Fahrenheit, ºF"];
    [_ArrayValores addObject:@" Kelvin, ºK"];
    [_ArrayValores addObject:@" Rankine, ºR"];
    [_ArrayValores addObject:@" Réaumur, ºRé"];
    
    return _ArrayValores;
}


//------------ Celsius --------------//
- (NSString *)Celsius_fahreneiht:(double)Valor {
    return [NSString stringWithFormat:@"%.3f",(Valor * 1.8) + 32];
}
- (NSString *)Celsius_kelvin:(double)Valor {
    return [NSString stringWithFormat:@"%.3f",(Valor + 273.15)];
}
- (NSString *)Celsius_Rankine:(double)Valor{
    return [NSString stringWithFormat:@"%.3f", ((Valor * 1.8) + (32 + 459.67))];
}
- (NSString *)Celsius_Reaumur:(double)Valor{
    return [NSString stringWithFormat:@"%.3f", (Valor * 0.8)];
}

// ---------- fahreneiht ------------//
- (NSString *)fahreneiht_Celsius:(double)Valor{
    return [NSString stringWithFormat:@"%.3f",(Valor - 32) / 1.8];
}
- (NSString *)fahreneiht_kelvin:(double)Valor{
    // Conveter de fahreneiht Celsius
    NSString *D_Valor_Celsius = [NSString stringWithFormat:@"%.3f",(Valor - 32) / 1.8];
    
    double D_Valor = [D_Valor_Celsius doubleValue];
    
    // Conveter de Celsius Kelvin
    return [NSString stringWithFormat:@"%.3f",(D_Valor + 273.15)];
}
- (NSString *)fahreneiht_Rankine:(double)Valor{
    return [NSString stringWithFormat:@"%.3f",(Valor + 459.67)];
}
- (NSString *)fahreneiht_Reaumur:(double)Valor{
    //  (°F - 32) / 2.25
    return [NSString stringWithFormat:@"%.3f",((Valor - 32) / 2.25)];
}

// ---------- kelvin ------------//
- (NSString *)kelvin_fahreneiht:(double)Valor{
    // Converter de Kelvin Celsius
    NSString *D_Valor_Celsius = [NSString stringWithFormat:@"%.3f",(Valor - 273.15)];
    double D_Valor = [D_Valor_Celsius doubleValue];
    // converter de Celsius fahreneiht
    return [NSString stringWithFormat:@"%.3f",(D_Valor * 1.8) + 32];
}
- (NSString *)kelvin_Celsius:(double)Valor{
    return [NSString stringWithFormat:@"%.3f",(Valor - 273.15)];
}
- (NSString *)kelvin_Rankine:(double)Valor{
    // °Ra = K × 1.8
    return [NSString stringWithFormat:@"%.3f",(Valor * 1.8)];
}
- (NSString *)kelvin_Reaumur:(double)Valor{
    // °R = (K - 273.15) × 0.8
    return [NSString stringWithFormat:@"%.3f",((Valor -273.15) * 0.8)];
}

// ---------- Rankine ------------//
- (NSString *)Rankine_fahreneiht:(double)Valor{
    //°F = °Ra - 459.67
    return [NSString stringWithFormat:@"%.3f",(Valor - 459.67)];
}
- (NSString *)Rankine_Celsius:(double)Valor{
    //  C = (°Ra - 32 - 459.67) / 1.8
    return [NSString stringWithFormat:@"%.3f",((Valor - 32 - 459.67) / 1.8)];
}
- (NSString *)Rankine_Kelvin:(double)Valor{
    // K = °Ra / 1.8
    return [NSString stringWithFormat:@"%.3f",(Valor / 1.8)];
}
- (NSString *)Rankine_Reaumur:(double)Valor{
    // R = (°Ra - 459.67 - 32) / 2.25
    return [NSString stringWithFormat:@"%.3f",((Valor - 459.67 - 32) / 2.25)];
}

// ---------- Réaumur ------------//
- (NSString *)Reaumur_fahreneiht:(double)Valor{
    // °F = °R × 2.25 + 32
    return [NSString stringWithFormat:@"%.3f",((Valor * 2.25) + 32)];
}
- (NSString *)Reaumur_Celsius:(double)Valor{
    // °C = °R × 1.25
    return [NSString stringWithFormat:@"%.3f",(Valor * 1.25)];
}
- (NSString *)Reaumur_Rankine:(double)Valor{
    // °Ra = °R × 2.25 + 32 + 459.67
    return [NSString stringWithFormat:@"%.3f",((Valor * 2.25) + 32 + 459.67)];
}
- (NSString *)Reaumur_Kelvin:(double)Valor{
    // K = °R × 1.25 + 273.15
    return [NSString stringWithFormat:@"%.3f",((Valor * 1.25) + 273.15)];
}
@end

