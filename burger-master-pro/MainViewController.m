//
//  MainViewController.m
//  burger-master-pro
//
//  Created by Kevin Pham on 12/11/14.
//  Copyright (c) 2014 Kevin Pham. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (strong, nonatomic) UIButton *burgerButton;
@property (strong, nonatomic) UIImage *burgerImage;
@property BOOL burgerIsActive;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createBurgerButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_burgerButton release];
    [_burgerImage release];
    [super dealloc];
}

- (void)createBurgerButton {
    self.burgerImage = [UIImage imageNamed:@"burger"];
    _burgerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_burgerButton addTarget:self action:@selector(didPressBurgerButton) forControlEvents:UIControlEventTouchUpInside];
    [_burgerButton setImage:self.burgerImage forState:UIControlStateNormal];
    //[_burgerButton setTitle:@"Burger Menu" forState:UIControlStateNormal];
    //[_burgerButton setBackgroundColor:[UIColor grayColor]];
    //_burgerButton.layer.cornerRadius = 5;
    _burgerButton.frame = CGRectMake(10, 30, 40, 40);
    [self.view addSubview:_burgerButton];
}

- (void)didPressBurgerButton {
    // Animation for Burger Button
    if (self.burgerIsActive == NO) {
        [UIView animateWithDuration:0.4 animations:^{
            self.view.frame = CGRectMake(self.view.frame.size.width * 0.8, 0, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished) {
            //
        }];
        
        self.burgerIsActive = YES;
    } else {
        [UIView animateWithDuration:0.4 animations:^{
            self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished) {
            //
        }];
        
        self.burgerIsActive = NO;
    }
}

@end