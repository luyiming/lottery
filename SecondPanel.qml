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
            var prizes = lottery.getSecondPrizes();
            prizes_label.itemAt(0).num = prizes[0];
            prizes_label.itemAt(1).num = prizes[1];
        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: root.height * 0.05

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: root.width * 0.05
            Repeater {
                id: prizes_label
                model: 2
                Rectangle {
                   implicitWidth: root.width * 0.4
                   implicitHeight: root.height * 0.6
                   border.width: 2
                   property string num: "0000"
                   Label {
                       anchors.centerIn: parent
                       text: parent.num
                       font.pixelSize: Math.min(parent.implicitHeight * 0.9, parent.implicitWidth * 0.4)
                   }
               }
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
                    var prizes = lottery.getSecondPrizes(true);
                    prizes_label.itemAt(0).num = prizes[0];
                    prizes_label.itemAt(1).num = prizes[1];
                }
            }
        }
    }
}

