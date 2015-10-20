import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtMultimedia 5.4

Rectangle {
    width: 400
    height: 600

    property int snap_camera_passed_time: 0
    //property var image: []

    Camera{
        id: camera
        captureMode: Camera.CaptureStillImage
        imageCapture {
            onImageCaptured: {

            }
            onImageSaved: {
                main.snap_images.push(camera.imageCapture.capturedImagePath)
                console.debug(camera.imageCapture.capturedImagePath)
            }
        }


    }

    VideoOutput {
        source: camera
        anchors.fill: parent
        focus : visible
    }

    Text{
        id: snap_camera_text
        text: ""
        font.bold: true
        font.pointSize: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Timer{
        id: snap_camera_timer
        running: false
        repeat: true
        interval: 1000
        onTriggered: {
            if(snap_camera_passed_time<5){
                snap_camera_passed_time+=1
                snap_camera_text.text = snap_camera_passed_time
                camera.imageCapture.capture()
            }
            else{
                snap_camera_timer.stop()
                snap_profile_page.visible=true
                snap_camera_page.visible=false
            }
        }
    }

    Button{
        width: parent.width * 0.7
        text: "Capture"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            snap_camera_timer.start()
            visible=false
        }
    }

}

