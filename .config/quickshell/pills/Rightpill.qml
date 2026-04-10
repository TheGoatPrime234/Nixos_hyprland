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
    anchors.verticalCenter: parent.verticalCenter
    implicitWidth: rpill.implicitWidth + Theme.impW
    implicitHeight: Theme.h2
    border {
	width: 1
	color: Theme.bg2
    }
    radius: Theme.rad
    color: Theme.bg0
    RowLayout {
        id: rpill
	anchors {
	    fill: parent
	    margins: Theme.outmrg
	    verticalCenter: parent.verticalCenter
	}
        spacing: Theme.spc2
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
