import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
	id: root
	anchors {
		top: true
		left: true
		right: true
	}
	color: "#ff0000"
	height: 50

	Item {
		anchors.fill: parent
		RowLayout {
			anchors.left: parent.left
			anchors.verticalCenter: parent.verticalCenter
			spacing: 12
			anchors.margins: 8

			Rectangle {
				color: "#00ff00"
				Layout.preferredWidth: innerLayout.implicitWidth + 24
				anchors.left: parent.left
				radius: 10
//				color: "#282a36" // Bg0
				border.width: 1
				border.color : "#44475a" //Bg2

				RowLayout {
					anchors.fill: parent
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
				}
			}

			Item {
				Layout.fillWidth: true
			}

			Rectangle {

				Layout.preferredWidth: innerLayout.implicitWidth + 24
				
				anchors.right: parent.right
				radius: 10
				color: "#282a36" // Bg0
				border.width: 1
				border.color : "#44475a" //Bg2
				
				Text {
					text: "Cava"
					font {
						pixelSize: 14
						bold: true
					}
					color: "#bd93f9" // Ac1
				}
			}
		}

		RowLayout {
			anchors.centerIn: parent

			Rectangle {
				Layout.preferredWidth: innerLayout.implicitWidth + 24
				radius: 10
				anchors.left: parent.left
				color: "#282a36" // Bg0
				border.width: 1
				border.color : "#44475a" //Bg2
				
				Text {
					text: "Uhr 1"
					font {
						pixelSize: 14
						bold: true
					}
					color: "#bd93f9" // Ac1
				}
			}

			Rectangle {
				Layout.preferredWidth: innerLayout.implicitWidth + 24
				radius: 10
				anchors.right: parent.right
				color: "#282a36" // Bg0
				border.width: 1
				border.color : "#44475a" //Bg2
				
				Text {
					text: "Uhr 2"
					font {
						pixelSize: 14
						bold: true
					}
					color: "#bd93f9" // Ac1
				}
			}
		}

		RowLayout {
			anchors.right: parent.right
			anchors.verticalCenter: parent.verticalCenter
			spacing: 12

			Rectangle {
				Layout.preferredWidth: innerLayout.implicitWidth + 24
				radius: 10
				color: "#282a36" // Bg0
				border.width: 1
				border.color : "#44475a" //Bg2
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
			}

			Rectangle {
				Layout.preferredWidth: innerLayout.implicitWidth + 24
				radius: 10
				color: "#282a36" // Bg0
				border.width: 1
				border.color : "#44475a" //Bg2
				
				Text {
					text: "Cava"
					font {
						pixelSize: 14
						bold: true
					}
					color: "#bd93f9" // Ac1
				}
			}
		}
	}
}


