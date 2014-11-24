/*
 * Copyright (c) 2011-2014 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2

Page {
    id: mainPage
    
    property int deviceWidth
    property int deviceHeight
    property int speed: 3000
    property bool animationRunning: false

    onAnimationRunningChanged: {
        if (!animationRunning) {
            startNewAnimation()
        }
    }
    
    function startNewAnimation() {
        thisTranslation.toX = Math.random() * deviceWidth
        thisTranslation.toY = Math.random() * deviceHeight
        
        thisScale.toX = (Math.random() * 1.5) + 0.5
        thisScale.toY = thisScale.toX
        
        thisAnimation.play()
    }
    
    onCreationCompleted: {
        startNewAnimation()
    }
    
    Container {
        layout: DockLayout {}
        background: Color.LightGray
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        
        DeviceWidthAndHeightSelector {
            // This is used to get screen width and height on app startup
            // It uses Cascades' asset selector
        }
        
        FlyImage {
            id: flyImageAlive

            maxHeight: 100
            maxWidth: maxHeight
                        
            translationX: Math.random() * deviceWidth 
            translationY: deviceHeight + 100
            
            animations: [
                ParallelAnimation {
                    id: thisAnimation
                    
                    onStarted: animationRunning = true
                    onEnded: animationRunning = false
                    
                    TranslateTransition {
                        id: thisTranslation
                        duration: speed
                        easingCurve: StockCurve.Linear
                    }
                    
                    ScaleTransition {
                        id: thisScale
                        duration: speed
                    }
                }
            ]
        }
    }
}
