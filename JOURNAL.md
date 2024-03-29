# Place to share thoughts as I go

I've been writing things down for myself along the way, beacuse that's just what I do!

## Some context (and the fresh repo)

First let me say that I've had a lot of fun working on this. Weather isn't particularly exciting to me, and it got me thinking about why, and how we engage with modern apps all the time just to quickly consume information. After thinking about it, I recognized that of course people do slow down and engage, but it likely has to connect in some way beyond the extrinsic motivators that saturate today's market. Cleverly optimized paterns on psychology to pull the levers that grant those short term extrinsic rewards.

> My time at Slickdeals taught me a lot about intrinsic motivators. Finding ways to make people >feel like people, feel special, or to evoke emotion- boy do they go a long way.

Eventually, I was going through all the options in the API data, and realizing just how much there is, and was thinking about how people used to swear by the magic of farmer almanacs in their ability to predict the future. I just pictured some old guy out on a farm in the middle of nowhere divining his great weather predictions and writing them down.... and that's when I totally pivoted on this.

### My new goal became

1. Obviously first and foremost needed to conquer the challenge requirements.
2. Created my own personal challenge, which was to show you all how I think on my feat when it comes to building software. I'm not just here to hack things out, I care about what I work on, and wanted you to see that, even if its a little messy, because it's real.
3. Find a way to give a user joy, something you might come back for, or share with another.
4. Use the opportunity to explore some things I haven't used before.

Then I found myself working on this here and there for the challenge, but was also exploring and experimenting beyond that because I felt like this was something I actually wanted to build for fun now and publish. I didn't want to cross too many wires with that pursuit and conquering the challenge, so I'm re-walking myself through the challenge in this repo to split that out, and using the opportunity to refactor and itereate on a few things that need it, so here we are!

# Development Journal

Already know I'll be using bloc. Plenty of good options out there, but personally love bloc and have been working with streams, RX, and reactive architectures for most of my career, so it always feels like home.

> The project structure will address separation of concerns >through application of clean architecture in a bloc setup.

It does mean a lot of folders and some levels of redundancy, but opting into that decision is an investment in the future, and early choices in architecture key choices in setting yourself up to fix your past later. It gets us a highly scalable, maintainable, testable pattern that has clear patterns and value we can immediately start capturing once we start mocking things.
