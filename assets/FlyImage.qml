import bb.cascades 1.2

Container {
    id: flyContainer
    layout: DockLayout {}
    property int angleForWingsFlapping: 20
        
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
                    toAngleZ: angleForWingsFlapping
                    duration: 2
                }
                RotateTransition {
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
