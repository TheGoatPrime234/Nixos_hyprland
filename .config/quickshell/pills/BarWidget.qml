import Quickshell
import QtQuick
import QtQuick.Layouts
import "./../color"
import "./Leftpill.qml"
import "./Centerpill.qml"
import "./Rightpill.qml"

PanelWindow {
	id: topBar
	anchors {
		left: true
		right: true
		top: true
	}
	implicitHeight: h1
	color: Theme.trans
	RowLayout {
		id: pillbar
		anchors {
			fill: parent
			margins: Theme.outmrg
			verticalCenter: parent.verticalCenter
			horizontalCenter: parent.horizontalCenter
		}
		implicitHeight: Theme.h1
		Leftpill {
		}
		Item {
			Layout.fillWidth: true 
		}
		Centerpill {
		}
		Item {
			Layout.fillWidth: true 
		}
		Rightpill {
		}
	}
}
