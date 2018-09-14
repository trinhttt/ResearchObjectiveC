//
//  DetailView.m
//  TableView
//
//  Created by Thai Thi Tu Trinh on 9/14/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

#import "DetailView.h"
@interface DetailView ()

@end

@implementation DetailView
- (void)configureView {
    if (self.detailItem) {
        self.ibDetailLabel.text = [self.detailItem description];
    }
}
- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [self configureView];
    }
    
}
-(void)btnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
