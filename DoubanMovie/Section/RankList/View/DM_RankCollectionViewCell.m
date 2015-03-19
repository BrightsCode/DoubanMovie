//
//  DM_RankCollectionViewCell.m
//  DoubanMovie
//
//  Created by apppc on 15/3/19.
//  Copyright (c) 2015年 huatek. All rights reserved.
//

#import "DM_RankCollectionViewCell.h"

@implementation DM_RankCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imgRank = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.width/2, 10, 20, 20)];
        [self.contentView addSubview:self.imgRank];
        
        self.labTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.contentView.width/2 - 100, self.imgRank.bottom + 8, 200, 20)];
        self.labTitle.font = [UIFont systemFontOfSize:18];
        self.labTitle.textAlignment = NSTextAlignmentCenter;
        self.labTitle.textColor = mRGBColor(0, 0, 0);
        [self.contentView addSubview:self.labTitle];
        
        self.labDetail = [[UILabel alloc] initWithFrame:CGRectMake(self.contentView.width/2 - 100, self.labTitle.bottom + 8, 200, 20)];
        self.labDetail.font = [UIFont systemFontOfSize:14];
        self.labDetail.textAlignment = NSTextAlignmentCenter;
        self.labDetail.textColor = mRGBColor(0, 0, 0);
        [self.contentView addSubview:self.labDetail];
    }
    return self;
}
@end
