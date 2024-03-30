# WeatherWizard

What's an evil wizard to do when trapped in an app and forced to divine weather predictions for eternity

# Getting Started

To run the project
`flutter run`

to test the project
`flutter test`

I think that's it ¯\_(ツ)\_/¯

# Thoughts

I didn't get around to fully implementing the challenges, but hopefully you'll see my approach to building applications. THere were quite a few more things I wanted to add, here were some ideas

- A die to tap to reroll the wizards response, which would gradually get him to talk more about his dark past.
- Didn't get around to making him walk around the room. Was going to sync sprite movement to a particle effect that flashed and replaced the weather.

Things I know I didn't get to (all the data is there, just didn't have the time to put the UI together)

- UI controlled preferences
- migrating everything I wanted to over (I ended up going over time and hadn't gotten to my tests yet)
- hourly forecasts, data is there but was going to design another set of components for those.

As for the google map, I decided to take a stab at solving the problem with a different strategy. We need a location, I instead opted to integrate Google Gemini, both for extracting locations, and for driving the the text for the evil wizard to personalize things a bit more. I engineer prompts for the AI which knows the world's surface area well enough to essentially provide me lat/long coordinates.

Had a lot of fun doing this, thanks for your patience!
