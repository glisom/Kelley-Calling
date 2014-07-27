//
//  DirectoryViewCell.m
//  Kelley Calling
//
//  Created by Grant Isom on 7/24/14.
//  Copyright (c) 2014 Grant Isom. All rights reserved.
//

#import "DirectoryViewCell.h"

@implementation DirectoryViewCell

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
