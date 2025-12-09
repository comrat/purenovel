SceneManager {
	id: main;
	anchors.fill: context;
	clip: true;

	Consts { id: consts; }
	GameLogic { id: game; }

	////////// Menu Pages //////////
	//@using { src.menu.MenuPage }
	LazyActivity { name: "menu"; component: "src.menu.MenuPage"; }
	//@using { src.menu.SettingsPage }
	LazyActivity { name: "settings"; component: "src.menu.SettingsPage"; }


	////////// Scenes //////////
	//@using { src.scenes.IntroScene }
	LazyActivity { name: "intro"; component: "src.scenes.IntroScene"; }
	//@using { src.scenes.GoodEndingScene }
	LazyActivity { name: "goodending"; component: "src.scenes.GoodEndingScene"; }
	//@using { src.scenes.BadEndingScene }
	LazyActivity { name: "badending"; component: "src.scenes.BadEndingScene"; }

	onCompleted: {
		this.push("menu");
	}
}
