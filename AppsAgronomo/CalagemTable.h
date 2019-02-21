//
//  CalagemTable.h
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 26/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>




@interface CalagemTable : UITableViewController  {
    
    __weak IBOutlet UIBarButtonItem *add;
    NSString * TitlePurchase;
    NSString * DescriptionPurchase;
    NSString * ValuePurchase;
}
@property (nonatomic, retain) NSMutableArray * Calagem;


@property (strong, nonatomic) NSString *productID;
@property (strong, nonatomic) NSString *colunaID;
@property (nonatomic, retain) NSString * TitlePurchase, * DescriptionPurchase, * ValuePurchase;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (weak, nonatomic) IBOutlet UIView *ViewApper;


@end
