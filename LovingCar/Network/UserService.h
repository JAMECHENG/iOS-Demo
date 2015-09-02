//
//  UserService.h
//  LovingCar
//
//  Created by Jame on 15/7/17.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "BaseService.h"

@interface UserService : BaseService
/**
 @abstract 
 **/
- (void)loginWithParameter:(NSMutableDictionary *)parameter SuccessBlock:(void (^)(id object))successBlock FailedBlock:(void (^)(NSString *errorMsg))failedBlock;
@end
