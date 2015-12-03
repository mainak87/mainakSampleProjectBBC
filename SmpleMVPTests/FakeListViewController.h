//
//  FakeListViewController.h
//  SmpleMVP
//
//  Created by Raja on 20/09/15.
//  Copyright © 2015 CTS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListViewCallBack.h"

@interface FakeListViewController : NSObject <ListViewCallBack>

@property (nonatomic, strong) NSArray *listContentArray;

@end
