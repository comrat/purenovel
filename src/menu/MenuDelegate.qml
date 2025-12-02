Rectangle {
	signal pressed;
	width: 100%;
	height: 70s;
	radius: 10s;
	color: consts.panelColor;

	ClickMixin { }

	Text {
		width: 100%;
		anchors.verticalCenter: parent.verticalCenter;
		horizontalAlignment: Text.AlignHCenter;
		font.pixelSize: 24s;
		color: consts.textColor;
		text: qsTr(model.text);
	}

	onClicked: { this.pressed() }
	onSelectPressed: { this.pressed() }
}
