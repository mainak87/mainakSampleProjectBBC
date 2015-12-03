//
//  ListViewController.m
//  SmpleMVP
//
//  Created by Raja on 20/09/15.
//  Copyright © 2015 CTS. All rights reserved.
//

#import "ListViewController.h"
#import "ListViewPresenter.h"
#import "News.h"

@interface ListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@property (nonatomic, strong) ListViewPresenter *listPresenter;

@property (nonatomic, strong) NSArray *listcontentArray;

@end

@implementation ListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.listPresenter = [self presenterForListView];
    [self.listPresenter loadContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ListViewDelegate

- (void)displayContent:(NSArray *)array
{
    self.listcontentArray = array;
}

#pragma mark - Presenter

-(ListViewPresenter *)presenterForListView
{
    ListViewPresenter *presenter = [[ListViewPresenter alloc] initWithListView:self];
    
    return presenter;
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listcontentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    News *news = [self.listcontentArray objectAtIndex:indexPath.row];
    [cell textLabel].text = news.title;
    
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // do nothing
}

@end
