//
//  ViewController.m
//  ToDoApp
//
//  Created by Rodrigo Labanca on 6/18/15.
//  Copyright (c) 2015 Rodrigo Labanca. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *todoTitle;

@property (weak, nonatomic) IBOutlet UITextView *todoDescription;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    
    PFObject *object = [PFObject objectWithClassName:@"TODO"];
    [object setValue:self.todoTitle.text forKey:@"title"];
    [object setValue:self.todoDescription.text forKey:@"description"];
    [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"TODO" message:@"TODO saved!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.todoDescription becomeFirstResponder];
    return NO;
}

- (IBAction)tapOutside:(id)sender {
    [self.todoTitle resignFirstResponder];
    [self.todoDescription resignFirstResponder];
}

@end
