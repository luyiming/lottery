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
            prize_label.text = lottery.getPatchPrize();
        }
    }

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        width: 200; height: 100
        border.width: 1
        Label {
            id: prize_label
            anchors.centerIn: parent
            text: "0000"
            font.pixelSize: 50
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
                prize_label.text = lottery.getPatchPrize(true);
            }
        }
    }
}

