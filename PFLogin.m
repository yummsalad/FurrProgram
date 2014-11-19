//
//  PFLogin.m
//  ParseExample
//
//  Created by Charles Konkol on 10/30/14.
//  Copyright (c) 2014 Rock Valley College. All rights reserved.
//

#import "PFLogin.h"
#import <QuartzCore/QuartzCore.h>
@implementation PFLogin

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)viewDidLoad {
    [super viewDidLoad];
        [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"furrlogo.png"]]];
    
}

@end
