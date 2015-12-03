//
//  LoginViewCallBack.h
//  SmpleMVP
//
//  Created by Raja on 17/09/15.
//  Copyright © 2015 CTS. All rights reserved.
//

@protocol LoginViewCallBack <NSObject>

- (void) loginSuccess:(NSString *)successMessage;
- (void) loginFailed:(NSString *)failureMessage;

- (void) userRegisterationSuccess:(NSString *)successMessage;
- (void) userRegisterationFailed:(NSString *)failureMessage;

@end