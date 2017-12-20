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
            var prizes = lottery.getLuckyPrizes();
            for (var i = 0; i < 10; i++)
                lucky_prize.itemAt(i).num = prizes[i];
        }
    }

    GridLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        columns: 5
        columnSpacing: 10
        rowSpacing: 10
        Repeater {
            id: lucky_prize
            model: 10
            Rectangle {
               width: 100; height: 50
               border.width: 1
               property string num: "0000"
               Label {
                   anchors.centerIn: parent
                   text: parent.num
                   font.pixelSize: 25
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
                var prizes = lottery.getLuckyPrizes(true);
                for (var i = 0; i < 10; i++)
                    lucky_prize.itemAt(i).num = prizes[i];
            }
        }
    }
}
