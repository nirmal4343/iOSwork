//
//  Employee.h
//  EmployeeOrg
//
//  Created by Nirmal Thakur on 3/9/14.
//  Copyright (c) 2014 NIrmal Thakur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject{

    NSString * title;
    NSString *imageDownloadPath;
    NSString *reportCount;
    NSString *officePhone;
    NSString *cellPhone;
    NSString *email;
    NSString *city;
    NSString *picture;
    NSString *firstName;
    NSString *lastName;
    NSString *managerId;
    NSString *department;
    NSString *ids;
}

@property (nonatomic,retain) NSString * title;
@property (nonatomic,retain) NSString * imageDownloadPath;
@property (nonatomic,retain) NSString * reportCount;
@property (nonatomic,retain) NSString * officePhone;
@property (nonatomic,retain) NSString * cellPhone;
@property (nonatomic,retain) NSString * email;
@property (nonatomic,retain) NSString * picture;
@property (nonatomic,retain) NSString * firstName;
@property (nonatomic,retain) NSString * lastName;
@property (nonatomic,retain) NSString * managerId;
@property (nonatomic,retain) NSString * department;
@property (nonatomic,retain) NSString * ids;

@end
