//
//  MainViewController.h
//  ServerConnectionExample
//
//  Created by Dacio Leal Rodriguez on 03/03/14.
//  Copyright (c) 2014 Dacio Leal Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <NSURLSessionDownloadDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIProgressView *barProgressView;

- (IBAction)closePushButton:(id)sender;
- (IBAction)downloadPushButton:(id)sender;

@end
