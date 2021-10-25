# Smart Pension - Technical Challenge
Hi there! Mi name is David Franco, and this repo has the solution I've created for the Ruby technical challenge.

## How to run it
You'll need [bundler](https://bundler.io/) install in your machine. Once you have it, you'll need to run `bundle install` and now you're ready to use this awesome log parser!

As stated in the requirements you can run the parser by using the file called `parser.rb`. It receives a list of paths to parse (not only one). For example: `./parser.rb log/webserver.log`

## Considerations
* Based on the requirements, TDD and SOLID principles were mandatory. Most of the 'business logic' was coded following both practices. However, parser.rb file lacks of coverage. I would have liked to add the coverage but it would imply some research on best practices for testing CLI scripts and I honestly didn't allocate enough time for solving the challenge, my plan was timeboxing it at 3hs max.
* There were some improvements that I could have added like using a smarter LogFile creation allowing different file formats and being able to parse them accordingly with different strategies but I though it was quite overkilling.
* The approach is focused on files that can be easily handled in memory it's usually the case on webservers where logs are splitted when they're becoming too big. For big files I would take a 1-time read approach or  doing both calculations on the fly reading the file as a stream.

## Last words
I enjoyed a lot solving the challenge, it's super exciting coding with strong TDD and SOLID principles as a must-have, which in my experience is hard to find in real-life environments.


