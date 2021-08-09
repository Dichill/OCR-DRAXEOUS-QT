import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Item {
    id: customtField

    // Custom Properties
    property url bttnIconSource: "../../images/svg_images/open_icon.svg"
    property color placeHolderColor: "#FFFFFF"

    property int iconWidth: 18
    property int iconHeight: 18

    property string fieldHolderText: "Output Path"
    property string fieldText: "Path"

    property bool withIcon: true
    width: 800

    implicitWidth: 800
    implicitHeight: 50

    Rectangle {
        id: bgTextField
        anchors.fill: customtField
        color: "#1e202c"
        radius: 0

        Rectangle {
            id: designLeftField
            anchors {
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            width: 6
            color: "#1f212a"
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
        }

        Image {
            id: iconBttn
            anchors.left: designLeftField.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: bttnIconSource
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 10
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            width: if (withIcon == true) return iconWidth; else return 0
            height: if (withIcon == true) return iconHeight; else return 0
            fillMode: Image.PreserveAspectFit
        }

        ColorOverlay {
            anchors.fill: iconBttn
            source: iconBttn
            color: "#FFFFFF"
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            width: if (withIcon == true) return iconWidth; else return 0
            height: if (withIcon == true) return iconHeight; else return 0
        }

        Label {
            color: "#ffffff"
            text: fieldHolderText
            anchors.left: iconBttn.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 8
            font.family: "Verdana"
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: if (withIcon == true) return 10; else return 0

        }

        TextField {
            id: textField
            anchors.fill: parent
            anchors.rightMargin: 63
            anchors.leftMargin: 135
            placeholderText: "Select a Path"
            text: fieldText
        }
    }
}




/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:6}D{i:7}
}
##^##*/
