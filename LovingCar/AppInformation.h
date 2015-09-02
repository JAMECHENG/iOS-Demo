//
//  AppInformation.h
//  LovingCar
//
//  Created by Jame on 15/7/17.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#ifndef LovingCar_AppInformation_h
#define LovingCar_AppInformation_h
#import <objc/runtime.h>

//动画出现的方向
typedef NS_ENUM(int, AnimationDirection) {
    AnimationDirectionFromTop,
    AnimationDirectionFromLeft,
    AnimationDirectionFromRight,
    AnimationDirectionFromBottom
};

//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#	define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define DLogObject(obj) DLog(@"%@", obj)
#else
#	define DLog(...)
#   define DLogObject(...)
#endif

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:fmt, ##__VA_ARGS__] message:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif


/**
 @abstract 在debug模式下打印CGRECT.
 **/
static inline void DLOG_CGRECT(CGRect rect)
{
    DLog(@"x = %lf,y = %lf,w = %lf,h = %lf",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
}
/**
 @abstract 在debug模式下打印CGSIZE.
 **/
static inline void DLOG_CGSIZE(CGSize size)
{
    DLog(@"w = %lf,h = %lf",size.width,size.height);
}
/**
 @abstract 在debug模式下打印CGPOINT.
 **/
static inline void DLOG_CGPOINT(CGPoint point)
{
    DLog(@"x = %lf,y = %lf",point.x,point.y);
}
/**
 @abstract 根据URL去调用外部的APP.
 @param url是一个外部链接的地址.
 **/
static inline void OPEN_OUTSIDE_URL_BASED_ON_STRING(NSString *url)
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    } else {
        ULog(@"CAN NOT OPEN THIS URL");
    }
}

static inline NSArray* SORTED_ARRAY_BY_KEY_AND_ASCENDING(NSArray *array,NSString *key,BOOL ascending)
{
    return [array sortedArrayUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:key ascending:ascending selector:@selector(caseInsensitiveCompare:)]]];
}

static inline NSArray* GET_UNIQUE_OBJECTS_FROM_ARRAY(NSArray *array)
{
    return [[NSSet setWithArray:array] allObjects];
}

/**
 @abstract 获取本机屏幕的宽度.
 **/
static inline CGFloat SCREEN_WIDTH()
{
    return [UIScreen mainScreen].bounds.size.width;
}
/**
 @abstract 获取本机屏幕的高度.
 **/
static inline CGFloat SCREEN_HEIGHT()
{
    return [UIScreen mainScreen].bounds.size.height;
}
/**
 @abstract 获取本机上的软件版本.
 **/
static inline NSString *APP_VERSION()
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
/**
 @abstract 判断本机是否为iPhone4或者iPhone4s.
 **/
static inline BOOL iPhone4()
{
    return [UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO;
}
/**
 @abstract 判断本机是否为iPhone5或者iPhone5s.
 **/
static inline BOOL iPhone5()
{
    return [UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO;
}
/**
 @abstract 判断本机是否为iPhone6.
 **/
static inline BOOL iPhone6()
{
    return [UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO;
}
/**
 @abstract 判断本机是否为iPhone6Plus.
 **/
static inline BOOL iPhone6Plus()
{
    return [UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO;
}
/**
 @abstract 根据Hex值来获取UICOLOR.
 **/
static inline UIColor *UICOLOR_FROM_HEX(NSInteger hex)
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0];
}
static inline UIColor *UICOLOR_FROM_RGB(CGFloat r,CGFloat g,CGFloat b,CGFloat a)
{
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a];
}
/**
 @abstract 获取本机的操作系统版本.
 **/
static inline NSString* DEVICE_SYSTEM_VERSION()
{
    return [[UIDevice currentDevice] systemVersion];
}
/**
 @abstract 判断本机的版本是否为v版本.
 **/
static inline BOOL SYSTEM_VERION_EQUAL_TO(double v)
{
    return __IPHONE_OS_VERSION_MIN_REQUIRED == v;
}
/**
 @abstract 判断本机的版本是否为v版本.
 **/
static inline BOOL SYSTEM_VERSION_GETATER_THAN(double v)
{
    return __IPHONE_OS_VERSION_MIN_REQUIRED >v;
}
/**
 @abstract 判断本机的版本是否为v版本.
 **/
static inline BOOL SYSTEM_VERSION_GETATER_THAN_OR_EQUAL_TO(double v)
{
    return __IPHONE_OS_VERSION_MIN_REQUIRED >= v;
}
/**
 @abstract 判断本机的版本是否为v版本.
 **/
static inline BOOL SYSTEM_VERSION_LESS_THAN(double v)
{
    return __IPHONE_OS_VERSION_MAX_ALLOWED < v;
}
/**
 @abstract 判断本机的版本是否为v版本.
 **/
static inline BOOL SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(double v)
{
    return __IPHONE_OS_VERSION_MAX_ALLOWED <= v;
}
/**
 @abstract 根据name来获取图片.
 **/
static inline UIImage *UIIMAGE_FROM_NAME(NSString *name)
{
    return [UIImage imageNamed:name];
}
/**
 @abstract 根据path和type来获取图片.
 @param path 需要查找的文件路径.
 @param type 需要查找的文件类型.(PNG,JPG)
 **/
static inline UIImage *UIIMAGE_FROM_PATH_AND_TYPE(NSString *path,NSString *type)
{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:path ofType:type]];
}
/**
 @abstract 结束HUD动画,延迟一秒消失,显示Title.
 @param needlock 是否需要锁屏
 @param title 为HUD的显示给用户的描述内容.
 **/
static inline void HIDE_PROGRESS_HUD_WITH_ERROR_NEEDLOCK(NSString *title,BOOL needLock)
{
    [(AppWindow *)[[[UIApplication sharedApplication] delegate] window] hideProgressHUDWithTitle:title NeedLock:needLock Success:NO];
}
/**
 @abstract 结束HUD动画,立即结束.
 @param needlock 是否需要锁屏
 **/
static inline void HIDE_PROGRESS_HUD_WITH_NEEDLOCK(BOOL needLock)
{
    [(AppWindow *)[[[UIApplication sharedApplication] delegate] window] hideProgressHUDWithTitle:@"" NeedLock:needLock Success:YES];
}
/**
 @abstract 开始HUD动画.
 @param needlock 是否需要锁屏.
 @param title 为HUD的显示给用户的描述内容.
 **/
static inline void SHOW_PROGRESS_HUD_WITH_TITLE_NEEDLOCK(NSString *title,BOOL needLock)
{
    [(AppWindow *)[[[UIApplication sharedApplication] delegate] window] showProgressHUDWithTitle:title NeedLock:needLock];
}
/**
 @abstract 根据title来显示WarningHUD.
 @param needlock 是否需要锁屏.
 **/
static inline void SHOW_WARNING_PROGRESS_HUD_WITH_TITLE(NSString *title)
{
    [(AppWindow *)[[[UIApplication sharedApplication] delegate] window] showWarningProgressHUDWithTitle:title];
}
/**
 @abstract 获取object所有的子类.
 **/
static inline NSArray* GET_ALL_SUBCLASS_OF_OBJECT(id object){
    Class myClass = [object class];
    NSMutableArray *mySubclasses = [NSMutableArray array];
    
    unsigned int numOfClasses;
    Class *classes = objc_copyClassList(&numOfClasses);
    for (unsigned int ci = 0; ci < numOfClasses; ci++) {
        Class superClass = classes[ci];
        do {
            superClass = class_getSuperclass(superClass);
        } while (superClass && superClass != myClass);
        
        if (superClass)
            [mySubclasses addObject: classes[ci]];
    }
    free(classes);
    return mySubclasses;
}
/**
 @abstract 根据animation来控制statusbar的消失动画.
 **/
static inline void HIDE_STATUS_BAR_WITH_ANIMATION(UIStatusBarAnimation animation)
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:animation];
}
/**
 @abstract 根据animation来控制statusbar的显示动画.
 **/
static inline void SHOW_STATUS_BAR_WITH_ANIMATION(UIStatusBarAnimation animation)
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:animation];
}
/**
 @abstract 隐藏navigationController的navigationBar.
 **/
static inline void HIDE_NAVIGATION_BAR_OF_NAVIGATION_CONTROLLER(UINavigationController *navigationController)
{
    [navigationController setNavigationBarHidden:YES animated:YES];
}
/**
 @abstract 显示navigationController的navigationBar.
 **/
static inline void SHOW_NAVIGATION_BAR_OF_NAVIGATION_CONTROLLER(UINavigationController *navigationController)
{
    [navigationController setNavigationBarHidden:NO animated:YES];
}
/**
 @abstract 根据storyboardName来获取对应的storyboard.
 **/
static inline UIStoryboard* GET_STORYBOARD_BY_NAME(NSString *storyboardName)
{
    return [UIStoryboard storyboardWithName:storyboardName bundle:nil];
}
/**
 @abstract 初始化在main storyboard上的viewController.
 **/
static inline UIViewController* INIT_CONTROLLER_FROM_MAIN_STORYBOARD(NSString *controllerName)
{
    UIStoryboard *storyboard = GET_STORYBOARD_BY_NAME(@"main");
    return [storyboard instantiateViewControllerWithIdentifier:controllerName];
}
/**
 @abstract 淡入淡出的界面切换效果,但是不能采用原生的动画效果.
 **/
static inline void SET_VIEW_CONTROLLER_FADE_EFFECT_ANIMATION()
{
    CATransition *animation = [CATransition animation];
    animation.duration = 1.0;
    animation.type = kCATransitionFade;
    [[(AppWindow *)[[[UIApplication sharedApplication] delegate] window] layer] addAnimation:animation forKey:nil];
}
/**
 @abstract 推出一个底层透明的ViewController.
 **/
static inline void SET_VIEW_CONTROLLER_TRANSLUCENT_STYLE(UIViewController *fromVC,UIViewController *toVC)
{
    if(SYSTEM_VERSION_GETATER_THAN_OR_EQUAL_TO(8))
    {
        toVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    } else {
        fromVC.modalPresentationStyle = UIModalPresentationCurrentContext;
        fromVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    }
}

#endif

