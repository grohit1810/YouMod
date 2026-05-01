#import "Headers.h"

// Enables shorts quality - works best with YTClassicVideoQuality
%hook YTHotConfig
- (BOOL)enableOmitAdvancedMenuInShortsVideoQualityPicker { return IS_ENABLED(EnablesShortsQuality) ? YES : %orig; }
- (BOOL)enableShortsVideoQualityPicker { return IS_ENABLED(EnablesShortsQuality) ? YES : %orig; }
- (BOOL)iosEnableImmersiveLivePlayerVideoQuality { return IS_ENABLED(EnablesShortsQuality) ? YES : %orig; }
- (BOOL)iosEnableShortsPlayerVideoQuality { return IS_ENABLED(EnablesShortsQuality) ? YES : %orig; }
- (BOOL)iosEnableShortsPlayerVideoQualityRestartVideo { return IS_ENABLED(EnablesShortsQuality) ? YES : %orig; }
- (BOOL)iosEnableSimplerTitleInShortsVideoQualityPicker { return IS_ENABLED(EnablesShortsQuality) ? YES : %orig; }
%end

// Always show Shorts seekbar
%hook YTShortsPlayerViewController
- (BOOL)shouldAlwaysEnablePlayerBar { return IS_ENABLED(ShowShortsSeekbar) ? YES : %orig; }
- (BOOL)shouldEnablePlayerBarOnlyOnPause { return IS_ENABLED(ShowShortsSeekbar) ? NO : %orig; }
%end

%hook YTReelPlayerViewController
- (BOOL)shouldAlwaysEnablePlayerBar { return IS_ENABLED(ShowShortsSeekbar) ? YES : %orig; }
- (BOOL)shouldEnablePlayerBarOnlyOnPause { return IS_ENABLED(ShowShortsSeekbar) ? NO : %orig; }
%end

%hook YTReelPlayerViewControllerSub
- (BOOL)shouldAlwaysEnablePlayerBar { return IS_ENABLED(ShowShortsSeekbar) ? YES : %orig; }
- (BOOL)shouldEnablePlayerBarOnlyOnPause { return IS_ENABLED(ShowShortsSeekbar) ? NO : %orig; }
%end

%hook YTColdConfig
- (BOOL)iosEnableVideoPlayerScrubber { return IS_ENABLED(ShowShortsSeekbar) ? YES : %orig; }
- (BOOL)mobileShortsTablnlinedExpandWatchOnDismiss { return IS_ENABLED(ShowShortsSeekbar) ? YES : %orig; }
%end

%hook YTHotConfig
- (BOOL)enablePlayerBarForVerticalVideoWhenControlsHiddenInFullscreen { return IS_ENABLED(ShowShortsSeekbar) ? YES : %orig; }
%end

%hook YTReelPlayerButton
- (void)layoutSubviews {
    %orig;
    for (UIView *view in view.subviews) {
        if (IS_ENABLED(HideShortsLikeButton) && [view.accessibilityIdentifier isEqualToString:@"id.reel_like_button"]) view.hidden = YES;
        if (IS_ENABLED(HideShortsDisLikeButton) && [view.accessibilityIdentifier isEqualToString:@"id.reel_dislike_button"]) view.hidden = YES;
        if (IS_ENABLED(HideShortsCommentButton) && [view.accessibilityIdentifier isEqualToString:@"id.reel_comment_button"]) view.hidden = YES;
        if (IS_ENABLED(HideShortsShareButton) && [view.accessibilityIdentifier isEqualToString:@"id.reel_share_button"]) view.hidden = YES;
        if (IS_ENABLED(HideShortsRemixButton) && [view.accessibilityIdentifier isEqualToString:@"id.reel_remix_button"]) view.hidden = YES;
        if (IS_ENABLED(HideShortsMetaButton) && [view.accessibilityIdentifier isEqualToString:@"id.reel_pivot_button"]) view.hidden = YES;
    }
}
%end