import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Button {
    id: bttnToggle

    // Custom Properties
    property url bttnIconSource: "../../images/svg_images/menu_icon.svg"
    property color bttnColorDefault: "#1e202c"
    property color bttnColorMouseOver: "#1C1E2B"
    property color bttnColorClicked: "#191B2B"

    QtObject {
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(bttnToggle.down) {
                                       bttnToggle.down ? bttnColorClicked : bttnColorDefault
                                   } else {
                                       bttnToggle.hovered ? bttnColorMouseOver : bttnColorDefault
                                   }
    }

    implicitWidth: 70
    implicitHeight: 60

    background: Rectangle {
        id: bgBttn
        color: internal.dynamicColor

        Image {
            id: iconBttn
            source: "../../images/svg_images/menu_icon.svg"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 25
            width: 25
            fillMode: Image.PreserveAspectFit
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
    D{i:0;formeditorZoom:2}
}
##^##*/
