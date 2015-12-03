//
//  FakeLoginViewController.m
//  SmpleMVP
//
//  Created by Raja on 17/09/15.
//  Copyright © 2015 CTS. All rights reserved.
//

#import "FakeLoginViewController.h"

@implementation FakeLoginViewController

-(void)loginSuccess:(NSString *)successMessage
{
    self.isLoginSuccessed = YES;
    self.message = successMessage;
}

-(void)loginFailed:(NSString *)failureMessage
{
    self.isLoginSuccessed = NO;
    self.message = failureMessage;
}

-(void)userRegisterationSuccess:(NSString *)successMessage
{
    self.isRegistrationSuccessed = YES;
    self.message = successMessage;
}

-(void)userRegisterationFailed:(NSString *)failureMessage
{
    self.isRegistrationSuccessed = NO;
    self.message = failureMessage;
}

@end
