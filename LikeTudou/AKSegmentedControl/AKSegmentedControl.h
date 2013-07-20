
// THE SOFTWARE.

#import <UIKit/UIKit.h>

@class AKSegmentedControl;

typedef enum : NSUInteger
{
    AKSegmentedControlModeSticky,
    AKSegmentedControlModeButton
} AKSegmentedControlMode;

@protocol AKSegmentedControlDelegate <NSObject>

@optional
- (void)segmentedViewController:(AKSegmentedControl *)segmentedControl touchedAtIndex:(NSUInteger)index;

@end

@interface AKSegmentedControl : UIView

@property (nonatomic, assign) id<AKSegmentedControlDelegate> delegate;

/**
 */
@property (nonatomic, strong) NSArray *buttonsArray;

/**
 */
@property (nonatomic, strong) UIImage *backgroundImage;

/**
 */
@property (nonatomic, strong) UIImage *separatorImage;

/**
 */
@property (nonatomic, assign) UIEdgeInsets contentEdgeInsets;

/**
 */
@property (nonatomic, assign) NSInteger selectedIndex;

/**
 */
@property (nonatomic, assign) AKSegmentedControlMode segmentedControlMode;

@end
