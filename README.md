# WeatherWizard

Welcome to Weather Wizard
What's an evil wizard to do when trapped in an app and forced to divine weather predictions for eternity?

# Getting Started

to build the project just a standard
`flutter pub get`

To run the project
`flutter run`

to run tests in the project
`flutter test`

## troubleshooting

I think that's it ¯\_(ツ)\_/¯

# Thoughts

I didn't get around to fully implementing all the challenge items, but hopefully you'll see my approach to building applications. THere were quite a few more things I wanted to add, here were some ideas

- A die to tap to reroll the wizards response, which would gradually get him to talk more about his dark past.
- Didn't get around to making him walk around the room. Was going to sync sprite movement to a particle effect that flashed and replaced the weather.

Things I know I didn't get to (all the data is there, just didn't have the time to put the UI together)

- UI controlled preferences
- migrating everything I wanted to over (I ended up going over time and hadn't gotten to my tests yet)
- hourly forecasts, data is there but was going to design another set of components for those.

As for the google map, I decided to take a stab at solving the problem with a different strategy. We need a location, I instead opted to integrate Google Gemini, both for extracting locations, and for driving the the text for the evil wizard to personalize things a bit more. I engineer prompts for the AI which knows the world's surface area well enough to essentially provide me lat/long coordinates.

Had a lot of fun doing this, thanks for your patience!

Other ideas to play with 
- world wonder button usable once per day, takes you to a world wonder, visible collection of visited wonders. 
  - Each wonder will have a special page dedicated to it.
- plant flags in places you've been and see how often you've been there. 
- visual indicator for how many people are "here" for any place you are. 
- special event, when user enters the app, the wizard is gone with portal in his room. On tap, a minigame occurs. 
- Add classic pixel game arrow buttons to travel up/down/left/right from a destination. doing so uses gemini to grid the area and provide next notable destination in matching cardinal direction.
- Collectable-on-tap resources (mana?) when visiting places. Maybe this contains the wizard, absent it, he can do crazy stuff, with it, _you_ can unlock new enhanced capabilities (customization, animated shaders, etc..) that demonstrate enhanced magic potential. 
  - Collectable resource generated decreases based on amount collected per unique environment per day (encouraging you to search places), coefficient tapers off.
- Write the wizards story, and piece it out incrementally by tracking what's been revealed and hidden. Add secret discoverables about his story, and a potential unlock to new areas or time periods. 
- Add interaction on evil wizard, on tap, he says something unrelated to the weather, enabling prodding for more info about him, cap the AI 
- Protect AI by introducing adversarial that evaluates your input message to asses whether you're trying to manipulate Gemini, if you are, the wizard catches you, and gives you a dead end response, and disappears afterwards. During this time, all searches only give exact results with no wizard response. 
- Add unlockable decks of pixel art cards for daily forecasts, including variants that have custom animated shader effects.

Fun for community (but trickier)
- Add community based progression of content unlocks based on geolocation. If region acquires enough mana, custom renderings for the region get added
- Add ability to influence what everyone sees on a region's page after reaching certain goals (maybe time sensitive, potentially monetizable)
- Replace static pixel art with procedurally generated scenes that enable dynamic content generation with areas you could potentially "enter" as secrets to explore.

These are all intent on exploring ways that, for an app you would normally come to daily to get information, to find new forms of value that make you want to come back, that give you something to look forward to and get joy and delight from as well. 