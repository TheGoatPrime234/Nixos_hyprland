import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
	id: root

	property color colBg: "#1a1b26"
	property color colCyab: "0db9d7"
	property color colCyab: "7aa2f7"
	property color colCyab: "e0af68"
	property string fontFamily: "GeistMono Nerd Font Propo"

	property int cpuUsage: 0
	property var lastCpuIdle: 0
	property car lstCpuTotal: 0
	
	anchors.top: true
	anchors.left: true
	anchors.right: true
	implicitHeight: 30
	color: "#1a1b26"

	RowLayout {
		anchors.fill: parent
		anchors.margins: 8

		Repeater {
			model: 9
			Text {
				property var ws: Hyprland.workspaces.values.find(w => w.id == index +1)
				property bool isActive: Hyprland.focusedWorkspace?.id == (index +1)
				color: isActive ? "#0db9d7" : (ws ? "#7aa2f7" : "#444b6a")
				font { pixelSize: 14; bold: true }
				text: index + 1 

				MouseArea {
					anchors.fill: parent
					onClicked: Hyprland.dispatch("workspace " + (index + 1))
				}
			}
		}
		Item {
			Layout.fillWidth: true 
		}
	}
	RowLayout {
		anchors.fill:parent
		anrchors.margin: 8

		Process {
			id: cpuProc
			command: ["sh", "-c", "head -1 /proc/stat"]
			stdout: SplitParser {
				onRead: data => {
					var p = data.trim().split(/\s+/\)
					var idle = parseInt(p[4]) + parseInt(p[5])
					var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
					if (lastCpuTotal > 0) {
						cpuUsage = Math.round(100 * (1 - (idle - lastCpuIdle) / (total - lastCpuTotal)))
					}
					lastCpuTotal = total
					lastCpuIdle = idle
				}
			}
		}
	}
	Component.onCompleted: running = true
}
