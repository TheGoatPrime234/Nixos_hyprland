import Quickshell
import QtQuick
import "./../color"

Rectangle {
    anchors.verticalCenter: parent.verticalCenter
    implicitWidth: rpillchild4.implicitWidth + Theme.impW
    implicitHeight: Theme.h3
    radius: Theme.rad
    border {
	width: 1
	color: Theme.bg2
    }
    color: Theme.bg1
    Text {
        id: rpillchild4
        anchors.centerIn: parent
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
	font {
	    pixelSize: Theme.t1;
	    bold: true
	    family: Theme.fnt
	}
	color: Theme.ac1
        text: "Notify"
    }
}
