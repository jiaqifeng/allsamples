import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.3
import QtLocation 5.14
import QtPositioning 5.6
import Style 1.0
import "../Component"

Pane{
    id:info
    property color infoColor: "#00CC99"
    property string icon: "qrc:/Icons/Notification/Success.svg"
    property string title:  qsTr("Success")
    property string subTitle: qsTr("Order Placed Successfully. Thank you for shopping with us.")
    padding: 0
    width: 650
    height: 130
    background: Rectangle{
        anchors.fill: parent
        color : Style.isDark ? palette.dark : palette.light
        radius: 15

        Rectangle{
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            height: 130
            width: 10
            radius: 10
            color: info.infoColor
        }
    }

    contentItem: Item{
        anchors.fill: parent
        Rectangle{
            id:notifIcon
            width: 70
            height: width
            radius: height /2
            color: info.infoColor

            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 33.5

            Image{
                anchors.centerIn: parent
                source: info.icon
                sourceSize: Qt.size(notifIcon.width * 0.6,notifIcon.width * 0.6)
            }
        }
        ColumnLayout{
            width: info.width *0.8
            spacing: 10
            anchors.left: notifIcon.right
            anchors.leftMargin: 23.5
            anchors.verticalCenter: parent.verticalCenter
            PrefsLabel{
                isStyle: true
                text: info.title
            }
            PrefsLabel{
                Layout.maximumWidth: parent.width
                font.pixelSize: Style.h5
                isStyle: true
                text: info.subTitle
            }
        }
    }
}

