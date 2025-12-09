Scene {
	property string langRu: "ru_RU";
	property string langEn: "en_GB";
	backgroundImage: "assets/background/menu.jpg";

	ListView {
		id: settingsList;
		width: 300s;
		height: contentHeight;
		anchors.centerIn: parent;
		spacing: 10s;
		model: ListModel {
			ListElement {
				text: "ENGLISH";
				action: "eng";
				langCode: "en_GB";
			}

			ListElement {
				text: "РУССКИЙ";
				action: "rus";
				langCode: "ru_RU";
			}

			ListElement {
				text: qsTr("BACK");
				action: "back";
			}
		}
		delegate: MenuDelegate {
			onPressed: {
				if (model.action == "back") {
					main.pop();
				} else {
					main._context.language = model.langCode;
				}
			}
		}
	}

	init: { settingsList.setFocus(); }
}
