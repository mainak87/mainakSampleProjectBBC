//
//  FakeLoginViewController.h
//  SmpleMVP
//
//  Created by Raja on 17/09/15.
//  Copyright © 2015 CTS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LoginViewCallBack.h"

@interface FakeLoginViewController : NSObject <LoginViewCallBack>

@property (nonatomic, assign) BOOL isLoginSuccessed;
@property (nonatomic, assign) BOOL isRegistrationSuccessed;

@property (nonatomic, strong) NSString *message;

@end
