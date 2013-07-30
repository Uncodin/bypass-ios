//
//  BPMarkdownPageView.h
//  Bypass
//
//  Created by Damian Carrillo on 3/13/13.
//  Copyright 2013 Uncodin, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <CoreText/CoreText.h>
#import <UIKit/UIKit.h>

@class BPDocument;

@protocol BPMarkdownPageViewLinkDelegate;

@interface BPMarkdownPageView : UIView
@property (weak, nonatomic) id<BPMarkdownPageViewLinkDelegate> linkDelegate;

- (id)initWithFrame:(CGRect)frame textFrame:(CTFrameRef)textFrame;

@end

@protocol BPMarkdownPageViewLinkDelegate <NSObject>
@required

- (void)markdownPageView:(BPMarkdownPageView *)markdownPageView
       didHaveLinkTapped:(NSString *)link;

@end