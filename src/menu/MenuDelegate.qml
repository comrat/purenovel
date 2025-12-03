WebItem {
	signal pressed;
	width: 100%;
	height: 70s;
	opacity: hover ? 1 : 0.6;
	gradient: Gradient {
		GradientStop { color: "#0000"; position: 0.0; }
		GradientStop { color: "#000e"; position: 0.2; }
		GradientStop { color: "#000e"; position: 0.8; }
		GradientStop { color: "#0000"; position: 1.0; }
	}

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
