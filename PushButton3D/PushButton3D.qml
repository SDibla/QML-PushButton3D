import QtQuick 2.4
import QtQuick.Controls 2.2

Rectangle{
    id:hole
    width: 160
    height: 160
    color: "black"
    radius: 31
    property alias keyAnimation: keyAnimation
    //property alias imgSource: img.source

    Rectangle{
        id:back
        width: hole.width - 10
        height: hole.height - 10
        color: "#191d19"
        radius: hole.radius
        anchors.horizontalCenter: hole.horizontalCenter
        anchors.verticalCenter: hole.verticalCenter
    }

    Rectangle{
        id:front
        y: back.y - 10
        width: hole.width - 10
        height: hole.width - 10
        color: "#303430"
        radius: hole.radius
        anchors.horizontalCenter: hole.horizontalCenter
    }

    /*Image {
        id: img
        source: "Img/up.png"
        width: front.width - 50
        height: front.height - 50
        anchors.horizontalCenter: front.horizontalCenter
        anchors.verticalCenter: front.verticalCenter
    }*/
    
    MouseArea{
        id: area
        anchors.fill: front
        
        onPressed:{
            keyAnimation.start()
        }
        onReleased:{
            keyAnimation.start()
        }
    }

    ParallelAnimation{
        id: keyAnimation

        PropertyAnimation{
            target: front
            properties: "y"
            from: front.y
            to: ((front.y == back.y -10) ? back.y - 5 : back.y - 10)
            duration: 50
        }

        PropertyAnimation{
            target: front
            properties: "color"
            from: (front.color == "#303430") ? "#303430" : "#252825"
            to: (front.color == "#303430") ? "#252825" : "#303430"
            duration: 50
        }
    }

}