WebItem {
	signal pressed;
	width: 100%;
	height: 50s;
	opacity: hover ? 1 : 0.6;
	gradient: Gradient {
		GradientStop { color: "#0000"; position: 0.0; }
		GradientStop { color: "#000e"; position: 0.2; }
		GradientStop { color: "#000e"; position: 0.8; }
		GradientStop { color: "#0000"; position: 1.0; }
	}

	Text {
		width: 100%;
		anchors.verticalCenter: parent.verticalCenter;
		color: "#fff";
		horizontalAlignment: Text.AlignHCenter;
		font.pixelSize: 32s;
		text: model.text;
	}

	onClicked: { this.pressed() }
	onSelectPressed: { this.pressed() }
}
