import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

PanelWindow {
	property color trans: "transparent"
	property color bg0: "#282a36"
	property color bg1: "#343746"
	property color bg2: "#44475a"
	property color bg3: "#6272a4"

	property color ac1: "#bd93f9"
	property color ac2: "#8be9fd"
	property color ac3: "#ff79c6"

	property real rad: 8
	property real spc1: 16
	property real spc2: 8
	property real outmrg: 4
	property real impW: 8
	property real impH: 4

	id: topBar
	anchors {
		left: true
		right: true
		top: true
	}
	implicitHeight: 40
	color: trans

	RowLayout {
		anchors.fill: parent
		anchors.margins: outmrg
		anchors.verticalCenter: parent.verticalCenter

		Rectangle {
			color: bg0
			radius: rad
			implicitWidth: rpill.implicitWidth + impW
			implicitHeight: rpill.implicitHeight + impH
			Row {
				id: rpill
				spacing: spc1
				anchors.fill: parent
				anchors.margins: outmrg
				anchors.verticalCenter: parent.verticalCenter
				Rectangle {
					color: bg1
					radius: rad
					implicitWidth: rpillchild1.implicitWidth + impW
					implicitHeight: rpillchild1.implicitHeight + impH 

					Row {
						id: rpillchild1
						anchors.centerIn: parent
						spacing: spc2
						Repeater {
							model: 9

							Text {
								horizontalAlignment: Text.AlignHCenter
								verticalAlignment: Text.AlignVCenter
								property var ws: Hyprland.workspaces.values.find(w=> w.id == index +1)
								property bool isActive: Hyprland.focusedWorkspace?.id == (index +1)
								color: isActive ? ac2 : (ws ? ac3 : ac1)
								font {
									pixelSize: 14;
									bold: true
								}
								text: index + 1
								MouseArea {
									anchors.fill: parent
									onClicked: Hyprland.dispatch("workspace " + (index + 1))
								}
							}
						}
					}
				}
				Rectangle {
					color: bg1 
					radius: rad 
					implicitWidth: rpillchild2.implicitWidth + impW
					implicitHeight: rpillchild2.implicitHeight + impH
					Text {
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						id: rpillchild2
						text: "Cava"
						font {
							pixelSize: 14;
							bold: true 
						}
					}
				}
			}
		}
		Item {
			Layout.fillWidth: true 
		}
		Rectangle {
			color: bg0
			radius: rad
			implicitWidth: cpill.implicitWidth + impW
			implicitHeight: cpill.implicitHeight + impH
			Row {
				id: cpill
				anchors.centerIn: parent
				spacing: spc2
				Rectangle {
					color: bg1
					radius: rad
					implicitWidth: cpillchild1.implicitWidth + impW
					implicitHeight: cpillchild1.implicitHeight + impH
					Text {
						id: cpillchild1 
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						text: "Uhr 1"
					}
				}
				Text {
					id: cpillchild2
					horizontalAlignment: Text.AlignHCenter
					verticalAlignment: Text.AlignVCenter
					text: "Icon"
				}
				Rectangle {
					color: bg1
					radius: rad
					implicitWidth: cpillchild3.implicitWidth + impW
					implicitHeight: cpillchild3.implicitHeight + impH
					Text {
						id: cpillchild3
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						text: "Uhr 2"
					}
				}
			}
		}
		Item {
			Layout.fillWidth: true 
		}
		Rectangle {
			color: bg0
			radius: rad
			implicitWidth: lpill.implicitWidth + impW
			implicitHeight: lpill.implicitHeight + impH
			Row {
				id: lpill
				spacing: spc1
				anchors.verticalCenter: parent.verticalCenter
				Rectangle {
					color: bg1
					radius: rad
					implicitWidth: lpillchild1.implicitWidth + impW
					implicitHeight: lpillchild1.implicitHeight + impH
					Text {
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						id: lpillchild1
						text: "Lautstärke"
					}
				}
				Rectangle {
					color: bg1
					radius: rad
					implicitWidth: lpillchild2.implicitWidth + impW
					implicitHeight: lpillchild2.implicitHeight+ impH
					Text {
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						id: lpippchild2
						text: "Wlan"
					}
				}
				Rectangle {
					color: bg1
					radius: rad
					implicitWidth: lpillchild3.implicitWidth + impW
					implicitHeight: lpillchild3.implicitHeight+ impH
					Text {
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						id: lpippchild3
						text: "Battery"
					}
				}
				Rectangle {
					color: bg1
					radius: rad
					implicitWidth: lpillchild4.implicitWidth + impW
					implicitHeight: lpillchild4.implicitHeight+ impH
					Text {
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						id: lpippchild4
						text: "Notify"
					}
				}
			}
		}
	}
}
