import QtQuick 2.14
import QtQuick.Controls 2.14
import Style 1.0
Page {
    padding:0
    background: Rectangle{
        anchors.fill: parent
        color: Style.background
    }

    property var gEagleStack: StackView.view
}
