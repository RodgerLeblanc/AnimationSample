// FlyImage.qml
import bb.cascades 1.0

Container {
    id: flyContainer
    layout: DockLayout {}
    property int angleForWingsFlapping: 20

    maxHeight: 100
    maxWidth: maxHeight
    
    ImageView {
        imageSource: "asset:///images/fly_wings.png"
        onCreationCompleted: {
            wingsFlappingAnimation.play()
        }
        animations: [
            SequentialAnimation {
                id: wingsFlappingAnimation
                repeatCount: AnimationRepeatCount.Forever
                RotateTransition {
                    // Rotate wings clockwise slightly
                    toAngleZ: angleForWingsFlapping
                    duration: 2
                }
                RotateTransition {
                    // Rotate wings counterclockwise slightly
                    toAngleZ: 0 - angleForWingsFlapping
                    duration: 2
                }
            }
        ]
    }
    
    ImageView {
        id: flyBodyImage
        imageSource: "asset:///images/fly_body.png"
    }
}
