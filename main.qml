import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("晚会抽奖")

    Material.accent: Material.Purple;

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page {
            FirstPanel {
            }
        }

        Page {
            SecondPanel {
            }
        }

        Page {
            ThirdPanel {
            }
        }

        Page {
            LuckyPanel {
            }
        }

        Page {
            PatchPanel {
            }
        }
    }

    header: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("一等奖")
            font.family: "Microsoft Yahei UI"
        }
        TabButton {
            text: qsTr("二等奖")
            font.family: "Microsoft Yahei UI"
        }
        TabButton {
            text: qsTr("三等奖")
            font.family: "Microsoft Yahei UI"
        }
        TabButton {
           text: qsTr("幸运奖")
            font.family: "Microsoft Yahei UI"
        }
        TabButton {
           text: qsTr("补抽")
            font.family: "Microsoft Yahei UI"
        }
    }
}
