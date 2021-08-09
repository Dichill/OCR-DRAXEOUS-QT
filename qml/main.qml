import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Dialogs 1.3
import "controls"

Window {
    id: window
    width: 1000
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("Draxeous AI | OCR")

    // Remove Title Bar
    flags: Qt.Window | Qt.FramelessWindowHint

    // Properties
    property int windowStatus: 0
    property int windowMargin: 10

    property bool folderOpen: false

    property string outputText: ""

    // Image Holder
    property alias actualPage: pageView.currentItem

    // Internal Functions
    QtObject {
        id: internal

        function maximizeRestore()
        {
            if (windowStatus == 0)
            {
                window.showMaximized()
                windowStatus = 1
                windowMargin = 0
                maximizeBttn.bttnIconSource = "../images/svg_images/restore_icon.svg"

            } else {
                window.showNormal()
                windowStatus = 0
                windowMargin = 10
                maximizeBttn.bttnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function restoreMargins()
        {
            windowMargin = 10
            maximizeBttn.bttnIconSource = "../images/svg_images/maximize_icon.svg"
        }
    }

    Rectangle {
        id: bg
        color: "#292b37"
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        z: 1


        Rectangle {
            id: appContainer
            color: "#00000000"
            border.color: "#000000"
            border.width: 0
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#1e202c"
                border.width: 0
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton {
                    id: toggleBttn
                    width: 74
                    height: 59
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    onClicked: animationMenu.running = true
                }

                Rectangle {
                    id: topBarDescription
                    x: 0
                    y: 34
                    height: 26
                    color: "#2f323f"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 75
                    anchors.bottomMargin: 0
                }

                Rectangle {
                    id: titleBar
                    height: 34
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 106
                    anchors.leftMargin: 74
                    anchors.topMargin: 0

                    DragHandler {
                        onActiveChanged: if(active){
                                             window.startSystemMove()
                                         }
                    }

                    Label {
                        id: titletxt
                        color: "#ffffff"
                        text: qsTr("Draxeous AI")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        anchors.rightMargin: 0
                        font.bold: false
                        font.pointSize: 9
                        font.family: "Verdana"
                        anchors.leftMargin: 0
                    }
                }

                Row {
                    id: windowsBttn
                    width: 106
                    height: 34
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.rightMargin: 0

                    TopBarButton {
                        id: minimizeBttn
                        width: 35
                        height: 34
                        bttnColorClicked: "#00a1f0"
                        font.pointSize: 7
                        bttnIconSource: "../images/svg_images/minimize_icon.svg"
                        onClicked: {
                            window.showMinimized()
                            internal.restoreMargins()
                        }
                    }

                    TopBarButton {
                        id: maximizeBttn
                        width: 35
                        height: 34
                        font.pointSize: 7
                        bttnIconSource: "../images/svg_images/maximize_icon.svg"
                        bttnColorClicked: "#00a1f0"
                        // onClicked: internal.maximizeRestore()
                    }

                    TopBarButton {
                        id: closeBttn
                        width: 35
                        height: 34
                        font.pointSize: 7
                        bttnIconSource: "../images/svg_images/close_icon.svg"
                        bttnColorClicked: "#e53509"
                        onClicked: window.close()
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 75
                    color: "#1e202c"
                    border.width: 0
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    PropertyAnimation {
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: if(leftMenu.width == 75) return 250; else return 75
                        duration: 1000
                        easing.type: Easing.OutBounce
                    }

                    Column {
                        id: leftMenuColumn
                        anchors.fill: parent
                        anchors.bottomMargin: 65

                        LeftMenuButton {
                            id: homeBttn
                            width: leftMenu.width
                            text: "Home"
                            isActiveMenu: true
                            bttnColorClicked: "#191b2b"

                            onClicked: {
                                homeBttn.isActiveMenu = true
                                openBttn.isActiveMenu = false
                                saveBttn.isActiveMenu = false
                                settingsBttn.isActiveMenu = false
                                pageView.push(Qt.resolvedUrl("pages/homePage.qml"))
                            }
                        }

                        LeftMenuButton {
                            id: openBttn
                            width: leftMenu.width
                            text: "Open"
                            bttnIconSource: "../images/svg_images/open_icon.svg"
                            onPressed: {
                                // if (folderOpen == true)
                                //{
                                //    homeBttn.isActiveMenu = false
                                //    openBttn.isActiveMenu = true
                                //    saveBttn.isActiveMenu = false
                                //    settingsBttn.isActiveMenu = false
                                //    pageView.push(Qt.resolvedUrl("pages/processPage.qml"))

                                //} else {

                                fileOpen.open()

                                //    folderOpen = true
                                //}
                            }

                            FileDialog {
                                id: fileOpen
                                title: "Please choose a image"
                                folder: shortcuts.desktop
                                selectMultiple: false
                                nameFilters: ["Image files (*.jpg *.png)"]
                                onAccepted: {
                                    pageView.push(Qt.resolvedUrl("pages/processPage.qml"))
                                    backend.getPath(fileOpen.fileUrl)
                                }
                            }
                        }

                        LeftMenuButton {
                            id: saveBttn
                            width: leftMenu.width
                            text: "Save"
                            bttnIconSource: "../images/svg_images/save_icon.svg"
                            onClicked: {
                                homeBttn.isActiveMenu = false
                                openBttn.isActiveMenu = false
                                saveBttn.isActiveMenu = true
                                settingsBttn.isActiveMenu = false
                                pageView.push(Qt.resolvedUrl("pages/savePage.qml"))
                            }
                        }

                        LeftMenuButton {
                            id: settingsBttn
                            width: leftMenu.width
                            text: "Settings"
                            bttnIconSource: "../images/svg_images/settings_icon.svg"
                            bttnColorClicked: "#191b2b"
                            onClicked: {
                                homeBttn.isActiveMenu = false
                                openBttn.isActiveMenu = false
                                saveBttn.isActiveMenu = false
                                settingsBttn.isActiveMenu = true
                                pageView.push(Qt.resolvedUrl("pages/settingsPage.qml"))
                            }
                        }
                    }
                }

                Rectangle {
                    id: contentPages
                    color: "#292b37"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0


                    StackView {
                        id: pageView
                        anchors.fill: contentPages
                        initialItem: Qt.resolvedUrl("pages/homePage.qml")

                    }
                }
            }
        }
    }

    DropShadow {
        anchors.fill: bg
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#80000000"
        source: bg
        z:0
    }

    Connections {
        target: backend

        function onSourceTar(sourcepath) {
            actualPage.setSource = sourcepath
        }

        function onOutputText(output) {
            actualPage.outputText = output
        }
    }
}







/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
