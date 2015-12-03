//
//  ListViewDelegate.h
//  SmpleMVP
//
//  Created by Raja on 20/09/15.
//  Copyright © 2015 CTS. All rights reserved.
//

@protocol ListViewDelegate <NSObject>

- (void)loadContent;

- (void)displaycontent:(NSArray *)array;

@end
