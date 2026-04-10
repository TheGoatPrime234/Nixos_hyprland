import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import "./../color"

Rectangle {
    anchors.verticalCenter: parent.verticalCenter
    implicitWidth: cpillchild1.implicitWidth + Theme.impW
    implicitHeight: Theme.h3
    radius: Theme.rad
    color: Theme.bg1
    Text {
        id: cpillchild1 
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: "Uhr 1"
    }
}