import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import "../controls"

Item {
    width: 1000
    height: 580

    // Custom Properties
    property string alertText: "Short Message"
    property string errorTitleText: "WARNING!"

    property url iconSource: "../../images/svg_images/open_icon.svg"

    Rectangle {
        id: bg
        opacity: 0.5
        color: "#000000"
        anchors.fill: parent
    }

    Rectangle {
        id: popupBg
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: 410
        height: 230
        color: "#292b37"
        radius: 25

        Rectangle {
            id: topbar
            height: 30
            color: "#1c1e28"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            Text {
                id: text1
                color: "#ffffff"
                text: qsTr("Draxeous AI")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.family: "Verdana"
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 5
            }
        }

        Row {
            id: row
            x: 153
            y: 160
            width: 241
            height: 67
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 3
            anchors.rightMargin: 15

            FlatButton {
                id: okpromptBttn
                width: 115
                height: 45
                text: "Okay"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 0
                bttnColorMouseOver: "#2ecc71"
                bttnColorClicked: "#2ecc71"
                bttnColorDefault: "#2ecc71"
            }

            FlatButton {
                id: nvmpromptBttn
                width: 115
                height: 45
                text: "Nevermind"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: okpromptBttn.left
                anchors.rightMargin: 10
                bttnColorClicked: "#E74C3C"
                bttnColorMouseOver: "#E74C3C"
                bttnColorDefault: "#E74C3C"
            }
        }

        Text {
            id: messageTxt
            color: "#ffffff"
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis feugiat purus, vitae porttitor justo. Donec vitae nibh ex. Etiam pretium libero nec nisi aliquet, sit amet vulputate est consectetur. Mauris vitae leo id enim commodo lacinia. Cras tincidunt est quis ligula placerat congue. Sed tempus interdum nulla ac placerat."
            anchors.left: image.right
            anchors.right: parent.right
            anchors.top: topbar.bottom
            anchors.bottom: row.top
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            wrapMode: Text.WrapAnywhere
            minimumPixelSize: 10
            anchors.rightMargin: 15
            font.family: "Verdana"
            anchors.leftMargin: 23
            anchors.topMargin: 33
            anchors.bottomMargin: 1
        }

        Image {
            id: image
            height: 50
            width: 50
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../../images/png_images/warning_icon.png"
            anchors.bottomMargin: 75
            anchors.topMargin: 55
            anchors.leftMargin: 20
            fillMode: Image.PreserveAspectFit
            antialiasing: true
        }

        Text {
            id: errortype
            width: 300
            color: "#ffffff"
            text: errorTitleText
            anchors.left: parent.left
            anchors.top: topbar.bottom
            anchors.bottom: messageTxt.top
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 90
            font.bold: true
            font.family: "Verdana"
            anchors.bottomMargin: -5
            anchors.topMargin: 6
        }
    }
}





/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:4}D{i:10}
}
##^##*/
