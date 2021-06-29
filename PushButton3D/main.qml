import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 800
    height: 480
    color: "#ffcc8e"
    visibility: "FullScreen"

    Rectangle{
        id:hole
        width: 310
        height: 214
        color: "black"
        radius: 31
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Rectangle{
        id:back
        width: 300
        height: 200
        color: "#046102"
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
            front.background.color = "#007900"
            animatePress.start()
        }
        onReleased: {
            animateRelease.start()
            front.background.color = "#008000"
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
