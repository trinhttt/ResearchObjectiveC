//
//  MainViewController.m
//  TableView
//
//  Created by Thai Thi Tu Trinh on 9/14/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "DetailView.h"
NSMutableArray *objects;
@interface MainViewController ()
@end

@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    }

- (void)insertNewObject:(id)sender {
    if (!objects) {
        objects = [[NSMutableArray alloc] init];
    }
    [objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDate *object = objects[indexPath.row];
    cell.textLabel.text = [object description];// use basic custom
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"showDetail"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = objects[indexPath.row];
        DetailView *controller = (DetailView *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
     
//        controller.navigationItem.leftBarButtonItem = self.
//        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}
@end
