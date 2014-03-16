//
//  EmployeeList.h
//  EmployeeOrg
//
//  Created by Nirmal Thakur on 3/9/14.
//  Copyright (c) 2014 NIrmal Thakur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeList : UITableViewController {
    NSArray * empList;
    NSCache * _cache;
    
}

@property (nonatomic,retain) NSArray *empList;
@property (nonatomic,retain) NSCache *_cache;

@end
