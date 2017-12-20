import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0

ApplicationWindow {
    id: root
    visible: true
    width: 800
    height: 500
    title: qsTr("晚会抽奖")

    Material.accent: Material.Purple;

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        FirstPanel {

        }

        SecondPanel {

        }

        ThirdPanel {

        }

        LuckyPanel {

        }

        PatchPanel {

        }
    }

    header: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("一等奖")
            font.pixelSize: root.height * 0.05
            font.family: "Microsoft Yahei UI"
        }
        TabButton {
            text: qsTr("二等奖")
            font.pixelSize: root.height * 0.05
            font.family: "Microsoft Yahei UI"
        }
        TabButton {
            text: qsTr("三等奖")
            font.pixelSize: root.height * 0.05
            font.family: "Microsoft Yahei UI"
        }
        TabButton {
            text: qsTr("幸运奖")
            font.pixelSize: root.height * 0.05
            font.family: "Microsoft Yahei UI"
        }
        TabButton {
            text: qsTr("补抽")
            font.pixelSize: root.height * 0.05
            font.family: "Microsoft Yahei UI"
        }
    }
}
