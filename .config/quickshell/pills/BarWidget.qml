import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import "./../color"

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
			Row {
				id: rpill
				anchors {
					fill: parent
					margins: Theme.outmrg
					verticalCenter: parent.verticalCenter
				}
				spacing: Theme.spc2
				Rectangle {
					anchors.verticalCenter: parent.verticalCenter
					implicitWidth: rpillchild1.implicitWidth + Theme.impW
					implicitHeight: Theme.h3
					border {
						width: 1
						color: Theme.bg2
					}
					radius: Theme.rad
					color: Theme.bg1
					Row {
						id: rpillchild1
						anchors.centerIn: parent
						spacing: Theme.spc2 / 2
						Repeater {
							model: 9
							Rectangle {
								property var ws: Hyprland.workspaces.values.find(w=> w.id == index +1)
								property bool isActive: Hyprland.focusedWorkspace?.id == (index +1)
								visible: ws ? true : false
								implicitWidth: isActive ? rpillchildchild.implicitWidth + Theme.impW * 4 : rpillchildchild.implicitWidth + Theme.impW * 2
								implicitHeight: Theme.h4
								border {
									width: 1
									color: Theme.bg2
								}
								radius: Theme.rad
								color: isActive ? Theme.ac2 : (ws ? Theme.ac3 : Theme.ac1)
								Text {
									id: rpillchildchild
									anchors.centerIn: parent
									horizontalAlignment: Text.AlignHCenter
									verticalAlignment: Text.AlignVCenter
									font {
										pixelSize: 14;
										bold: true
									}
									text: index + 1
								}
								MouseArea {
									anchors.fill: parent
									onClicked: Hyprland.dispatch("workspace " + (index + 1))
								}
							}
						}
					}
				}
				Rectangle {
					anchors.verticalCenter: parent.verticalCenter
					implicitWidth: rpillchild2.implicitWidth + Theme.impW
					implicitHeight: Theme.h3
					border {
						width: 1
						color: Theme.bg2
					}
					radius: Theme.rad 
					color: Theme.bg1 
					Text {
						id: rpillchild2
						anchors.centerIn: parent
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						font {
							pixelSize: 14;
							bold: true 
						}
						text: "Cava"
					}
				}
			}
		}
		Item {
			Layout.fillWidth: true 
		}
		Rectangle {
			anchors.verticalCenter: parent.verticalCenter
			implicitWidth: cpill.implicitWidth + Theme.impW
			implicitHeight: Theme.h2
			radius: Theme.rad
			color: Theme.bg0
			Row {
				id: cpill
				anchors.centerIn: parent
				spacing: Theme.spc2
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
				Text {
					id: cpillchild2
					horizontalAlignment: Text.AlignHCenter
					verticalAlignment: Text.AlignVCenter
					text: "Icon"
				}
				Rectangle {
					anchors.verticalCenter: parent.verticalCenter
					implicitWidth: cpillchild3.implicitWidth + Theme.impW
					implicitHeight: Theme.h3
					radius: Theme.rad
					color: Theme.bg1
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
			implicitWidth: lpill.implicitWidth + Theme.impW
			implicitHeight: Theme.h2
			radius: Theme.rad
			color: Theme.bg0
			Row {
				id: lpill
				anchors.verticalCenter: parent.verticalCenter
				spacing: Theme.spc1
				Rectangle {
					implicitWidth: lpillchild1.implicitWidth + Theme.impW
					implicitHeight: Theme.h3
					radius: Theme.rad
					color: Theme.bg1
					Text {
						id: lpillchild1
						anchors.centerIn: parent
						anchors.verticalCenter: parent.verticalCenter
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						text: "Lautstärke"
					}
				}
				Rectangle {
					implicitWidth: lpillchild2.implicitWidth + Theme.impW
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
				Rectangle {
					implicitWidth: lpillchild3.implicitWidth + Theme.impW
					implicitHeight: Theme.h3
					radius: Theme.rad
					color: Theme.bg1
					Text {
						id: lpippchild3
						anchors.centerIn: parent
						anchors.verticalCenter: parent.verticalCenter
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						text: "Battery"
					}
				}
				Rectangle {
					implicitWidth: lpillchild4.implicitWidth + Theme.impW
					implicitHeight: Theme.h3
					radius: Theme.rad
					color: Theme.bg1
					Text {
						id: lpippchild4
						anchors.centerIn: parent
						anchors.verticalCenter: parent.verticalCenter
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						text: "Notify"
					}
				}
			}
		}
	}
}
