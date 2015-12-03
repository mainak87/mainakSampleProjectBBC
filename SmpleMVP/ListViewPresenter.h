//
//  ListPresenter.h
//  SmpleMVP
//
//  Created by Raja on 20/09/15.
//  Copyright © 2015 CTS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListViewDelegate.h"
#import "ListViewCallBack.h"

@interface ListViewPresenter : NSObject <ListViewDelegate>

@property(nonatomic, strong) id<ListViewCallBack> listView;

- (instancetype)initWithListView:(id<ListViewCallBack>)listView;

@end
