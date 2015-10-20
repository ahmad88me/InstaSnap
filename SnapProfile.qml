import QtQuick 2.0

Rectangle {
    width: 400
    height: 600
    color: "black"

    property int i: 0

    Image{
        id: snap_profile_logo
        width: parent.width/2
        height: width
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height/6
        z: 1
        source: "images/snap.png"
    }

    Image{
        id: snap_profile_image
        width: snap_profile_logo.width * 0.7
        height: snap_profile_logo.height * 0.7
        anchors.horizontalCenter: snap_profile_logo.horizontalCenter
        anchors.verticalCenter: snap_profile_logo.verticalCenter
    }

    Timer{
        id: snap_profile_timer
        running: false
        repeat: true
        interval: 1000
        onTriggered: {
            snap_profile_image.source = "file://"+main.snap_images[i]
            i = i+1
            i = i % 5
        }
    }
    onVisibleChanged: {
        if(visible){
            snap_profile_timer.start()
        }
    }

}

