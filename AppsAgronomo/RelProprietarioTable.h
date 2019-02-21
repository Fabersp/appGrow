//
//  RelProprietarioTable.h
//  ProgramacaoDaColheita
//
//  Created by Fabricio Aguiar de Padua on 07/11/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>

#import <MessageUI/MessageUI.h>

#import "AppDelegate.h"



@interface RelProprietarioTable : UITableViewController

@property (nonatomic, retain) NSMutableArray * Variedade;


@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingSpinner;

@end
