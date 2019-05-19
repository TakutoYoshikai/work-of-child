//
//  ViewController.h
//  電卓2
//
//  Created by 拓人 吉開 on 12/01/26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    double num; //式の左辺の変数
    int num2;   //記号を識別する変数
    double numright;    //式の右辺の変数
    BOOL b; //小数点が付いているかどうか調べる変数
    BOOL b2;    //イコールが押されたか調べる変数
    BOOL NM;    //-があるか調べる変数
}
@property (retain, nonatomic) IBOutlet UITextField *textfield;
@property (retain, nonatomic) IBOutlet UIButton *B1;

@end
