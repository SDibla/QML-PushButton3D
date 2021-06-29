import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 800
    height: 480
    color: "black"
    visibility: "FullScreen"

    Rectangle{
        id:back
        width: 300
        height: 200
        color: "#555353"
        radius: 31
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Button{
        id:front
        y: back.y - 20
        width: back.width
        height: back.height

        anchors.horizontalCenter: back.horizontalCenter

        background: Rectangle {
            anchors.fill: front
            color: "#008000"
            radius: back.radius

            Text {
                id: text
                font.family: "Arial Black"
                font.pointSize: 25
                font.bold: true
                text: qsTr("Press Me")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        onPressed: {
            front.background.color = "#046102"
            animatePress.start()
            back.color = "#424141"
        }
        onReleased: {
            animateRelease.start()
            front.background.color = "#008000"
            back.color = "#555353"
        }

        PropertyAnimation{
            id: animatePress
            target: front
            properties: "y"
            from: back.y - 20
            to: back.y - 5
            duration: 70
        }

        PropertyAnimation{
            id: animateRelease
            target: front
            properties: "y"
            from: back.y - 5
            to: back.y - 20
            duration: 70
        }
    }
}
