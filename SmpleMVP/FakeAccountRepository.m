//
//  FakeAccountRepository.m
//  SmpleMVP
//
//  Created by Raja on 16/09/15.
//  Copyright (c) 2015 CTS. All rights reserved.
//

#import "FakeAccountRepository.h"

@implementation FakeAccountRepository

-(NSArray *)accountRegistered
{
    return [NSArray arrayWithObjects:@{@"UserName":@"user1", @"Password":@"pass"},
            @{@"UserName":@"user2", @"Password":@"pass"},
            @{@"UserName":@"user3", @"Password":@"pass"},
            @{@"UserName":@"user4", @"Password":@"pass"},
            nil];
}

@end
