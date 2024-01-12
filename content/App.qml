// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only


import QtQuick
import QtQuick3D
import QtQuick.Controls
import Quick3DAssets.BallOnPlateModel
import QtQuick3D.Physics
import QtCharts

Window {
    id: window
    width: 1920
    height: 1080
    visible: true
    title: "Ball On Plate"
    color: "#848895"

    PhysicsWorld {
        scene: standAloneScene
    }

    Rectangle {
        id: cameras
        width: parent.width * 0.80
        height: parent.height
        visible: true

        color: "#848895"
        anchors.verticalCenter: actions.verticalCenter
        anchors.left: actions.right
        anchors.right: actions.left
        anchors.bottom: actions.top
        anchors.bottomMargin: -1080
        anchors.leftMargin: -1920
        anchors.rightMargin: 0

        Node {
            id: standAloneScene

            DirectionalLight {
                ambientColor: Qt.rgba(0.5, 0.5, 0.5, 1.0)
                brightness: 1.0
                eulerRotation.x: -25
            }

            BallOnPlateModel { x: 0;y: -152.305; scale.z: 15; scale.y: 15; scale.x: 15;z: 0}

            PerspectiveCamera {
                id: cameraPerspective
                x: -0
                y: 492.815
                eulerRotation.z: 0.00001
                eulerRotation.y: -0
                eulerRotation.x: -21.7724
                z: 600
            }

            Node {
                PerspectiveCamera {
                    id: cameraPerspectiveTwo
                    x: -0
                    y: 492.815
                    eulerRotation.z: 0.00001
                    eulerRotation.y: -0
                    eulerRotation.x: -21.7724
                    z: 600
                }

                PropertyAnimation on eulerRotation.x {
                    loops: Animation.Infinite
                    duration: 5000
                    to: -360
                    from: 0
                }
            }

            // Second animated perspective camera
            Node {
                PerspectiveCamera {
                    id: cameraPerspectiveThree
                    x: -0
                    y: 492.815
                    eulerRotation.z: 0.00001
                    eulerRotation.y: -0
                    eulerRotation.x: -21.7724
                    z: 600
                }
                PropertyAnimation on eulerRotation.y {
                    loops: Animation.Infinite
                    duration: 5000
                    to: 0
                    from: -360
                }
            }

            OrthographicCamera {
                id: cameraOrthographicTop
                y: 600
                eulerRotation.x: -90
            }

            OrthographicCamera {
                id: cameraOrthographicFront
                z: 600
            }

            OrthographicCamera {
                id: cameraOrthographicLeft
                x: -600
                eulerRotation.y: -90
            }
        }

        Rectangle {
            id: topLeft
            anchors.top: parent.top
            anchors.left: parent.left
            width: parent.width * 0.5
            height: parent.height * 0.5
            color: "#848895"
            border.color: "black"

            View3D {
                id: topLeftView
                anchors.fill: parent
                importScene:standAloneScene
                camera: cameraOrthographicFront
            }

            Label {
                text: "Front"
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 10
                color: "#222840"
                font.pointSize: 14
            }
        }

        Rectangle {
            id: topRight
            anchors.top: parent.top
            anchors.right: parent.right
            width: parent.width * 0.5
            height: parent.height * 0.5
            color: "transparent"
            border.color: "black"

            Label {
                text: "Perspective"
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.margins: 10
                color: "#222840"
                font.pointSize: 14
            }

            View3D {
                id: topRightView
                anchors.fill: parent
                importScene:standAloneScene
                camera: cameraPerspective
            }

            Row {
                id: controlsContainer
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                padding: 10

                RoundButton {
                    text: "Camera 1"
                    highlighted: topRightView.camera == cameraPerspective
                    onClicked: {
                        topRightView.camera = cameraPerspective
                    }
                }
                RoundButton {
                    text: "Camera 2"
                    highlighted: topRightView.camera == cameraPerspectiveTwo
                    onClicked: {
                        topRightView.camera = cameraPerspectiveTwo
                    }
                }
                RoundButton {
                    text: "Camera 3"
                    highlighted: topRightView.camera == cameraPerspectiveThree
                    onClicked: {
                        topRightView.camera = cameraPerspectiveThree
                    }
                }
            }
        }


        Rectangle {
            id: bottomLeft
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: parent.width * 0.5
            height: parent.height * 0.5
            color: "#848895"
            border.color: "black"

            View3D {
                id: bottomLeftView
                anchors.fill: parent
                importScene:standAloneScene
                camera: cameraOrthographicTop
            }

            Label {
                text: "Top"
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 10
                color: "#222840"
                font.pointSize: 14
            }
        }

        Rectangle {
            id: bottomRight
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            width: parent.width * 0.5
            height: parent.height * 0.5
            color: "#848895"
            border.color: "black"

            View3D {
                id: bottomRightView
                anchors.fill: parent
                importScene:standAloneScene
                camera: cameraOrthographicLeft
            }

            Label {
                text: "Left"
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.margins: 10
                color: "#222840"
                font.pointSize: 14
            }
        }
    }

    Rectangle {
        id: actions
        x: 1536
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 0
        anchors.topMargin: 0
        width: parent.width * 0.20
        height: parent.height
        border.color: "black"

        Label {
            id:action
            text: "Actions"
            anchors.verticalCenterOffset: -507
            anchors.horizontalCenterOffset: 1
            anchors.centerIn: parent
            color: "#222840"
            font.pointSize: 14
        }

        Label {
            id:command
            text: "Commands"
            anchors.top: action.bottom
            anchors.horizontalCenter: action.horizontalCenter
            anchors.bottomMargin: 20
            color: "blue"
            font.pointSize: 12
            Connections {
                target: Communication


            }
        }

        Rectangle {
            id: mainRect
            width: 330
            height: 250
            color: "#80808080"
            anchors.horizontalCenterOffset: 1

            anchors.centerIn: parent
            anchors.verticalCenterOffset: -277

            Rectangle {
                id: nodeRect
                width: 15
                height: 15
                radius: 7.5
                color: "red"
                visible: false
                Connections {
                    target: Communication
                    onCommand_XChanged: {
                        visible= true;
                        nodeRect.x = Communication.command_X;


                    }
                    onCommand_YChanged: {
                        visible= true;
                        nodeRect.y = Communication.command_Y;
                    }
                }
            }

            Rectangle {
                id: nodeRct
                x:Communication.rect_X
                y:Communication.rect_Y
                width: 15
                height: 15
                radius: 7.5
                color: "white"
                visible: false
                Connections {
                    target: Communication
                    onRect_XChanged: {
                        nodeRct.x = Communication.rect_X;

                    }
                    onRect_YChanged: {
                        nodeRct.y = Communication.rect_Y;
                    }
                }
            }

            MouseArea {
                anchors.verticalCenter: nodeRect.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: nodeRect.bottom
                anchors.bottom: parent.bottom
                anchors.leftMargin: -15
                anchors.rightMargin: -330
                anchors.topMargin: -15
                anchors.bottomMargin: -250
                anchors.horizontalCenter: nodeRect.horizontalCenter
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    // Calculate the position relative to the parent
                    var clickX = (mouseX - mainRect.width / 2);
                    var clickY = -(mouseY - mainRect.height / 2);

                    console.log("Clicked at:", clickX, clickY);
                    console.log("Clicked at:", mouseX, mouseY);
                    Communication.sendLocation(clickX,clickY)
                    command.text = "Set Coordinate Command Sent";
                    // Toggle visibility and set the position of the rectangle
                    nodeRect.visible = true;
                    nodeRct.visible = true;
                    nodeRect.x = mouseX;
                    nodeRect.y = mouseY;
                }
            }

        }
        Label {
             id: positionLabel
             property real distanceX: Math.abs(Communication.map(Communication.rect_X,0,330,0,300) - Communication.map(nodeRect.x,0,330,0,300))
             property real distanceY: Math.abs(Communication.map(Communication.rect_Y,0,250,0,400) - Communication.map(nodeRect.y,0,250,0,400))
             property real distance:Math.sqrt( distanceX * distanceX + distanceY * distanceY)
             y: 428
             text: "X: " + distanceX.toFixed(2) + ", Y: " + distanceY.toFixed(2)+ "\nDistance: " + distance.toFixed(2)
             color: "black"
             font.pointSize: 12
             anchors.bottom: parent.verticalCenter
             anchors.bottomMargin: 90
             anchors.horizontalCenterOffset: 11
             anchors.horizontalCenter: parent.horizontalCenter
         }

        Button {
            id: upButton
            x: 159
            y: 804
            text: "UP"
            display: AbstractButton.TextOnly

            onClicked: {
                Communication.sendDirection(5);
                command.text = "MOVE UP Command Sent";
            }
        }

        Button {
            id: downButton
            x: 146
            y: 873
            text: qsTr("DOWN")
            display: AbstractButton.TextOnly

            onClicked: {
                Communication.sendDirection(2);
                command.text = "MOVE DOWN Command Sent";
            }
        }

        Button {
            id: leftButton
            x: 41
            y: 873
            text: qsTr("LEFT")
            display: AbstractButton.TextOnly

            onClicked: {
                Communication.sendDirection(1);
                command.text = "MOVE LEFT Command Sent";
            }
        }

        Button {
            id: rigthButton
            x: 254
            y: 873
            text: qsTr("RIGHT")
            display: AbstractButton.TextOnly

            onClicked: {
                Communication.sendDirection(3);
                command.text = "MOVE RIGHT Command Sent";
            }
        }

        Label {
            color: "#222840"
            text: "Set Coordinates"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: action.right
            anchors.right: action.left
            anchors.bottom: action.top
            anchors.leftMargin: -97
            anchors.rightMargin: -97
            anchors.bottomMargin: -90
            anchors.horizontalCenter: action.horizontalCenter
            font.pointSize: 14
            anchors.verticalCenterOffset: -443
            anchors.horizontalCenterOffset: -1
        }
        Item {
                    id: counterObject
                    property int counter: 0
                    property int err: 0
                    function setCounter(value) {
                        counter = value
                    }
                    function setErr(value) {
                        err = value
                    }
                }


                ChartView {
                  id: chartViewTemperature
                  x: 17
                  y: 484
                  width: 359
                  height: 302
                  title: "Error Rate"
                  titleFont.bold: true
                  titleFont.pointSize: 12
                  antialiasing: true
                  legend.visible: false


                  Timer {
                      interval: 10

                      running: true
                      repeat: true
                      onTriggered: {
                          if(counterObject.counter % 8 == 0){
                              errorLineSeries.clear();
                              counterObject.setCounter(0);
                          }

                          var distanceX = Math.abs(Communication.map(Communication.rect_X,0,330,0,300) - Communication.map(nodeRect.x,0,330,0,300))
                          var distanceY = Math.abs(Communication.map(Communication.rect_Y,0,250,0,400) - Communication.map(nodeRect.y,0,250,0,400))
                          var distance= Math.sqrt( distanceX * distanceX + distanceY * distanceY)

                          errorLineSeries.append(counterObject.counter, distance);
                          counterObject.setCounter(counterObject.counter + 1);
                      }
                  }

                  ValuesAxis {
                    id: axisyError
                    min: 0
                    max: 250
                    gridVisible: true
                    tickCount: 7
                    titleText: "Error"
                    titleFont.bold: true
                    titleFont.italic: true
                    titleFont.pointSize: 10
                  }

                  DateTimeAxis {
                    id: axisxError
                    gridVisible: true
                    tickCount: 10
                    titleText: "Time"
                    titleFont.bold: true
                    titleFont.italic: true
                    titleFont.pointSize: 10
                    labelsVisible: false
                  }

                  LineSeries {
                    id: errorLineSeries
                    name: "Error Values"
                    axisX: axisxError
                    axisY: axisyError
                  }
                }
                TextField {
                    id: userInputField
                    y: 964
                    width: 200
                    height: 40
                    anchors.horizontalCenterOffset: -84
                    placeholderText: "Enter IP here"
                    anchors {
                        bottom: parent.bottom
                        horizontalCenter: parent.horizontalCenter
                        bottomMargin: 76
                    }
                }


                Button {
                    id: sendButton
                    y: 964
                    width: 150
                    height: 40
                    text: "Connect Server"
                    anchors.horizontalCenterOffset: 106
                    anchors {
                        bottom: parent.bottom
                        horizontalCenter: parent.horizontalCenter
                        bottomMargin: 76
                    }

                    onClicked: {
                        var userCommand = userInputField.text.trim();
                        if (userCommand.length > 0) {
                            if(Communication.connectServer(userCommand) == true){
                                command.text = "Connected to: " + userCommand;
                            } else {
                                command.text = "Failed to connect to: " + userCommand;
                            }

                        }
                    }
                }
            }

}

/*##^##
Designer {
    D{i:0}D{i:13;invisible:true}D{i:43}
}
##^##*/
