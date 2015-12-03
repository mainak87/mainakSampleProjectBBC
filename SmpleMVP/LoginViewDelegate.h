//
//  LoginViewDelegate.h
//  SmpleMVP
//
//  Created by Raja on 16/09/15.
//  Copyright (c) 2015 CTS. All rights reserved.
//

@protocol LoginViewDelegate <NSObject>

- (void) signInWithUserName:(NSString *)userName andPassword:(NSString *)password;
- (void) registerAccountUserName:(NSString *)userName andPassword:(NSString *)password;

- (void) loginSuccess:(NSString *)successMessage;
- (void) loginFailed:(NSString *)failureMessage;

- (void) userRegisterationSuccess:(NSString *)successMessage;
- (void) userRegisterationFailed:(NSString *)failureMessage;

@end
