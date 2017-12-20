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
            var prizes = lottery.getLuckyPrizes();
            for (var i = 0; i < 10; i++)
                lucky_prize.itemAt(i).num = prizes[i];
        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: root.height * 0.05

        GridLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            columns: 5
            columnSpacing: root.width * 0.015
            rowSpacing: root.width * 0.015
            Repeater {
                id: lucky_prize
                model: 10
                Rectangle {
                   implicitWidth: root.width * 0.18
                   implicitHeight: root.height * 0.3
                   border.width: 1
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
                    var prizes = lottery.getLuckyPrizes(true);
                    for (var i = 0; i < 10; i++)
                        lucky_prize.itemAt(i).num = prizes[i];
                }
            }
        }
    }
}

