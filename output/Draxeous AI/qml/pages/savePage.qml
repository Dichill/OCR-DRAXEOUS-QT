import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"

Item {
    width: 903
    height: 481

    property string outputText: ""

    Rectangle {
        id: bg
        color: "#292b37"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Rectangle {
            id: textHandler
            width: 540
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 25
            anchors.topMargin: 25
            anchors.leftMargin: 25
            color: "#1c1e28"

            Flickable {
                id: flick
                anchors.fill: parent
                clip: true

                TextArea.flickable: TextArea {
                    id: textArea
                    padding: 10
                    wrapMode: Text.WordWrap
                    placeholderTextColor: "#f6fbff"
                    textFormat: Text.AutoText
                    selectByMouse: true
                    selectedTextColor: "#ff007f"
                    selectionColor: "#ffffff"
                    color: "#FFFFFF"
                    font.pointSize: 12
                    text: outputText
                }
                ScrollBar.vertical: ScrollBar{}
                ScrollBar.horizontal: ScrollBar {}
            }
        }

        Column {
            id: options
            anchors.left: imageHolder.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            spacing: 10
            anchors.bottomMargin: 171
            anchors.topMargin: 31
            anchors.rightMargin: 16
            anchors.leftMargin: 19

            CustomButton {
                id: pdfBttn
                width: 300
                height: 60
                text: "Save as PDF"
                iconWidth: 20
                iconHeight: 20
                bttnColorMouseOver: "#ab372c"
                bttnColorClicked: "#fc5141"
                bttnIconSource: "../../images/svg_images/pdf_icon.svg"
                bttnColorDefault: "#e74c3c"
                font.pointSize: 10
                font.family: "Verdana"
            }

            CustomButton {
                id: docxBttn
                width: 300
                height: 60
                text: "Save as DOCX"
                iconWidth: 20
                iconHeight: 20
                bttnColorMouseOver: "#2b7db3"
                bttnColorClicked: "#3aa8f1"
                bttnIconSource: "../../images/svg_images/docx_icon.png"
                font.pointSize: 10
                font.family: "Verdana"
                bttnColorDefault: "#3498db"
            }

            CustomButton {
                id: openLocationBttn
                width: 300
                height: 60
                text: "Open Location"
                bttnColorClicked: "#1fdfb9"
                bttnColorMouseOver: "#16a085"
                iconWidth: 23
                iconHeight: 23
                bttnIconSource: "../../images/svg_images/open_icon.svg"
                font.pointSize: 10
                font.family: "Verdana"
                bttnColorDefault: "#15967c"
            }

            CustomButton {
                id: printBttn
                width: 300
                height: 60
                text: "Print"
                bttnIconSource: "../../images/svg_images/print_icon.svg"
                iconHeight: 23
                iconWidth: 23
                bttnColorMouseOver: "#314458"
                bttnColorClicked: "#77a8d8"
                font.pointSize: 10
                font.family: "Verdana"
                bttnColorDefault: "#34495e"
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
