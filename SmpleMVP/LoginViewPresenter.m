//
//  LoginViewPresenter.m
//  SmpleMVP
//
//  Created by Raja on 16/09/15.
//  Copyright (c) 2015 CTS. All rights reserved.
//

#import "LoginViewPresenter.h"

#import "LoginImpl.h"
#import "LoginImpleDelegate.h"

@interface LoginViewPresenter ()
@property (nonatomic, strong) LoginImpl *loginImpl;
@end

@implementation LoginViewPresenter

- (instancetype)initWithRepository:(id<AccountRepositoryDelegate>)accountRepository andLoginView:(id<LoginViewCallBack>)loginView
{
    if (self = [super init]) {
        self.accountRepository = accountRepository;
        self.loginView = loginView;
        
        self.loginImpl = [[LoginImpl alloc] initWithLoginPresenter:self andUser:[self.accountRepository accountRegistered]];
    }
    
    return self;
}

- (void) signInWithUserName:(NSString *)userName andPassword:(NSString *)password
{
    [self.loginImpl validateSignIn:userName andPassword:password];
}

- (void) registerAccountUserName:(NSString *)userName andPassword:(NSString *)password
{
    [self.loginImpl registerUser:userName andPassword:password];
}

-(void)loginSuccess:(NSString *)successMessage
{
    [self.loginView loginSuccess:successMessage];
}

-(void)loginFailed:(NSString *)failureMessage
{
    [self.loginView loginFailed:failureMessage];
}

-(void)userRegisterationSuccess:(NSString *)successMessage
{
    [self.loginView userRegisterationSuccess:successMessage];
}

-(void)userRegisterationFailed:(NSString *)failureMessage
{
    [self.loginView userRegisterationFailed:failureMessage];
}

@end
