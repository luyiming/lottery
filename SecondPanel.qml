import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ColumnLayout {
    anchors.centerIn: parent
    spacing: 100

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

    GridLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        columnSpacing: 10
        rowSpacing: 10
        Repeater {
            id: prizes_label
            model: 2
            Rectangle {
               width: 150; height: 75
               border.width: 1
               property string num: "0000"
               Label {
                   anchors.centerIn: parent
                   text: parent.num
                   font.pixelSize: 40
               }
           }
        }
    }

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 120
        Button {
            text:  qsTr("开始")
            font.pixelSize: 25
            font.family: "Microsoft Yahei UI"
            onClicked: timer.start();
        }
        Button {
            text:  qsTr("停止")
            font.pixelSize: 25
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
