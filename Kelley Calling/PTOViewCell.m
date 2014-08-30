//
//  PTOViewCell.m
//  Kelley Calling
//
//  Created by Grant Isom on 8/30/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "PTOViewCell.h"

@implementation PTOViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
