//
//  Calcular.m
//  ConversorAgrario
//
//  Created by Fabricio Aguiar de Padua on 02/11/13.
//  Copyright (c) 2013 Pro Master Solution. All rights reserved.
//

#import "Calcular.h"

#define Acre            4047
#define Are             1000
#define Centiare         100
#define Alqueire_MG    48400
#define Alqueire_SP    24200
#define Alqueirao      96800
#define Alq_Norte      27225
#define Hectare        10000
#define Km2          1000000
#define Linha_MA		3000
#define Tarefa_BA		4400
#define Quadra_132     17400
#define Quadra_220     48400

@implementation Calcular

@synthesize ValorDe = _ValorDe;
@synthesize ValorPara = _ValorPara;
@synthesize ArrayValores = _ArrayValores;


- (NSInteger)Calc:(NSInteger)Value1 :(NSInteger) From :(NSString *) To {
    
    return 10;
}

- (NSString *)Calcular:(NSString *)ValorDe :(NSString *) De :(NSString *) Para {
    
    double D_Valor = [ValorDe doubleValue];
    NSString * Resultado;
    
    if ([De isEqualToString: @"Acre"]) {
        if ([Para isEqualToString: @"Acre"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Acre * D_Valor / Acre)];
        }
        if ([Para isEqualToString: @"Are"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Acre * D_Valor / Are)];
        }
        if ([Para isEqualToString: @"Centiare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Acre * D_Valor / Centiare)];
        }
        if ([Para isEqualToString: @"Alq. MG/GO"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Acre * D_Valor / Alqueire_MG)];
        }
        if ([Para isEqualToString: @"Alqueire SP"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Acre * D_Valor / Alqueire_SP)];
        }
        if ([Para isEqualToString: @"Alqueirão"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Acre * D_Valor / Alqueirao)];
        }
        if ([Para isEqualToString: @"Alq. Norte"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Acre * D_Valor / Alq_Norte)];
        }
        if ([Para isEqualToString: @"Hectare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Acre * D_Valor / Hectare)];
        }
        if ([Para isEqualToString: @"km²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Acre * D_Valor / Km2)];
        }
        if ([Para isEqualToString: @"M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Acre * D_Valor)];
        }
        if ([Para isEqualToString: @"Linha"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Acre * D_Valor / Linha_MA)];
        }
        if ([Para isEqualToString: @"Tarefa BA"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Acre * D_Valor / Tarefa_BA)];
        }
        if ([Para isEqualToString: @"Quadra 132M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Acre * D_Valor / Quadra_132)];
        }
        if ([Para isEqualToString: @"Quadra 220M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Acre * D_Valor / Quadra_220)];
        }
    }
    if ([De isEqualToString: @"Are"]) {
        if ([Para isEqualToString: @"Acre"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Are * D_Valor / Acre)];
        }
        if ([Para isEqualToString: @"Are"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Are * D_Valor / Are)];
        }
        if ([Para isEqualToString: @"Centiare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Are * D_Valor / Centiare)];
        }
        if ([Para isEqualToString: @"Alq. MG/GO"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Are * D_Valor / Alqueire_MG)];
        }
        if ([Para isEqualToString: @"Alqueire SP"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Are * D_Valor / Alqueire_SP)];
        }
        if ([Para isEqualToString: @"Alqueirão"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Are * D_Valor / Alqueirao)];
        }
        if ([Para isEqualToString: @"Alq. Norte"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Are * D_Valor / Alq_Norte)];
        }
        if ([Para isEqualToString: @"Hectare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Are * D_Valor / Hectare)];
        }
        if ([Para isEqualToString: @"km²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Are * D_Valor / Km2)];
        }
        if ([Para isEqualToString: @"M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Are * D_Valor)];
        }
        if ([Para isEqualToString: @"Linha"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Are * D_Valor / Linha_MA)];
        }
        if ([Para isEqualToString: @"Tarefa BA"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Are * D_Valor / Tarefa_BA)];
        }
        if ([Para isEqualToString: @"Quadra 132M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Are * D_Valor / Quadra_132)];
        }
        if ([Para isEqualToString: @"Quadra 220M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Are * D_Valor / Quadra_220)];
        }

    }
    if ([De isEqualToString: @"Centiare"]) {
        if ([Para isEqualToString: @"Acre"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Centiare * D_Valor / Acre)];
        }
        if ([Para isEqualToString: @"Are"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Centiare * D_Valor / Are)];
        }
        if ([Para isEqualToString: @"Centiare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Centiare * D_Valor / Centiare)];
        }
        if ([Para isEqualToString: @"Alq. MG/GO"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Centiare * D_Valor / Alqueire_MG)];
        }
        if ([Para isEqualToString: @"Alqueire SP"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Centiare * D_Valor / Alqueire_SP)];
        }
        if ([Para isEqualToString: @"Alqueirão"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Centiare * D_Valor / Alqueirao)];
        }
        if ([Para isEqualToString: @"Alq. Norte"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Centiare * D_Valor / Alq_Norte)];
        }
        if ([Para isEqualToString: @"Hectare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Centiare * D_Valor / Hectare)];
        }
        if ([Para isEqualToString: @"km²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Centiare * D_Valor / Km2)];
        }
        if ([Para isEqualToString: @"M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Centiare * D_Valor)];
        }
        if ([Para isEqualToString: @"Linha"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Centiare * D_Valor / Linha_MA)];
        }
        if ([Para isEqualToString: @"Tarefa BA"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Centiare * D_Valor / Tarefa_BA)];
        }
        if ([Para isEqualToString: @"Quadra 132M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Centiare * D_Valor / Quadra_132)];
        }
        if ([Para isEqualToString: @"Quadra 220M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Centiare * D_Valor / Quadra_220)];
        }

    }
    if ([De isEqualToString: @"Alq. MG/GO"]) {
        if ([Para isEqualToString: @"Acre"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_MG * D_Valor / Acre)];
        }
        if ([Para isEqualToString: @"Are"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_MG * D_Valor / Are)];
        }
        if ([Para isEqualToString: @"Centiare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_MG * D_Valor / Centiare)];
        }
        if ([Para isEqualToString: @"Alq. MG/GO"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_MG * D_Valor / Alqueire_MG)];
        }
        if ([Para isEqualToString: @"Alqueire SP"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_MG * D_Valor / Alqueire_SP)];
        }
        if ([Para isEqualToString: @"Alqueirão"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_MG * D_Valor / Alqueirao)];
        }
        if ([Para isEqualToString: @"Alq. Norte"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_MG * D_Valor / Alq_Norte)];
        }
        if ([Para isEqualToString: @"Hectare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_MG * D_Valor / Hectare)];
        }
        if ([Para isEqualToString: @"km²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_MG * D_Valor / Km2)];
        }
        if ([Para isEqualToString: @"M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_MG * D_Valor)];
        }
        if ([Para isEqualToString: @"Linha"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_MG * D_Valor / Linha_MA)];
        }
        if ([Para isEqualToString: @"Tarefa BA"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_MG * D_Valor / Tarefa_BA)];
        }
        if ([Para isEqualToString: @"Quadra 132M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_MG * D_Valor / Quadra_132)];
        }
        if ([Para isEqualToString: @"Quadra 220M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_MG * D_Valor / Quadra_220)];
        }

    }
    if ([De isEqualToString: @"Alqueire SP"]) {
        if ([Para isEqualToString: @"Acre"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_SP * D_Valor / Acre)];
        }
        if ([Para isEqualToString: @"Are"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_SP * D_Valor / Are)];
        }
        if ([Para isEqualToString: @"Centiare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_SP * D_Valor / Centiare)];
        }
        if ([Para isEqualToString: @"Alq. MG/GO"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_SP * D_Valor / Alqueire_MG)];
        }
        if ([Para isEqualToString: @"Alqueire SP"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_SP * D_Valor / Alqueire_SP)];
        }
        if ([Para isEqualToString: @"Alqueirão"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_SP * D_Valor / Alqueirao)];
        }
        if ([Para isEqualToString: @"Alq. Norte"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_SP * D_Valor / Alq_Norte)];
        }
        if ([Para isEqualToString: @"Hectare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_SP * D_Valor / Hectare)];
        }
        if ([Para isEqualToString: @"km²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_SP * D_Valor / Km2)];
        }
        if ([Para isEqualToString: @"M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_SP * D_Valor)];
        }
        if ([Para isEqualToString: @"Linha"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_SP * D_Valor / Linha_MA)];
        }
        if ([Para isEqualToString: @"Tarefa BA"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_SP * D_Valor / Tarefa_BA)];
        }
        if ([Para isEqualToString: @"Quadra 132M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_SP * D_Valor / Quadra_132)];
        }
        if ([Para isEqualToString: @"Quadra 220M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueire_SP * D_Valor / Quadra_220)];
        }

    }
    if ([De isEqualToString: @"Alqueirão"]) {
        if ([Para isEqualToString: @"Acre"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueirao * D_Valor / Acre)];
        }
        if ([Para isEqualToString: @"Are"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueirao * D_Valor / Are)];
        }
        if ([Para isEqualToString: @"Centiare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueirao * D_Valor / Centiare)];
        }
        if ([Para isEqualToString: @"Alq. MG/GO"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueirao * D_Valor / Alqueire_MG)];
        }
        if ([Para isEqualToString: @"Alqueire SP"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueirao * D_Valor / Alqueire_SP)];
        }
        if ([Para isEqualToString: @"Alqueirão"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueirao * D_Valor / Alqueirao)];
        }
        if ([Para isEqualToString: @"Alq. Norte"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueirao * D_Valor / Alq_Norte)];
        }
        if ([Para isEqualToString: @"Hectare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueirao * D_Valor / Hectare)];
        }
        if ([Para isEqualToString: @"km²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueirao * D_Valor / Km2)];
        }
        if ([Para isEqualToString: @"M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueirao * D_Valor)];
        }
        if ([Para isEqualToString: @"Linha"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueirao * D_Valor / Linha_MA)];
        }
        if ([Para isEqualToString: @"Tarefa BA"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueirao * D_Valor / Tarefa_BA)];
        }
        if ([Para isEqualToString: @"Quadra 132M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueirao * D_Valor / Quadra_132)];
        }
        if ([Para isEqualToString: @"Quadra 220M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alqueirao * D_Valor / Quadra_220)];
        }

    }
    if ([De isEqualToString: @"Alq. Norte"]) {
        if ([Para isEqualToString: @"Acre"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alq_Norte * D_Valor / Acre)];
        }
        if ([Para isEqualToString: @"Are"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alq_Norte * D_Valor / Are)];
        }
        if ([Para isEqualToString: @"Centiare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alq_Norte * D_Valor / Centiare)];
        }
        if ([Para isEqualToString: @"Alq. MG/GO"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alq_Norte * D_Valor / Alqueire_MG)];
        }
        if ([Para isEqualToString: @"Alqueire SP"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alq_Norte * D_Valor / Alqueire_SP)];
        }
        if ([Para isEqualToString: @"Alqueirão"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alq_Norte * D_Valor / Alqueirao)];
        }
        if ([Para isEqualToString: @"Alq. Norte"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alq_Norte * D_Valor / Alq_Norte)];
        }
        if ([Para isEqualToString: @"Hectare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alq_Norte * D_Valor / Hectare)];
        }
        if ([Para isEqualToString: @"km²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alq_Norte * D_Valor / Km2)];
        }
        if ([Para isEqualToString: @"M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alq_Norte * D_Valor)];
        }
        if ([Para isEqualToString: @"Linha"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alq_Norte * D_Valor / Linha_MA)];
        }
        if ([Para isEqualToString: @"Tarefa BA"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alq_Norte * D_Valor / Tarefa_BA)];
        }
        if ([Para isEqualToString: @"Quadra 132M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alq_Norte * D_Valor / Quadra_132)];
        }
        if ([Para isEqualToString: @"Quadra 220M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Alq_Norte * D_Valor / Quadra_220)];
        }

    }
    if ([De isEqualToString: @"Hectare"]) {
        if ([Para isEqualToString: @"Acre"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Hectare * D_Valor / Acre)];
        }
        if ([Para isEqualToString: @"Are"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Hectare * D_Valor / Are)];
        }
        if ([Para isEqualToString: @"Centiare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Hectare * D_Valor / Centiare)];
        }
        if ([Para isEqualToString: @"Alq. MG/GO"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Hectare * D_Valor / Alqueire_MG)];
        }
        if ([Para isEqualToString: @"Alqueire SP"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Hectare * D_Valor / Alqueire_SP)];
        }
        if ([Para isEqualToString: @"Alqueirão"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Hectare * D_Valor / Alqueirao)];
        }
        if ([Para isEqualToString: @"Alq. Norte"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Hectare * D_Valor / Alq_Norte)];
        }
        if ([Para isEqualToString: @"Hectare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Hectare * D_Valor / Hectare)];
        }
        if ([Para isEqualToString: @"km²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Hectare * D_Valor / Km2)];
        }
        if ([Para isEqualToString: @"M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Hectare * D_Valor)];
        }
        if ([Para isEqualToString: @"Linha"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Hectare * D_Valor / Linha_MA)];
        }
        if ([Para isEqualToString: @"Tarefa BA"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Hectare * D_Valor / Tarefa_BA)];
        }
        if ([Para isEqualToString: @"Quadra 132M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Hectare * D_Valor / Quadra_132)];
        }
        if ([Para isEqualToString: @"Quadra 220M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Hectare * D_Valor / Quadra_220)];
        }

    }
    if ([De isEqualToString: @"km²"]) {
        if ([Para isEqualToString: @"Acre"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Km2 * D_Valor / Acre)];
        }
        if ([Para isEqualToString: @"Are"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Km2 * D_Valor / Are)];
        }
        if ([Para isEqualToString: @"Centiare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Km2 * D_Valor / Centiare)];
        }
        if ([Para isEqualToString: @"Alq. MG/GO"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Km2 * D_Valor / Alqueire_MG)];
        }
        if ([Para isEqualToString: @"Alqueire SP"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Km2 * D_Valor / Alqueire_SP)];
        }
        if ([Para isEqualToString: @"Alqueirão"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Km2 * D_Valor / Alqueirao)];
        }
        if ([Para isEqualToString: @"Alq. Norte"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Km2 * D_Valor / Alq_Norte)];
        }
        if ([Para isEqualToString: @"Hectare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Km2 * D_Valor / Hectare)];
        }
        if ([Para isEqualToString: @"km²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Km2 * D_Valor / Km2)];
        }
        if ([Para isEqualToString: @"M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Km2 * D_Valor)];
        }
        if ([Para isEqualToString: @"Linha"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Km2 * D_Valor / Linha_MA)];
        }
        if ([Para isEqualToString: @"Tarefa BA"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Km2 * D_Valor / Tarefa_BA)];
        }
        if ([Para isEqualToString: @"Quadra 132M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Km2 * D_Valor / Quadra_132)];
        }
        if ([Para isEqualToString: @"Quadra 220M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Km2 * D_Valor / Quadra_220)];
        }
    }
    
    if ([De isEqualToString: @"Linha"]) {
        if ([Para isEqualToString: @"Acre"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Linha_MA * D_Valor / Acre)];
        }
        if ([Para isEqualToString: @"Are"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Linha_MA * D_Valor / Are)];
        }
        if ([Para isEqualToString: @"Centiare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Linha_MA * D_Valor / Centiare)];
        }
        if ([Para isEqualToString: @"Alq. MG/GO"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Linha_MA * D_Valor / Alqueire_MG)];
        }
        if ([Para isEqualToString: @"Alqueire SP"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Linha_MA * D_Valor / Alqueire_SP)];
        }
        if ([Para isEqualToString: @"Alqueirão"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Linha_MA * D_Valor / Alqueirao)];
        }
        if ([Para isEqualToString: @"Alq. Norte"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Linha_MA * D_Valor / Alq_Norte)];
        }
        if ([Para isEqualToString: @"Hectare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Linha_MA * D_Valor / Hectare)];
        }
        if ([Para isEqualToString: @"km²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Linha_MA * D_Valor / Km2)];
        }
        if ([Para isEqualToString: @"M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Linha_MA * D_Valor)];
        }
        if ([Para isEqualToString: @"Linha"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Linha_MA * D_Valor / Linha_MA)];
        }
        if ([Para isEqualToString: @"Tarefa BA"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Linha_MA * D_Valor / Tarefa_BA)];
        }
        if ([Para isEqualToString: @"Quadra 132M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Linha_MA * D_Valor / Quadra_132)];
        }
        if ([Para isEqualToString: @"Quadra 220M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Linha_MA * D_Valor / Quadra_220)];
        }
    }
    if ([De isEqualToString: @"Tarefa BA"]) {
        if ([Para isEqualToString: @"Acre"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Tarefa_BA * D_Valor / Acre)];
        }
        if ([Para isEqualToString: @"Are"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Tarefa_BA * D_Valor / Are)];
        }
        if ([Para isEqualToString: @"Centiare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Tarefa_BA * D_Valor / Centiare)];
        }
        if ([Para isEqualToString: @"Alq. MG/GO"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Tarefa_BA * D_Valor / Alqueire_MG)];
        }
        if ([Para isEqualToString: @"Alqueire SP"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Tarefa_BA * D_Valor / Alqueire_SP)];
        }
        if ([Para isEqualToString: @"Alqueirão"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Tarefa_BA * D_Valor / Alqueirao)];
        }
        if ([Para isEqualToString: @"Alq. Norte"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Tarefa_BA * D_Valor / Alq_Norte)];
        }
        if ([Para isEqualToString: @"Hectare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Tarefa_BA * D_Valor / Hectare)];
        }
        if ([Para isEqualToString: @"km²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Tarefa_BA * D_Valor / Km2)];
        }
        if ([Para isEqualToString: @"M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Tarefa_BA * D_Valor)];
        }
        if ([Para isEqualToString: @"Linha"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Tarefa_BA * D_Valor / Linha_MA)];
        }
        if ([Para isEqualToString: @"Tarefa BA"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Tarefa_BA * D_Valor / Tarefa_BA)];
        }
        if ([Para isEqualToString: @"Quadra 132M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Tarefa_BA * D_Valor / Quadra_132)];
        }
        if ([Para isEqualToString: @"Quadra 220M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Tarefa_BA * D_Valor / Quadra_220)];
        }
    }
    if ([De isEqualToString: @"Quadra 132M²"]) {
        if ([Para isEqualToString: @"Acre"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_132 * D_Valor / Acre)];
        }
        if ([Para isEqualToString: @"Are"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_132 * D_Valor / Are)];
        }
        if ([Para isEqualToString: @"Centiare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_132 * D_Valor / Centiare)];
        }
        if ([Para isEqualToString: @"Alq. MG/GO"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_132 * D_Valor / Alqueire_MG)];
        }
        if ([Para isEqualToString: @"Alqueire SP"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_132 * D_Valor / Alqueire_SP)];
        }
        if ([Para isEqualToString: @"Alqueirão"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_132 * D_Valor / Alqueirao)];
        }
        if ([Para isEqualToString: @"Alq. Norte"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_132 * D_Valor / Alq_Norte)];
        }
        if ([Para isEqualToString: @"Hectare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_132 * D_Valor / Hectare)];
        }
        if ([Para isEqualToString: @"km²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_132 * D_Valor / Km2)];
        }
        if ([Para isEqualToString: @"M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_132 * D_Valor)];
        }
        if ([Para isEqualToString: @"Linha"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_132 * D_Valor / Linha_MA)];
        }
        if ([Para isEqualToString: @"Tarefa BA"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_132 * D_Valor / Tarefa_BA)];
        }
        if ([Para isEqualToString: @"Quadra 132M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_132 * D_Valor / Quadra_132)];
        }
        if ([Para isEqualToString: @"Quadra 220M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_132 * D_Valor / Quadra_220)];
        }
    }
    if ([De isEqualToString: @"Quadra 220M²"]) {
        if ([Para isEqualToString: @"Acre"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_220 * D_Valor / Acre)];
        }
        if ([Para isEqualToString: @"Are"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_220 * D_Valor / Are)];
        }
        if ([Para isEqualToString: @"Centiare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_220 * D_Valor / Centiare)];
        }
        if ([Para isEqualToString: @"Alq. MG/GO"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_220 * D_Valor / Alqueire_MG)];
        }
        if ([Para isEqualToString: @"Alqueire SP"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_220 * D_Valor / Alqueire_SP)];
        }
        if ([Para isEqualToString: @"Alqueirão"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_220 * D_Valor / Alqueirao)];
        }
        if ([Para isEqualToString: @"Alq. Norte"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_220 * D_Valor / Alq_Norte)];
        }
        if ([Para isEqualToString: @"Hectare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_220 * D_Valor / Hectare)];
        }
        if ([Para isEqualToString: @"km²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_220 * D_Valor / Km2)];
        }
        if ([Para isEqualToString: @"M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_220 * D_Valor)];
        }
        if ([Para isEqualToString: @"Linha"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_220 * D_Valor / Linha_MA)];
        }
        if ([Para isEqualToString: @"Tarefa BA"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_220 * D_Valor / Tarefa_BA)];
        }
        if ([Para isEqualToString: @"Quadra 132M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_220 * D_Valor / Quadra_132)];
        }
        if ([Para isEqualToString: @"Quadra 220M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(Quadra_220 * D_Valor / Quadra_220)];
        }
    }

    
    
    
    if ([De isEqualToString: @"M²"]) {
        if ([Para isEqualToString: @"Acre"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(D_Valor / Acre)];
        }
        if ([Para isEqualToString: @"Are"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(D_Valor / Are)];
        }
        if ([Para isEqualToString: @"Centiare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(D_Valor / Centiare)];
        }
        if ([Para isEqualToString: @"Alq. MG/GO"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(D_Valor / Alqueire_MG)];
        }
        if ([Para isEqualToString: @"Alqueire SP"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(D_Valor / Alqueire_SP)];
        }
        if ([Para isEqualToString: @"Alqueirão"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(D_Valor / Alqueirao)];
        }
        if ([Para isEqualToString: @"Alq. Norte"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(D_Valor / Alq_Norte)];
        }
        if ([Para isEqualToString: @"Hectare"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(D_Valor / Hectare)];
        }
        if ([Para isEqualToString: @"km²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(D_Valor / Km2)];
        }
        if ([Para isEqualToString: @"M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(D_Valor)];
        }
        if ([Para isEqualToString: @"Linha"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(D_Valor / Linha_MA)];
        }
        if ([Para isEqualToString: @"Tarefa BA"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(D_Valor / Tarefa_BA)];
        }
        if ([Para isEqualToString: @"Quadra 132M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(D_Valor / Quadra_132)];
        }
        if ([Para isEqualToString: @"Quadra 220M²"]) {
            Resultado = [NSString stringWithFormat:@"%.3f",(D_Valor / Quadra_220)];
        }
    }

    return Resultado;
  
}

- (NSMutableArray *)CarregarArray{
    
    _ArrayValores = [[NSMutableArray alloc] init];
    [_ArrayValores addObject:@"Acre"];
    [_ArrayValores addObject:@"Are"];
    [_ArrayValores addObject:@"Centiare"];
    [_ArrayValores addObject:@"Alq. MG/GO"];
    [_ArrayValores addObject:@"Alqueire SP"];
    [_ArrayValores addObject:@"Alqueirão"];
    [_ArrayValores addObject:@"Alq. Norte"];
    [_ArrayValores addObject:@"Hectare"];
    [_ArrayValores addObject:@"Linha"];
    [_ArrayValores addObject:@"Tarefa BA"];
    [_ArrayValores addObject:@"Quadra 132M²"];
    [_ArrayValores addObject:@"Quadra 220M²"];
    [_ArrayValores addObject:@"M²"];
    [_ArrayValores addObject:@"km²"];

    return _ArrayValores;
}

@end
