//
//  RestaurentMediator.h
//  Restaurent
//
//  Created by NIrmal Thakur on 9/20/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import <Foundation/Foundation.h>


@class SplashScreen;

@interface EmployeeMediator : NSThread {
    
    SplashScreen *homeScreen;
    NSArray * empList;
    
}

- (NSArray *) getEmployeeList;

@property (nonatomic,retain) UIViewController *mainScreen;
@property (nonatomic,retain) SplashScreen *homeScreen;
@property (nonatomic,retain) NSArray * empList;


@end
