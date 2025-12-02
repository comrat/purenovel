Scene {
	backgroundImage: "assets/background/menu.jpg";

	ListView {
		id: menuList;
		width: 300s;
		height: contentHeight;
		anchors.centerIn: parent;
		spacing: 10s;
		model: ListModel {
			ListElement { text: "PLAY"; action: "play"; }
			ListElement { text: "SETTINGS"; action: "settings"; }
			ListElement { text: "EXIT"; action: "exit"; }
		}
		delegate: MenuDelegate {
			onPressed: {
				switch (model.action) {
					case "play":
						main.startGame("intro")
						break;
					case "settings":
						break;
					case "exit":
						break;
				}
			}
		}
	}
}
