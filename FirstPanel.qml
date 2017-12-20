import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    id: root

    Timer {
        id: timer
        interval: 20
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            prize_label.text = lottery.getFirstPrize();
        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: root.height * 0.05

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            implicitHeight: root.height * 0.6
            implicitWidth: root.width * 0.85
            border.width: 2
            Label {
                id: prize_label
                anchors.centerIn: parent
                text: "0000"
                font.pixelSize: Math.min(parent.implicitHeight * 0.9, parent.implicitWidth * 0.4)
            }
        }

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: root.width * 0.2
            Button {
                text:  qsTr("开始")
                font.pixelSize: Math.min(root.width * 0.1, root.height * 0.1)
                font.family: "Microsoft Yahei UI"
                onClicked: timer.start();
            }
            Button {
                text:  qsTr("停止")
                font.pixelSize: Math.min(root.width * 0.1, root.height * 0.1)
                font.family: "Microsoft Yahei UI"
                onClicked: {
                    timer.stop();
                    prize_label.text = lottery.getFirstPrize(true);
                }
            }
        }
    }
}


