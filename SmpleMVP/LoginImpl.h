//
//  LoginImpl.h
//  SmpleMVP
//
//  Created by Raja on 17/09/15.
//  Copyright © 2015 CTS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginImpleDelegate.h"
#import "LoginViewDelegate.h"

@interface LoginImpl : NSObject <LoginImpleDelegate>

@property(nonatomic, strong) NSArray *users;
@property(nonatomic, strong) id<LoginViewDelegate> loginPresenter;

- (instancetype)initWithLoginPresenter:(id<LoginViewDelegate>)loginPresenter andUser:(NSArray *)users;

@end
