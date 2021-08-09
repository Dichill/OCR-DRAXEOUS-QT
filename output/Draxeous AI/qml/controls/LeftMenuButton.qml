import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Button {
    id: bttnLeftMenu
    text: qsTr("Left Menu Button")

    // Custom Properties
    property url bttnIconSource: "../../images/svg_images/home_icon.svg"
    property color bttnColorDefault: "#1e202c"
    property color bttnColorMouseOver: "#1C1E2B"
    property color bttnColorClicked: "#191B2B"

    property int iconWidth: 18
    property int iconHeight: 18

    property color activeMenuColor: "#292b37"
    property color activeMenuColorRight: "#292b37"
    property bool isActiveMenu: false

    QtObject {
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(bttnLeftMenu.down) {
                                       bttnLeftMenu.down ? bttnColorClicked : bttnColorDefault
                                   } else {
                                       bttnLeftMenu.hovered ? bttnColorMouseOver : bttnColorDefault
                                   }
    }

    implicitWidth: 250
    implicitHeight: 60

    background: Rectangle {
        id: bgBttn
        color: internal.dynamicColor

        Rectangle {
            anchors {
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            color: activeMenuColor
            width: 3
            visible: isActiveMenu
        }

        Rectangle {
            anchors {
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
            width: 5
            visible: isActiveMenu
            color: "#1e202c"
        }
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
            text: bttnLeftMenu.text
            font: bttnLeftMenu.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.5}
}
##^##*/
