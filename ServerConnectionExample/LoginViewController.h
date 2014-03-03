//
//  LoginViewController.h
//  ServerConnectionExample
//
//  Created by Dacio Leal Rodriguez on 03/03/14.
//  Copyright (c) 2014 Dacio Leal Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)enterPushButton:(id)sender;

@end
