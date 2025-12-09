Scene {
	backgroundImage: "assets/background/menu.jpg";

	ListView {
		id: menuList;
		width: 300s;
		height: contentHeight;
		anchors.centerIn: parent;
		spacing: 10s;
		model: ListModel {
			ListElement { text: qsTr("PLAY"); action: "play"; }
			ListElement { text: qsTr("SETTINGS"); action: "settings"; }
			ListElement { text: qsTr("EXIT"); action: "exit"; }
		}
		delegate: MenuDelegate {
			onPressed: {
				switch (model.action) {
					case "play":
						main.startGame("intro")
						break;
					case "settings":
						main.push("settings")
						break;
					case "exit":
						break;
				}
			}
		}
	}
}
