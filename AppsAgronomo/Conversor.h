//
//  ViewController.h
//  ConversorAgrario
//
//  Created by Fabricio Aguiar de Padua on 30/10/13.
//  Copyright (c) 2013 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calcular.h"



#define De 0
#define Para 1


@interface Conversor : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate> {

IBOutlet UIPickerView *PickerConversor;
    
    NSMutableArray *ArrayDe;
    NSMutableArray *ArrayPara;
    NSString * ItemDe;
    NSString * ItemPara;
    NSString * TitlePurchase;
    NSString * DescriptionPurchase;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (weak, nonatomic) IBOutlet UIView *ViewApper;

@property (weak, nonatomic) IBOutlet UITextField *LabelDE;
@property (weak, nonatomic) IBOutlet UITextField *LabelPara;

@property (weak, nonatomic) NSString *ItemDe;
@property (weak, nonatomic) NSString *ItemPara;


@property (strong, nonatomic) NSString *productID;
@property (strong, nonatomic) NSString *colunaID;
@property (nonatomic, retain) NSString * TitlePurchase, * DescriptionPurchase;


@end
