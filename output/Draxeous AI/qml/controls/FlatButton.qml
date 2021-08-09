import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Button {
    id: flatBttn
    text: qsTr("Custom Button")

    // Custom Properties   
    property color bttnColorDefault: "#1e202c"
    property color bttnColorMouseOver: "#1C1E2B"
    property color bttnColorClicked: "#191B2B"

    QtObject {
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(flatBttn.down) {
                                       flatBttn.down ? bttnColorClicked : bttnColorDefault
                                   } else {
                                       flatBttn.hovered ? bttnColorMouseOver : bttnColorDefault
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

        Text{
            color: "#ffffff"
            text: flatBttn.text
            font: flatBttn.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.25;height:60;width:200}
}
##^##*/
