ListView {
	width: 100%;
	height: contentHeight;
	anchors.verticalCenter: parent.verticalCenter;
	spacing: 10s;
	model: ListModel { }
	delegate: WebItem {
		signal pressed;
		width: 100%;
		height: 50s;
		opacity: hover ? 1 : 0.6;

		Text {
			width: 100%;
			anchors.verticalCenter: parent.verticalCenter;
			color: "#fff";
			horizontalAlignment: Text.AlignHCenter;
			text: model.text;
		}

		onClicked: { this.pressed() }
		onSelectPressed: { this.pressed() }
	}

	reset: {
		this.model.clear();
	}

	show(options): {
		this.model.assign(options);
		this.setFocus()
	}
}
