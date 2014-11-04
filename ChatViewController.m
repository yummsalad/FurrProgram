//
//  ChatViewController.m
//  ParseExample
//
//  Created by Charles Konkol on 10/31/14.
//  Copyright (c) 2014 Rock Valley College. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ChatWindows.text=@"";
     [NSTimer scheduledTimerWithTimeInterval: 1.0  target: self selector: @selector(GetchatMsg:) userInfo: nil repeats: YES];
    //self.ChatWindows.text = self.ViewData;
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        self.UserName.text=[NSString stringWithFormat:@"Welcome, %@", currentUser.username];
        usernames=[NSString stringWithFormat:@"%@", currentUser.username];
    } else {
        // show the signup or login screen
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    

    [self.SendMessage becomeFirstResponder];
  
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SendMessage:(id)sender {
    // Send a notification to all devices subscribed to the "Giants" channel.
  }
- (IBAction)btnExit:(id)sender {
      [self dismissViewControllerAnimated:YES completion:nil];
}
- (void) GetchatMsg:(NSTimer*) t
{
    PFQuery *query = [PFQuery queryWithClassName:@"Chats"];
    [query whereKey:@"receiver" equalTo:usernames];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
       //     NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
               NSLog(@"%@", [object objectForKey:@"message"]);
                
              //  self.ChatWindows.text=object.objectId;
                self.ChatWindows.text=[NSString stringWithFormat:@"%@\n%@", self.ChatWindows.text, [object objectForKey:@"message"]];
                //Create query for all current user objects
                PFQuery *query2 = [PFQuery queryWithClassName:@"Chats"];
                [query2 whereKey:@"receiver" equalTo:usernames];
                query2.cachePolicy = kPFCachePolicyCacheThenNetwork;
                [query2 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                    if (!error) {
                        if (!objects) {
                            
                            return;
                        }
                        [PFObject deleteAllInBackground:objects];
                    }
                    
                }];

                
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
   
}
- (IBAction)SendMsg:(id)sender {
   
    PFObject *chat = [PFObject objectWithClassName:@"Chats"];
    chat[@"sender"] = usernames;
    chat[@"receiver"] = self.ViewData;
    chat[@"message"] = [NSString stringWithFormat:@"%@: %@", usernames,self.SendMessage.text];;
    [chat saveInBackground];
    self.SendMessage.text=@"";
    
}
@end
