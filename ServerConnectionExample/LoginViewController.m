//
//  LoginViewController.m
//  ServerConnectionExample
//
//  Created by Dacio Leal Rodriguez on 03/03/14.
//  Copyright (c) 2014 Dacio Leal Rodriguez. All rights reserved.
//

#import "LoginViewController.h"
#import "MD5.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enterPushButton:(id)sender
{
    
    [self loginWithEmail:_emailTextField.text andPassword:[MD5 hashmd5:_passwordTextField.text]];
}

#pragma mark - Connecting the server with email Method

- (void) loginWithEmail: (NSString *) email andPassword: (NSString *) password {
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfiguration.timeoutIntervalForRequest = 10.0;
    sessionConfiguration.timeoutIntervalForResource = 10.0;
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURL *url = [NSURL URLWithString:@"http://bitstudio.es/clase"];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *parameters = [NSString stringWithFormat:@"email=%@&password=%@", email, password];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[parameters dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        if (!error) {
            
            if ([[dictionary objectForKey:@"code"] isEqualToString:@"KO"]) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Invalid User" delegate:self cancelButtonTitle:@"Accept" otherButtonTitles:nil];
                [alert show];
                
            } else {
            
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [self performSegueWithIdentifier:@"goToAppFromLogin" sender:self];
                });
            }
        }
    }];
    
    [dataTask resume];
    
}

@end


























