//
//  DetailView.h
//  TableView
//
//  Created by Thai Thi Tu Trinh on 9/14/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//
#import <UIKit/UIKit.h>
#ifndef DetailView_h
#define DetailView_h

@interface DetailView : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *ibDetailLabel;
@property (strong, nonatomic) id detailItem;

@end

#endif /* DetailView_h */
