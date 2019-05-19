//
//  MainViewController.h
//  将棋
//
//  Created by 拓人 吉開 on 12/02/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "ComaLayer.h"

@interface MainViewController : UIViewController{
    ComaLayer *coma;
    BOOL YN;
    BOOL Player;
}
@property (retain, nonatomic) IBOutlet UILabel *label;
@end
