//
//  SplashScreen.h
//  Restaurent
//
//  Created by NIrmal Thakur on 9/16/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeMediator.h"

@interface SplashScreen : UIViewController{
    
    NSArray *empList;
    NSOperationQueue *operationQueue;
    UIAlertView *av;
    UIActivityIndicatorView *ActInd;
    
}

@property (nonatomic,retain) EmployeeMediator *empMediator;
@property (nonatomic,retain) NSArray *empList;

@property (nonatomic,retain) UIAlertView *av;
@property (nonatomic,retain) UIActivityIndicatorView *ActInd;

-(void) getEmpList;

@end
