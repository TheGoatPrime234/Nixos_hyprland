import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import "./../color"
import "./../widgets"

Rectangle {

    implicitWidth: cpill.implicitWidth + Theme.impW
    implicitHeight: Theme.h2
    radius: Theme.rad
    color: Theme.bg0
    Row {
        id: cpill
        anchors.centerIn: parent
        spacing: Theme.spc2
        Uhr1 {
        }
        Icon {
        }
        Uhr2 {
        }
    }
}
