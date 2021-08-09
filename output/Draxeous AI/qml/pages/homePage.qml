import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Item {
    width: 903
    height: 481

    property StackView pageView: StackView.view

    Rectangle {
        id: bg
        color: "#292b37"
        anchors.fill: parent

        Rectangle {
            id: rectangle
            color: "#1c1e28"
            radius: 20
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 30
            anchors.bottomMargin: 39
            anchors.rightMargin: 30
            anchors.leftMargin: 30

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                enabled: !drop.enabled
                onContainsMouseChanged: drop.enabled = true
            }

            DropArea {
                id: drop
                anchors.fill: parent

                onEntered: {
                    console.log("[DrX] Droparea entered");
                    // Ensure at least one file is supported before accepted the drag
                    for(var i = 0; i < drag.urls.length; i++)
                        if(validateFileExtension(drag.urls[i]))
                            return
                    console.log("[DrX] No valid files, refusing drag event")
                    drag.accept()
                    drop.enabled = false
                }

                onDropped:
                {
                    for(var i = 0; i < drag.urls.length; i++)
                        if(backend.getPath(validateFileExtension(drag.urls[i])))
                            return
                    pageView.push("processPage.qml")
                }

                // Only Images
                function validateFileExtension(filePath) {
                    return filePath.split('.').pop() !== "png" && "jpg"
                }
            }

            Label {
                id: dragTxt
                color: "#ffffff"
                text: qsTr("Drag & Drop Image Here")
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                topPadding: 80
                bottomPadding: 0
                font.bold: false
                font.pointSize: 9
                font.family: "Verdana"

                Image {
                    id: cloudIco
                    width: 112
                    height: 99
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../../images/svg_images/dragndrop_icon.svg"
                    anchors.verticalCenterOffset: 1
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit


                }

                ColorOverlay{
                    anchors.fill: cloudIco
                    source: cloudIco
                    anchors.verticalCenterOffset: 1
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 1
                    anchors.topMargin: 1
                    color: "#ffffff"
                    anchors.verticalCenter: parent.verticalCenter
                    antialiasing: true
                    width: 25
                    height: 25
                }
            }
        }
    }

    Connections {
        target: backend

        function onSourceTar(sourcepath) {
            actualPage.setSource = sourcepath
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
