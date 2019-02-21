//
//  ProprietarioTable.h
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 25/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAIntroView.h"


@interface ProprietarioTable : UITableViewController <EAIntroDelegate>

@property (nonatomic, retain) NSMutableArray * proprietario;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (weak, nonatomic) IBOutlet UIView *ViewApper;

@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingSpinner;

@end

