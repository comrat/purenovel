WebItem {
	signal pressed;
	width: 70s;
	height: 70s;
	focus: true;

	Image {
		anchors.fill: parent;
		source: "assets/controls/move_next.png";
	}

	onClicked: { this.pressed() }
	onSelectPressed: { this.pressed() }
}
