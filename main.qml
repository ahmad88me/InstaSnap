import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    title: qsTr("Hello World")
    width: 400
    height: 600
    visible: true
    id: main

    property var snap_images: []
    property string host: "http://54.88.191.135/qttraining/"


    SnapCamera{
        id: snap_camera_page
        anchors.fill: parent
        visible: false
    }

    SnapProfile{
        id: snap_profile_page
        anchors.fill: parent
        visible: false
    }

    InstaLogin{
        id: instalogin_page
        anchors.fill: parent
        visible: false
    }

    Rectangle{
        width: parent.width
        height: parent.height

        Image{
            id: main_snap
            y: parent.height*1/5
            anchors.horizontalCenter: parent.horizontalCenter
            source: "images/snap.png"
            width: parent.height/4
            height: width
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    snap_camera_page.visible=true
                    parent.parent.visible=false
                }
            }
        }

        Image{
            id: main_insta
            y: parent.height*3/5
            anchors.horizontalCenter: parent.horizontalCenter
            source: "images/insta.png"
            width: parent.height/4
            height: width
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    instalogin_page.visible=true
                    parent.parent.visible=false
                }
            }
        }

    }

}
