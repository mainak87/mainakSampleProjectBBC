//
//  LoginImpleDelegate.h
//  SmpleMVP
//
//  Created by Raja on 17/09/15.
//  Copyright © 2015 CTS. All rights reserved.
//

@protocol LoginImpleDelegate <NSObject>

- (void)validateSignIn:(NSString *)userName andPassword:(NSString *)password;
- (void)registerUser:(NSString *)userName andPassword:(NSString *)password;

@end
