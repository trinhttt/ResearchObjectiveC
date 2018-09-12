//
//  ViewController.m
//  Draw_ObjectiveC
//
//  Created by Thai Thi Tu Trinh on 9/11/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@end
@implementation ViewController


- (IBAction)ibDrawRectangle:(id)sender{
    self.ibFirstString.text = NSLocalizedString(@"Welcome", comment: "");
    [self.ibRectangleButton setTitle:NSLocalizedString(@"Welcome", comment: "") forState:UIControlStateNormal];
    [self.ibCircleButton setTitle:NSLocalizedString(@"Welcome", comment: "") forState:UIControlStateNormal];
    [self.ibLineButton setTitle:NSLocalizedString(@"Welcome", comment: "") forState:UIControlStateNormal];
    [self.ibTextButton setTitle:NSLocalizedString(@"Welcome", comment: "") forState:UIControlStateNormal];

    UIAlertController* alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Welcome", comment: "")
                                                                   message:NSLocalizedString(@"Mess", comment: "")
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Ok", comment: "") style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
//    DrawView *drawView = [[DrawView alloc] initWithFrame:self.ibDrawView.frame];
//    [drawView initWithFrame: self.ibDrawView.frame];
    
    DrawView *drawView = [[DrawView alloc] init];
    [drawView initObject];
    drawView.backgroundColor = [UIColor redColor];
    drawView.frame = self.ibDrawView.frame;
    
    [self.view addSubview:drawView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
