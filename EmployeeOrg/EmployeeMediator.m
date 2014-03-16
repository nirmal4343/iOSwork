//
//  RestaurentMediator.m
//  Restaurent
//
//  Created by NIrmal Thakur on 9/20/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import "EmployeeMediator.h"
#import "HttpRequest.h"
#import "HttpConnectionManager.h"
#import "SplashScreen.h"

@implementation EmployeeMediator

@synthesize mainScreen,homeScreen,empList;

-(NSArray *) getEmployeeList
{
    
    HttpRequest *requestObject = [[HttpRequest alloc] init];
    
    HttpConnectionManager * httpConn = [HttpConnectionManager getHTTPConnectionMgr];
    
    NSData *response = [httpConn getEmployeeList:requestObject];
    
    if (response) {
        
        NSError *jsonParsingError = nil;
        empList = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonParsingError];
    }
    
    else {
        // Handle Error
    }
    
    return empList;
    
    
}

@end
