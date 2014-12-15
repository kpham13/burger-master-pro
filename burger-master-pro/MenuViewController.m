//
//  MenuViewController.m
//  burger-master-pro
//
//  Created by Kevin Pham on 12/11/14.
//  Copyright (c) 2014 Kevin Pham. All rights reserved.
//

#import "MenuViewController.h"
#import "MainViewController.h"

@interface MenuViewController ()

@property (strong, nonatomic) MainViewController *mainViewController;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *menu;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.menu = [[[NSArray alloc] initWithObjects:@"Home", @"Settings", @"Logout", nil] autorelease];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createMenu];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self createMainViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_mainViewController release];
    [_tableView release];
    [_menu release];
    [super dealloc];
}

#pragma mark - VIEW CONTROLLERS

- (void)createMenu {
    UITableView *menu = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView = menu;
    [self.view addSubview:self.tableView];
}

- (void)createMainViewController {
    _mainViewController = [[[MainViewController alloc] init] autorelease];
    _mainViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addChildViewController:_mainViewController];
    _mainViewController.view.backgroundColor = [UIColor grayColor];
    _mainViewController.view.frame = self.view.frame;
    [self.view addSubview:_mainViewController.view];
    [self.mainViewController didMoveToParentViewController:self];
}

#pragma mark - TABLE VIEW DATA SOURCE

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CELL";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.menu[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rowNumber;
    
    if (self.menu != nil) {
        rowNumber = self.menu.count;
    } else {
        rowNumber = 0;
    }
    
    return rowNumber;
}

#pragma mark - TABLE VIEW DELEGATE

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:true];
    
    // Instantiate view controllers based on menu item clicked
}

@end