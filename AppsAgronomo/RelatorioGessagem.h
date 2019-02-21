//
//  CalagemTable.h
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 26/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>




@interface RelatorioGessagem : UITableViewController <MFMailComposeViewControllerDelegate>

@property (nonatomic, retain) NSMutableArray * Gessagem;
@property (strong) NSManagedObjectModel * Agronomo;
@property (nonatomic, retain) NSMutableArray * Agronomos;


@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingSpinner;

@end
