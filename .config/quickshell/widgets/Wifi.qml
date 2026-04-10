import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import "./../color"

Rectangle {
    implicitWidth: rpillchild2.implicitWidth + Theme.impW
    implicitHeight: Theme.h3
    radius: Theme.rad
    color: Theme.bg1
    Text {
        id: lpippchild2
        anchors.centerIn: parent
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: "Wlan"
    }
}