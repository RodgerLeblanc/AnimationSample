// main.qml
import bb.cascades 1.0

Page {
    id: mainPage
    
    property int deviceWidth
    property int deviceHeight
    property int speed: 3000
    
    onCreationCompleted: {
        // Starts the animation when the app launch
        thisAnimation.play()
    }
    
    content: Container {
        layout: DockLayout {}
        background: Color.LightGray
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        
        // This is used to get screen size using asset selector
        DeviceWidthAndHeightSelector {}
        
        FlyImage {
            id: flyImageAlive
            
            maxHeight: 100
            maxWidth: maxHeight
            
            // Starts at the bottom of the screen                        
            translationX: Math.random() * deviceWidth 
            translationY: deviceHeight + 100
            
            animations: [
                ParallelAnimation {
                    id: thisAnimation
                    
                    onEnded: {
                        // This is what happens when one animation cycle is done
                        
                        // Recalculate new translation points
                        thisTranslation.toX = Math.random() * deviceWidth
                        thisTranslation.toY = Math.random() * deviceHeight
                        
                        // Recalculate new scale transition value
                        thisScale.toX = (Math.random() * 1.5) + 0.5
                        thisScale.toY = thisScale.toX
                        
                        // Restart the animation with the new values
                        thisAnimation.play()
                    }
                    
                    TranslateTransition {
                        // Move the fly toX and toY values
                        id: thisTranslation
                        duration: speed
                        easingCurve: StockCurve.Linear
                        toX: Math.random() * deviceWidth
                        toY: Math.random() * deviceHeight
                    }
                    
                    ScaleTransition {
                        // Rescale the fly randomly
                        id: thisScale
                        duration: speed
                        toX: (Math.random() * 1.5) + 0.5
                        toY: toX
                    }
                }
            ]
        }
    }
}