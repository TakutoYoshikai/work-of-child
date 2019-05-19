//
//  ViewController.h
//  テトリス
//
//  Created by 拓人 吉開 on 12/02/03.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    UITapGestureRecognizer *doubletap;
    NSArray *blockArray;
    CALayer *layer1;
    CALayer *layer2;
    CALayer *layer3;
    CALayer *layer4;
    NSTimer *timer;
    int blockType;
    int r;
    NSString *type;
    int katati;
    int random;
    UILabel *label;
    BOOL YN;
}

@end
