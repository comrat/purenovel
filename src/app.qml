SceneManager {
	id: main;
	anchors.fill: context;
	clip: true;

	Consts { id: consts; }
	GameLogic { id: game; }

	//@using { src.menu.MenuPage }
	LazyActivity { name: "menu"; component: "src.menu.MenuPage"; }
	//@using { src.scenes.IntroScene }
	LazyActivity { name: "intro"; component: "src.scenes.IntroScene"; }

	onCompleted: {
		this.push("menu");
	}
}
