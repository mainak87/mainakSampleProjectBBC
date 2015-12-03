//
//  ListViewImpl.h
//  SmpleMVP
//
//  Created by Raja on 20/09/15.
//  Copyright © 2015 CTS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListViewImplDelegate.h"
#import "ListViewDelegate.h"

@interface ListViewImpl : NSObject <ListViewImplDelegate>

@property(nonatomic, strong) id<ListViewDelegate> listPresenter;

- (instancetype)initWithListViewPresenter:(id<ListViewDelegate>)listPresenter;

@end
