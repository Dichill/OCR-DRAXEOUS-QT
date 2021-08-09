import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Button {
    id: customBttn
    text: qsTr("Custom Button")

    // Custom Properties
    property url bttnIconSource: "../../images/svg_images/home_icon.svg"
    property color bttnColorDefault: "#1e202c"
    property color bttnColorMouseOver: "#1C1E2B"
    property color bttnColorClicked: "#191B2B"

    property int iconWidth: 18
    property int iconHeight: 18

    QtObject {
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(customBttn.down) {
                                       customBttn.down ? bttnColorClicked : bttnColorDefault
                                   } else {
                                       customBttn.hovered ? bttnColorMouseOver : bttnColorDefault
                                   }
    }

    width: 200
    height: 60

    background: Rectangle {
        id: bgBttn
        color: internal.dynamicColor
        radius: 10
        border.width: 0

    }

    contentItem: Item {
        id: content
        anchors.fill: parent

        Image {
            id: iconBttn
            source: bttnIconSource
            anchors.leftMargin: 26
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            width: iconWidth
            height: iconHeight
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: true
        }

        ColorOverlay{
            anchors.fill: iconBttn
            source: iconBttn
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            width: iconWidth
            height: iconHeight
        }

        Text{
            color: "#ffffff"
            text: customBttn.text
            font: customBttn.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.25;height:60;width:200}
}
##^##*/
