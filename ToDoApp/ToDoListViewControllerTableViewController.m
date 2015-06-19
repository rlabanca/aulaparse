//
//  ToDoListViewControllerTableViewController.m
//  ToDoApp
//
//  Created by Rodrigo Labanca on 6/18/15.
//  Copyright (c) 2015 Rodrigo Labanca. All rights reserved.
//

#import "ToDoListViewControllerTableViewController.h"
#import "ToDoCellTableViewCell.h"
#import "AddViewController.h"

#import <Parse/Parse.h>

@interface ToDoListViewControllerTableViewController ()

@property (nonatomic,strong) NSArray *todoList;

@end

@implementation ToDoListViewControllerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated {
    __weak __typeof(self) weakSelf = self;
    
    PFQuery *query = [PFQuery queryWithClassName:@"TODO"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        weakSelf.todoList = objects;
        [weakSelf.tableView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ToDoCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToDoCell" forIndexPath:indexPath];
    
    PFObject *object = [self.todoList objectAtIndex:indexPath.row];
    
    cell.todoTitle.text = [object valueForKey:@"title"];
    
    return cell;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"show"]) {
        AddViewController *controller = segue.destinationViewController;
        
        NSInteger position = self.tableView.indexPathForSelectedRow.row;
        PFObject *object = [self.todoList objectAtIndex:position];
        
        controller.object = object;
    }
}

@end
