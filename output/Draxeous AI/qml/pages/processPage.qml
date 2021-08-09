import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import "../controls"

Item {
    width: 903
    height: 481

    property StackView pageView: StackView.view

    property url getSource: imageSource.source
    property url setSource: "../../images/svg_images/picture_icon.png"

    property string outputText: "Test"

    Rectangle {
        id: bg
        color: "#292b37"
        anchors.fill: parent

        Row {
            id: row
            height: 385
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            spacing: 20
            anchors.topMargin: 15
            anchors.rightMargin: 20
            anchors.leftMargin: 20

            Rectangle {
                id: imageHolder
                color: "#1c1e28"
                radius: 10
                anchors.fill: parent
                Image {
                    id: imageSource
                    anchors.fill: parent
                    source: setSource
                    layer.smooth: true
                    antialiasing: true
                    fillMode: Image.PreserveAspectFit
                }
            }
        }

        Row {
            id: settingsRow
            width: 450
            anchors.left: parent.left
            anchors.top: row.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 19
            anchors.topMargin: 17
            anchors.leftMargin: 20
        }

        Row {
            id: buttonsRow
            x: 433
            width: 450
            anchors.right: parent.right
            anchors.top: row.bottom
            anchors.bottom: parent.bottom
            anchors.rightMargin: 20
            anchors.topMargin: 12
            anchors.bottomMargin: 14

            FlatButton {
                id: startBttn
                width: 125
                height: 50
                text: "Start"
                anchors.right: parent.right
                font.pointSize: 11
                font.family: "Verdana"
                bttnColorClicked: "#4dec72"
                bttnColorMouseOver: "#3ebe5c"
                bttnColorDefault: "#48dc6b"
                anchors.rightMargin: 0

                onClicked: {
                    pageView.push("savePage.qml", {"outputText": outputText});
                }
            }

            FlatButton {
                id: cancelBttn
                width: 125
                height: 50
                text: "Cancel"
                anchors.right: startBttn.left
                anchors.rightMargin: 10
                bttnColorClicked: "#ff6741"
                bttnColorDefault: "#ff5534"
                font.pointSize: 11
                bttnColorMouseOver: "#cb4229"
                font.family: "Verdana"

                onClicked: {
                    pageView.push("homePage.qml")
                }
            }

            FlatButton {
                id: editBttn
                width: 125
                height: 50
                text: "Edit"
                anchors.right: cancelBttn.left
                bttnColorClicked: "#30ccfc"
                bttnColorDefault: "#2cbae7"
                font.pointSize: 11
                bttnColorMouseOver: "#27a4ca"
                font.family: "Verdana"
                anchors.rightMargin: 10
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:3}D{i:5}D{i:10}D{i:11}D{i:8}
}
##^##*/
