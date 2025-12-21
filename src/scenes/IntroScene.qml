Scene {
	id: introScene;
	backgroundImage: "assets/background/kitchen.jpg";
	backgroundMusic: "assets/music/intro.m4a";
	scenario: Scenario {
		Chapter {
			title: "entrypoint";

			TextLine {
				character: qsTr("Cat");
				text: qsTr("Hello!");
			}

			TextLine {
				character: qsTr("Cat");
				text: qsTr("Are you going to feed me or not?");
			}

			Choice {
				ChoiceOption {
					text: qsTr("Yes");
					jumpTo: "approveCase";

					onChoosed: { introScene.approveMethod(); }
				}

				ChoiceOption {
					text: qsTr("No");
					jumpTo: "declineCase";

					onChoosed: { introScene.declineMethod(); }
				}
			}
		}

		Chapter {
			title: "approveCase";

			TextLine {
				character: qsTr("Cat");
				text: qsTr(":3");
			}

			TextLine {
				character: qsTr("Cat");
				text: qsTr("Thank you!");
			}

			GotoObject {
				nextScene: "goodending";
			}
		}

		Chapter {
			title: "declineCase";

			TextLine {
				character: qsTr("Cat");
				text: qsTr(">:(");
			}

			TextLine {
				character: qsTr("Cat");
				text: qsTr("You'll regret this!");
			}

			GotoObject {
				nextScene: "badending";
			}
		}
	}

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
		textTypedDelay: 30;
		gradient: Gradient {
			GradientStop { color: "#0000"; position: 0.0; }
			GradientStop { color: "#0005"; position: 0.2; }
			GradientStop { color: "#000e"; position: 1.0; }
		}
	}

	ChoiceDialog {
		id: choice;
		delegate: ChoiceDelegate {
			onPressed: {
				introScene.handleChoice(model);
			}
		}
	}

	NextButton {
		anchors.right: parent.right;
		anchors.verticalCenter: dialog.verticalCenter;
		anchors.rightMargin: 20s;

		onPressed: { introScene.moveNext(); }
	}

	onTriggered(line): {
		if (line.text) {
			choice.reset();
			dialog.setText(line.character, line.text);
		} else if (line.choice) {
			choice.show(line.choice.options);
		}
	}

	approveMethod: {
		game.currentCatTag = "happy";
	}

	declineMethod: {
		game.currentCatTag = "angry";
	}
}
