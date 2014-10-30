//
//  ViewController.h
//  ParseExample
//
//  Created by Charles Konkol on 10/28/14.
//  Copyright (c) 2014 Rock Valley College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface ViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *username;
- (IBAction)btnLogOut:(id)sender;
@property (nonatomic, strong) UIView *logo;

@end

//PFLogInViewController

//UIViewController

