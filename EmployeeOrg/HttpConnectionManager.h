//
//  HttpConnectionManager.h
//  Restaurent
//
//  Created by NIrmal Thakur on 9/20/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HttpRequest;


@interface HttpConnectionManager : NSObject{
    
    NSString *status;
    NSString *statusMessage;
}

@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *statusMessage;

-(NSData *) getEmployeeList:(HttpRequest *) requestObj;
-(NSData *) getEmployeeInfo:(HttpRequest *) requestObj1;

+(HttpConnectionManager *) getHTTPConnectionMgr;

@end
