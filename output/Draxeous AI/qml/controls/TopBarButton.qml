import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Button {
    id: bttnTopBar

    // Custom Properties
    property url bttnIconSource: "../../images/svg_images/minimize_icon.svg"
    property color bttnColorDefault: "#1e202c"
    property color bttnColorMouseOver: "#1C1E2B"
    property color bttnColorClicked: "#191B2B"

    QtObject {
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(bttnTopBar.down) {
                                       bttnTopBar.down ? bttnColorClicked : bttnColorDefault
                                   } else {
                                       bttnTopBar.hovered ? bttnColorMouseOver : bttnColorDefault
                                   }
    }

    width: 35
    height: 35

    background: Rectangle {
        id: bgBttn
        color: internal.dynamicColor

        Image {
            id: iconBttn
            source: bttnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            width: 16
            visible: false
            fillMode: Image.PreserveAspectFit
            antialiasing: false
        }

        ColorOverlay {
            anchors.fill: iconBttn
            source: iconBttn
            color: "#ffffff"
            antialiasing: false
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}
}
##^##*/
