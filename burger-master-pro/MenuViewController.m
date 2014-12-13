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
//tableview
@property (strong, nonatomic) NSArray *menu;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.menu = [[[NSArray alloc] initWithObjects:@"Home", @"Settings", @"Logout", nil] autorelease];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createMainViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_mainViewController release];
    [_menu release];
    [super dealloc];
}

#pragma mark - VIEW CONTROLLERS

- (void)createMainViewController {
    _mainViewController = [[[MainViewController alloc] init] autorelease];
    _mainViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addChildViewController:_mainViewController];
    _mainViewController.view.backgroundColor = [UIColor blueColor];
    _mainViewController.view.frame = self.view.frame;
    [self.view addSubview:_mainViewController.view];
    [self.mainViewController didMoveToParentViewController:self];
}

@end