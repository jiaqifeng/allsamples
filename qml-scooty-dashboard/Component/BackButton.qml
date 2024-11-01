import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.3
import Style 1.0
Button{
    id:control
    contentItem:PrefsLabel{
        text: control.text
    }

    background: Rectangle{
        anchors.fill: parent
        color: "transparent"
    }
}
