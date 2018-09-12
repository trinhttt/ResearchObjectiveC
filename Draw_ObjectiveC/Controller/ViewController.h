//
//  ViewController.h
//  Draw_ObjectiveC
//
//  Created by Thai Thi Tu Trinh on 9/11/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawView.h"
#import "Line.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *ibFirstString;
@property (weak, nonatomic) IBOutlet UIButton *ibRectangleButton;
@property (weak, nonatomic) IBOutlet UIButton *ibCircleButton;
@property (weak, nonatomic) IBOutlet UIButton *ibLineButton;
@property (weak, nonatomic) IBOutlet UIButton *ibTextButton;
@property (weak, nonatomic) IBOutlet UIView *ibDrawView;
@end

