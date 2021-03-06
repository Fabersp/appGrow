//
//  GessagemTVC.h
//  AppDoAgronomo
//
//  Created by Fabricio Aguiar de Padua on 14/08/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>

#import <MessageUI/MessageUI.h>
#import "AppDelegate.h"






@interface SojaTVC : UITableViewController {
    
    __weak IBOutlet UIBarButtonItem *Add;
    NSString * TitlePurchase;
    NSString * DescriptionPurchase;
    NSString * ValuePurchase;
}

@property (nonatomic, retain) NSMutableArray * Adubacao;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIView *ViewApper;

@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingSpinner;


@property (strong, nonatomic) NSString *productID;
@property (strong, nonatomic) NSString *colunaID;
@property (nonatomic, retain) NSString * TitlePurchase, * DescriptionPurchase, * ValuePurchase;



    





@end
