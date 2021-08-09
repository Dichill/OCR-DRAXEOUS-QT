import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import "../controls"

Item {
    width: 903
    height: 481

    Rectangle {
        id: rectangle
        color: "#292b37"
        anchors.fill: parent

        CustomTextField {
            id: outpathField
            width: 800
            height: 37
            anchors.top: parent.top
            fieldText: "C:\\Users\\Gaming\\AppData\\Roaming\\draxeousai\\output"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 25
            withIcon: true

            TopBarButton {
                id: selectfolderBttn
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 736
                bttnIconSource: "../../images/svg_images/open_icon.svg"

                onPressed: {
                    outputPath.open()
                }

                FileDialog {
                    id: outputPath
                    title: "Select a output path"
                    selectFolder: true

                    onAccepted: {

                    }
                }
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
