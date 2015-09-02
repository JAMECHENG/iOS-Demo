//
//  CarModel.h
//  LovingCar
//
//  Created by Jame on 15/8/10.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "BaseModel.h"

@interface CarModel : BaseModel
/**
 @abstract
 **/
@property (nonatomic, copy) NSString *carId;
/**
 @abstract
 **/
@property (nonatomic, copy) NSString *carName;
/**
 @abstract
 **/
@property (nonatomic, copy) NSString *userId;
@end
