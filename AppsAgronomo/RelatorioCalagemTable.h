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
#import "AppDelegate.h"





@interface RelatorioCalagemTable : UITableViewController <MFMailComposeViewControllerDelegate>

@property (nonatomic, retain) NSMutableArray * Calagem;
@property (strong) NSManagedObject * Agronomo;
@property (nonatomic, retain) NSMutableArray * Agronomos;


- (IBAction)EnviarMailCalgem:(id)sender;


@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingSpinner;



@end
