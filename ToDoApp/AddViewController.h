//
//  ViewController.h
//  ToDoApp
//
//  Created by Rodrigo Labanca on 6/18/15.
//  Copyright (c) 2015 Rodrigo Labanca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AddViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) PFObject *object;

@end

