//
//  RelatorioMenu.m
//  AppsAgronomo
//
//  Created by Fabricio Padua on 12/08/15.
//  Copyright (c) 2015 Fabricio Padua. All rights reserved.
//

#import "RelatorioMenu.h"
#import "SWRevealViewController.h"
#import "CalagemTable.h"
#import "GessagemTVC.h"
#import "SojaTVC.h"
#import "ColheitaTVC.h"

@interface RelatorioMenu ()

@end

@implementation RelatorioMenu

@synthesize ViewApper;
@synthesize listaSelect;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    listaSelect = [[NSMutableArray alloc] init];
    [listaSelect addObject:@"Calagem"];
    [listaSelect addObject:@"Colheita"];
    [listaSelect addObject:@"Gessagem"];
    [listaSelect addObject:@"Soja"];
    
    [ViewApper setFrame:[[UIScreen mainScreen] bounds]];
    
    [self.navigationController.view addSubview:ViewApper];
    
    // [self.view addSubview:ViewApper];
    
    self.title = @"Relatórios";
    
    SWRevealViewController *revealViewController = self.revealViewController;
    
    if ( revealViewController ) {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return listaSelect.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"relatorio" forIndexPath:indexPath];
    
    cell.textLabel.text = [listaSelect objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"calagem"]) {
        
        CalagemTable * destViewController = segue.destinationViewController;
        
    } else if ([[segue identifier] isEqualToString:@"gessagem"]) {
        
        GessagemTVC * destViewController = segue.destinationViewController;
    } else if ([[segue identifier] isEqualToString:@"soja"]) {
        
        SojaTVC * destViewController = segue.destinationViewController;
    } else if ([[segue identifier] isEqualToString:@"colheita"]) {
        
        ColheitaTVC * destViewController = segue.destinationViewController;
    }


} */



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
