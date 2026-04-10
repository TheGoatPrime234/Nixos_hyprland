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
    implicitWidth: rpill.implicitWidth + Theme.impW
    implicitHeight: Theme.h2
    radius: Theme.rad
    color: Theme.bg0
    Row {
        id: rpill
        anchors.verticalCenter: parent.verticalCenter
        spacing: Theme.spc1
        Audio {
        }
        Wifi {
        }
        Battery {
        }
        Notification {
        }
    }
}