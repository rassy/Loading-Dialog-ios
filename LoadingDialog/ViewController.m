//
//  ViewController.m
//  LoadingDialog
//
//  Created by Tomohiro Ryumura on 2013/02/12.
//  Copyright (c) 2013年 Tomohiro Ryumura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // show UIAlertView
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Please wait..." message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alertView show];
    
    // show UIActivityIndicatorView
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.center = CGPointMake(alertView.bounds.size.width * 0.5f, alertView.bounds.size.height * 0.5f +10);
    [indicator startAnimating];
    [alertView addSubview:indicator];

    // close after 2 seconds.
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [alertView dismissWithClickedButtonIndex:0 animated:NO];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
