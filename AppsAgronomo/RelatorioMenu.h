//
//  RelatorioMenu.h
//  AppsAgronomo
//
//  Created by Fabricio Padua on 12/08/15.
//  Copyright (c) 2015 Fabricio Padua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RelatorioMenu : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIView *ViewApper;

@property (nonatomic, retain) NSMutableArray * listaSelect;


@end
