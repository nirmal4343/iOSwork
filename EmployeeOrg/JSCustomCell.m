//
//  JSCustomCell.m
//  EmployeeOrg
//
//  Created by Nirmal Thakur on 4/19/14.
//  Copyright (c) 2014 NIrmal Thakur. All rights reserved.
//

#import "JSCustomCell.h"

@implementation JSCustomCell

@synthesize descriptionLabel = _descriptionLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // configure control(s)
        self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 300, 30)];
        self.descriptionLabel.textColor = [UIColor blackColor];
        self.descriptionLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
        
        [self addSubview:self.descriptionLabel];
    }
    return self;
}

@end