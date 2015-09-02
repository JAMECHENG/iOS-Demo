//
//  AppHelper.m
//  LovingCar
//
//  Created by Jame on 15/7/17.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "AppHelper.h"

@implementation AppHelper

#pragma mark - UIImage Helper
+ (UIImage *)transferBlurImage:(UIImage *)image withBlurLevel:(CGFloat)blur
{
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"
                                  keysAndValues:kCIInputImageKey, inputImage,
                        @"inputRadius", @(blur),
                        nil];
    CIImage *outputImage = filter.outputImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH(), SCREEN_HEIGHT());
    CGImageRef outImage = [context createCGImage:outputImage fromRect:rect];
    UIImage *returnImage = [UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return returnImage;
}

+ (UIImage *)transferViewToImage:(UIView *)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
#pragma mark - NSDate Helper
+ (NSString *)dateStringWithDate:(NSDate *)date formart:(NSString *)formart
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formart];
    NSString *dataStr = [dateFormatter stringFromDate:date];
    return dataStr;
}

+ (NSString *)stringFromDate:(NSDate *)date
{
    return [AppHelper dateStringWithDate:date formart:NSDATE_DEFAULT_FORMART];
}

+ (NSDate *)dateWithDateString:(NSString*)string formart:(NSString *)formart
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formart];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

+ (NSDate *)dateFromString:(NSString *)string
{
    return [AppHelper dateWithDateString:string formart:NSDATE_DEFAULT_FORMART];
}
#pragma mark - NSString Helper
+ (NSString *)groupSQLStrings:(NSArray *)array
{
    return [AppHelper groupStrings:array String:@" "];
}

+ (NSString *)groupStrings:(NSArray *)array String:(NSString *)string{
    NSString *fianlString = [array componentsJoinedByString:[NSString stringWithFormat:@"%@",string]];
    return fianlString;
}
#pragma mark - Plist Helper
+ (BOOL)writeToPlistWithKey:(NSString *)key Object:(id)object FileName:(NSString *)fileName
{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    NSString *filePath=[path stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@.plist",fileName]];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:filePath])
    {
        [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    }
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:filePath];
    NSMutableDictionary *tmpDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    if([tmpDic objectForKey:key])
    {
        [tmpDic removeObjectForKey:key];
    }
    [tmpDic setObject:object forKey:key];
    return [tmpDic writeToFile:filePath atomically:YES];
}

+ (id)readFromPlistWithKey:(NSString *)key FileName:(NSString *)fileName
{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    NSString *filePath=[path stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@.plist",fileName]];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    return [dic objectForKey:key];
}

+ (BOOL)removeObjectFromPlistWithKey:(NSString *)key FileName:(NSString *)fileName
{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path =  [pathArray objectAtIndex:0];
    NSString *filePath=[path stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@.plist",fileName]];
    NSFileManager *fileManager  = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath: filePath])
    {
        [fileManager createFileAtPath: filePath contents:nil attributes:nil];
    }
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSMutableDictionary *tmpDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    if([tmpDic objectForKey:key])
    {
        [tmpDic removeObjectForKey:key];
    }
    return [tmpDic writeToFile:filePath atomically:YES];
}

+ (BOOL)writeToPlistWithKey:(NSString *)key Object:(id)object
{
    return [AppHelper writeToPlistWithKey:key Object:object FileName:@"AppDetails.plist"];
}

+ (id)readFromPlistWithKey:(NSString *)key
{
    return [AppHelper readFromPlistWithKey:key FileName:@"AppDetails.plist"];
}

+ (BOOL)removeObjectFromPlistWithKey:(NSString *)key
{
    return [AppHelper removeObjectFromPlistWithKey:key FileName:@"AppDetails.plist"];
}

+ (BOOL)updateDictionaryToPlist:(NSDictionary *)dic FileName:(NSString *)fileName
{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    NSString *filePath=[path stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@.plist",fileName]];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filePath])
    {
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    }
    return [dic writeToFile:filePath atomically:YES];
}

+ (NSDictionary *)readDictionaryFromPlistWithFileName:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [NSString stringWithFormat:@"%@/",[paths objectAtIndex:0]];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",fileName]];
    return [NSDictionary dictionaryWithContentsOfFile:filePath];
}

+ (BOOL)updateArrayToPlist:(NSArray *)array FileName:(NSString *)fileName
{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    NSString *filePath=[path stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@.plist",fileName]];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filePath])
    {
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    }
    return [array writeToFile:filePath atomically:YES];
}

+ (NSArray *)readArrayFromPlistWithFileName:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [NSString stringWithFormat:@"%@/",[paths objectAtIndex:0]];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",fileName]];
    return [NSArray arrayWithContentsOfFile:filePath];
}

+ (BOOL)deletePlistFileWithFileName:(NSString *)fileName
{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    NSString *filePath=[path stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@.plist",fileName]];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath])
    {
        return [fileManager removeItemAtPath:filePath error:nil];
    } else {
        return NO;
    }
}

#pragma mark - NSUserDefault Helper
+ (void)updateUserDefaultsWithKey:(NSString *)key Object:(id)object
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:object forKey:key];
    [userDefaults synchronize];
}

+ (id)readObjectFromUserDefaultsWithKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

+ (void)removeObjectFromUserDefaultsWithKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

+ (NSUserDefaults *)getUserDefaults
{
    return [NSUserDefaults standardUserDefaults];
}

#pragma mark - File Helper



@end
