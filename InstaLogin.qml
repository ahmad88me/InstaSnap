import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

Rectangle {
    width: 400
    height: 600

    TextField{
        id: instalogin_username
        placeholderText: "Username"
        width: parent.width *0.7
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField{
        id: instalogin_password
        width: instalogin_username.width
        placeholderText: "Password"
        echoMode: TextInput.Password
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: instalogin_username.bottom
        anchors.topMargin: 20
    }

    Button{
        id: instalogin_submit
        width: instalogin_username.width
        anchors.top: instalogin_password.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Login"
        onClicked: {
            //username = 'qt'
            //password = 'qttest'
            instalogin_network.addParam("username", instalogin_username.text)
            instalogin_network.addParam("password", instalogin_password.text)
            instalogin_network.sendPostRequest(main.host+"login")
        }
    }

    Text{
        id: instalogin_msg
        width: instalogin_username.width
        anchors.bottom: instalogin_username.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Network{
        id: instalogin_network
        anchors.fill: parent
        onNetworkReply: {
            var j = JSON.parse(network_reply_string);
            if(j["status"]==true){
                instalogin_msg.color = "#66FF66"
                instalogin_msg.text = j["msg"]
            }
            else{
                instalogin_msg.color = "#FF4444"
                instalogin_msg.text = j["error"]
            }
        }
    }


}

