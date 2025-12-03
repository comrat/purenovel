Scene {
	id: introScene;
	backgroundImage: "assets/background/kitchen.jpg";

	Character {
		id: cat;
		name: "cat";
		tag: game.currentCatTag;
		anchors.right: parent.right;
		anchors.rightMargin: 300s;
		height: 600s;
	}

	DialogBox {
		id: dialog;
		gradient: Gradient {
			GradientStop { color: "#0000"; position: 0.0; }
			GradientStop { color: "#0005"; position: 0.2; }
			GradientStop { color: "#000e"; position: 1.0; }
		}
	}

	Choice {
		id: choice;
		delegate: ChoiceDelegate {
			onPressed: {
				introScene.handleChoice(model)
			}
		}
	}

	NextButton {
		anchors.right: parent.right;
		anchors.verticalCenter: dialog.verticalCenter;
		anchors.rightMargin: 20s;

		onPressed: { introScene.moveNext() }
	}

	onTriggered(line): {
		if (line.text) {
			choice.reset()
			dialog.setText(line.character, line.text);
		} else if (line.choice) {
			choice.show(line.choice.options)
		}
	}

	approveMethod: {
		game.currentCatTag = "happy";
	}

	declineMethod: {
		game.currentCatTag = "angry";
	}

	onCompleted: {
		var scenario = {
			"entrypoint": {
				"steps": [
					{
						"character": "Cat",
						"text": "Hello!"
					}, {
						"character": "Cat",
						"text": "Are you going to feed me or not?",
					}, {
						"choice": {
							"options": [
								{
									"text": "Yes",
									"jumpTo": "approveCase",
									"callback": "approveMethod"
								}, {
									"text": "No",
									"jumpTo": "declineCase",
									"callback": "declineMethod"
								}
							]
						}
					}
				]
			},
			"approveCase": {
				"steps": [
					{
						"character": "Cat",
						"text": ":3"
					}, {
						"character": "Cat",
						"text": "Thank you!"
					}, {
						"nextScene": "goodending"
					}
				]
			},
			"declineCase": {
				"steps": [
					{
						"character": "Cat",
						"text": ">:("
					}, {
						"character": "Cat",
						"text": "You'll regret this!"
					}, {
						"nextScene": "badending"
					}
				]
			}
		}
		this.setupScene(scenario);
		this.setSequence("entrypoint");
	}
}
