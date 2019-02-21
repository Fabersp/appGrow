//
//  Calcular.h
//  ConversorAgrario
//
//  Created by Fabricio Aguiar de Padua on 02/11/13.
//  Copyright (c) 2013 Pro Master Solution. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface Calcular : NSObject {
    double *ValorDe;
    double *ValorPara;
    NSMutableArray *ArrayValores;
}

@property double *ValorDe;
@property double *ValorPara;
@property NSMutableArray *ArrayValores;


- (NSString *)Calcular:(NSString *)ValorDe :(NSString *) De :(NSString *) Para;

- (NSMutableArray *)CarregarArray;


@end
