//
//  LoginViewPresenter.h
//  SmpleMVP
//
//  Created by Raja on 16/09/15.
//  Copyright (c) 2015 CTS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LoginViewDelegate.h"
#import "LoginViewCallBack.h"
#import "AccountRepositoryDelegate.h"

@interface LoginViewPresenter : NSObject <LoginViewDelegate>

@property(nonatomic, strong) id<AccountRepositoryDelegate> accountRepository;
@property(nonatomic, strong) id<LoginViewCallBack> loginView;

- (instancetype)initWithRepository:(id<AccountRepositoryDelegate>)accountRepository andLoginView:(id<LoginViewCallBack>)loginView;

@end
