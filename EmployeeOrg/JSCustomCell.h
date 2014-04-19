//
//  JSCustomCell.h
//  EmployeeOrg
//
//  Created by Nirmal Thakur on 4/19/14.
//  Copyright (c) 2014 NIrmal Thakur. All rights reserved.
//

#import <UIKit/UIKit.h>

// extends UITableViewCell
@interface JSCustomCell : UITableViewCell

// now only showing one label, you can add more yourself
@property (nonatomic, strong) UILabel *descriptionLabel;

@end