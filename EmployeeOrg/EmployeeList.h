//
//  EmployeeList.h
//  EmployeeOrg
//
//  Created by Nirmal Thakur on 3/9/14.
//  Copyright (c) 2014 NIrmal Thakur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeDetails.h"

@interface EmployeeList : UITableViewController <UISearchBarDelegate> {
    NSArray * empList;
    NSCache * _cache;
    EmployeeDetails *employeeDtl;
    NSDictionary *empNewMap;
    UIImage *image;
    
}

@property (nonatomic,retain) NSArray *empList;
@property (nonatomic,retain) NSCache *_cache;
@property (nonatomic,strong) IBOutlet UISearchBar *searchBar;

@property (nonatomic,strong) EmployeeDetails *employeeDtl;

@property(nonatomic,retain) NSDictionary *empNewMap;
@property(nonatomic,retain) UIImage *image;


@end
