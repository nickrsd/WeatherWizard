import 'dart:math';

import 'package:weather_wizard/core/common/geolocation.dart';

extension CringyMessage on Geolocation {
  static String arrivalMessage(String place) {
    var arrivalComments = [
      "$place?! Can't we just go home?",
      "Well, I guess we're here",
      "$place eh? Not too bad",
      "$place's overrated.",
      "You know I'm old right?",
      "back in my dayyyy... ahh nvm.",
      "Ah, $place! I haven't been here in, oh, a few centuries.",
      "Last time I was in $place, dragons were still around.",
      "$place again? I should start charging you rent.",
      "Do they still remember me in $place?",
      "I've seen stones younger than the oldest tree in $place.",
      "Oh, $place! I left my cauldron here last time.",
      "$place! The last time I was here, it was just fields.",
      "They say $place never changes. They're wrong.",
      "$place, where the echoes of magic still linger.",
      "I knew $place before it was cool.",
      "$place! Great. Now, where did I park my broom?",
      "Watch out for the local cuisine in $place. Last time, it was... memorable.",
      "$place, home of that one tavern... What was its name again?",
      "I've a few centuries-old debts to settle in $place. Let's be quick.",
      "Ah, $place. I've told you about the dragon war here, haven't I?",
      "I used to go to school in $place. Yes, wizard school.",
      "If you find a spellbook in $place, it's probably mine.",
      "$place! I hope they've rebuilt that bridge I... uh, never mind.",
      "They used to tell legends of my exploits in $place. Probably still do.",
      "I've hidden a treasure somewhere in $place. Haven't found it since.",
      "$place, where my beard was only knee-high.",
      "Do you think $place has changed much in 300 years?",
      "$place! They still tell tales of the great blizzard. I caused that, you know.",
    ];

    return arrivalComments[Random().nextInt(arrivalComments.length)];
  }

  static String nothingAt(String place) {
    var arrivalComments = [
      "I told you '$place' was made up.",
      "Did you really think that would work?",
      "Nope, nothing here.",
      "Nadda. Zilch. Zip.",
      "Teleport isn't 'free,' you know.",
      "What even is a '$place'?",
      "I'd say good job... but...",
      "Even with my 500-year-old map, I can't find '$place'.",
      "‘$place’? Never heard of it. And I'm old.",
      "Are you sure '$place' isn't just a tavern you dreamt up?",
      "I think '$place' is just a myth. Like affordable potions.",
      "My old wizard bones can't handle wild goose chases to '$place'.",
      "‘$place’ sounds like a place where they'd burn my kind.",
      "Back in my day, '$place' was just a story to scare apprentices.",
      "‘$place’? That's just silly talk.",
      "Maybe '$place' exists in another realm. Not this one, though.",
      "I knew we should've taken a left turn at that last cloud.",
      "‘$place’? Sounds like a bad spell went wrong.",
      "I've traveled through time, and I've never come across a '$place'.",
      "‘$place’? Is that where young wizards go to be alone?",
      "You sure '$place' isn't just a state of mind?",
      "Legend speaks of a place called ‘$place’. Just not this legend.",
      "I think ‘$place’ is just a fancy name for ‘nowhere’.",
      "I've seen things you wouldn't believe, but never a ‘$place’.",
      "‘$place’? Oh, I remember! No, wait. No, I don't.",
      "Are we there yet? Because I don’t see ‘$place’ anywhere.",
      "‘$place’ sounds like a place I once cursed. Oops.",
      "Maybe ‘$place’ is invisible. Or maybe it's just not real.",
      "I could make ‘$place’ appear, but I left my wand in my other robe.",
      "‘$place’? Aha, a test! You can't fool an old wizard.",
    ];

    return arrivalComments[Random().nextInt(arrivalComments.length)];
  }
}
