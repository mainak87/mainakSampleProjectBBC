//
//  LoginImpl.m
//  SmpleMVP
//
//  Created by Raja on 17/09/15.
//  Copyright © 2015 CTS. All rights reserved.
//

#import "LoginImpl.h"

@implementation LoginImpl

- (instancetype)initWithLoginPresenter:(id<LoginViewDelegate>)loginPresenter andUser:(NSArray *)users
{
    if (self = [super init]) {
        self.users = users;
        self.loginPresenter = loginPresenter;
    }
    
    return self;
}

- (void)validateSignIn:(NSString *)userName andPassword:(NSString *)password
{
    NSString *validateUserName = [self validateUserName:userName];
    
    if (validateUserName.length) {
        [self.loginPresenter userRegisterationFailed:validateUserName];
        return;
    }
    
    NSString *validatePassword = [self validatePassword:password];
    
    if (validatePassword.length) {
        [self.loginPresenter userRegisterationFailed:validatePassword];
        return;
    }
    
    if (!validateUserName.length && !validatePassword.length)
    {
        BOOL found = NO;
        
        NSString *returnMessage = @"UserName not registered";
        
        for (NSDictionary *account in self.users) {
            if ([account[@"UserName"] isEqualToString:userName] && [account[@"Password"] isEqualToString:password]) {
                found = YES;
                returnMessage= @"Logged in successfully";
            }
        }
        
        if (found) {
            [self.loginPresenter loginSuccess:returnMessage];
        } else {
            [self.loginPresenter loginFailed:returnMessage];
        }
    }
}

- (void)registerUser:(NSString *)userName andPassword:(NSString *)password
{
    NSString *validateUserName = [self validateUserName:userName];
    
    if (validateUserName.length) {
        [self.loginPresenter userRegisterationFailed:validateUserName];
        return;
    }
    
    NSString *validatePassword = [self validatePassword:password];
    
    if (validatePassword.length) {
        [self.loginPresenter userRegisterationFailed:validatePassword];
        return;
    }

    if (!validateUserName.length && !validatePassword.length)
    {
        BOOL found = NO;
        
        NSString *returnMessage = @"User registered successfully";
        
        for (NSDictionary *account in self.users) {
            if ([account[@"UserName"] isEqualToString:userName]) {
                found = YES;
                returnMessage = @"User already exists";
            }
        }
        
        if (found) {
            [self.loginPresenter userRegisterationFailed:returnMessage];
        } else {
            [self.loginPresenter userRegisterationSuccess:returnMessage];
        }
    }
}

- (BOOL)isEmptyString:(NSString *)string
{
    return (string && string.length == 0);
}

- (NSString *)validateUserName:(NSString *)name
{
    if ([self isEmptyString:name]) {
        return @"UserName is empty";
    } else {
        return @"";
    }
}

- (NSString *)validatePassword:(NSString *)pass
{
    if ([self isEmptyString:pass]) {
        return @"Password is empty";
    } else {
        return @"";
    }
}

@end
