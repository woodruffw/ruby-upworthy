# frozen_string_literal: true

# upworthy.rb
# Author: William Woodruff
# A Ruby translation of Mike Lacher's Upworthy Generator
# Translated from http://www.upworthygenerator.com/upworthy.js

# Namespace for constants and methods needed to generate headlines.
# @author William Woodruff
# @since 0.0.1
module Upworthy
  # @private
  VERSION = "0.0.2"

  # @private
  HEADLINES = [
    "You %<imploreaudio>s the %<creationadjective>s %<creationaudio>s this %<actoradjective>s %<actor>s %<createdsynonym>s",
    "You %<implorevisual>s the %<creationadjective>s %<creationvisual>s this %<actoradjective>s %<actor>s %<createdsynonym>s",
    "Here is what happens when a %<actor>s %<action>s",
    "That moment when a %<actor>s %<action>s",
    "I wish I was more %<pasttenseshocked>s by what a %<actoradjective>s %<actor>s %<revealed>s, but I'm not",
    "What happens when one %<actoradjective>s %<actor>s %<action>s",
    "Try not to %<yourreaction>s when you %<verbaudio>s %<audiofragmentwitharticle>s",
    "You will %<yourreaction>s when you see what a %<actoradjective>s %<actor>s %<createdsynonym>s",
    "Think %<preconception>s? Maybe you should listen to this %<actoradjective>s %<actor>s",
    "Some call it %<positivethingwitharticle>s. They call it %<negativethingwitharticle>s",
    "I thought it was %<negativethingwitharticle>s. But then I saw this %<creationadjective>s %<creationvisual>s",
    "I'll never look at this %<actoradjective>s %<actor>s the same way again",
    "If you can watch this and not feel %<pasttenseshocked>s, then %<youremadeofstone>s",
    "What this %<actoradjective>s %<actor>s did is genius",
    "Listen to %<audiofragmentwitharticle>s and try to tell me %<preconception>s",
    "Watch a %<actoradjective>s %<actor>s become a %<greatperson>s with %<creationaudio>s",
    "Before you say %<preconception>s, listen to %<audiofragmentwitharticle>s from a %<actor>s",
    "My %<jawhitthefloor>s after hearing %<audiofragmentwitharticle>s",
  ].freeze

  # @private
  CONTENT = {
    jawhitthefloor: [
      "jaw hit the floor",
      "heart broke",
      "head hurt",
      "heart is breaking",
      "brain exploded",
      "stomach sank",
      "tears keep flowing",
      "faith in humanity shattered",
      "hope for the world plummeted",
      "faith in humanity soared",
      "confidence in the next generation is stronger than ever",
      "disgust hit new lows",
    ],

    greatperson: [
      "hero",
      "inspiration",
      "role model",
      "legend",
    ],

    youremadeofstone: [
      "you're made of stone",
      "you have no emotions",
      "you are stronger than I am",
      "you are made of ice",
      "you have a heart of coal",
    ],

    positivethingwitharticle: [
      "the solution to world peace",
      "just another day",
      "the miracle of life",
      "the key to happiness",
      "a miracle",
      "a godsend",
      "the greatest thing that's ever happened",
      "the solution to climate change",
      "the answer to all our prayers",
      "what we've been waiting for",
      "the answer to world hunger",
      "the cure for childhood obesity",
      "a miracle drug",
      "a masterpiece",
      "the end of polio",
      "the cure for cancer",
      "the key to peace in the Middle East",
      "the end of all wars",
      "a victory against homophobia",
      "the end of racism",
    ],

    negativethingwitharticle: [
      "an inescapable curse",
      "a living nightmare",
      "the worst-case scenario",
      "the world's greatest tragedy",
      "a killer of children",
      "a travesty",
      "a menace to equality",
      "a homophobic nightmare",
      "education's enemy",
      "a deadly poison",
      "a silent genocide",
      "the worst kind of discrimination",
      "an ecological disaster",
      "a disaster",
      "a threat to all of us",
    ],

    preconception: [
      "discrimination is over",
      "America is the best country",
      "Africa is getting better",
      "partisian politics are killing America",
      "we're winning the war on terror",
      "the economy is better",
      "America's disparity in income is all bad",
      "babies can't be racist",
      "there aren't pedophiles in your neighborhood",
      "things are better than they used to be",
      "things used to be better when you were a kid",
      "polio isn't a threat in the US",
      "you're not racist",
      "you're not homophobic",
      "you've never discriminated against someone",
      "you're not a misogynist",
      "homophobia is on the decline",
      "babies can't be homophobic",
      "computers made the world a better place",
      "you're not addicted to your cell phone",
      "we're not in a housing bubble",
      "you have job security",
      "you could never die in a fire",
    ],

    yourreaction: [
      "let your jaw hit the floor",
      "gasp",
      "get angry",
      "lose your breath",
      "cry",
      "weep",
      "scream",
      "dig your fingernails into your desk",
      "punch your monitor",
      "do a double take",
      "shout with rage",
      "groan",
      "roll your eyes",
      "get upset",
      "be mortified",
      "rage",
    ],

    verbaudio: [
      "hear",
      "listen to",
    ],

    audiofragmentwitharticle: [
      "this one word",
      "these two sentences",
      "these six words",
      "this one statement",
      "this one sentence",
      "this one question",
      "these two questions",
      "these five words",
      "this one declaration",
      "these two words",
      "the second half of the third sentence",
      "the fifth and seventh words",
      "the first word and the last word",
      "the second sentence",
      "these twelve words",
      "this battlecry",
      "these five nouns",
      "this one verb",
      "the eighth word",
      "the first word and the second sentence",
      "the third question",
      "these nine words",
      "the last sentence",
    ],

    pasttenseshocked: %w[
      surprised
      revolted
      outraged
      disgusted
      depressed
    ],

    revealed: %w[
      revealed
      exposed
      documented
      proved
      publicized
    ],

    imploreaudio: [
      "won't believe",
      "have to hear",
      "don't want to have to think about",
      "should really think about listening to",
      "don't want to hear",
      "absolutely have to listen to",
      "won't really understand what's happening in the world until you hear",
      "need to drop everything and hear",
      "can't imagine",
      "can't fathom",
      "can't begin to understand",
    ],

    implorevisual: [
      "won't believe",
      "need to see",
      "should really think about watching",
      "can't imagine",
      "can't fathom",
      "can't begin to understand",
    ],

    creationvisual: [
      "short film",
      "music video",
      "twenty second video",
      "ten second video",
      "vlog",
      "one minute video",
      "fifty second video",
      "forty second video",
    ],

    creationaudio: [
      "one word",
      "two sentences",
      "three sentences",
      "five words",
      "two words",
      "three words",
      "four words",
      "three sentences",
      "one question",
      "one declaration",
      "six words",
      "ten words",
      "two words and a question",
    ],

    creationadjective: [
      "hilarious",
      "mindblowing",
      "scarily-accurate",
      "heartwrenching",
      "tearjerking",
      "saddening",
      "shocking",
      "amazing",
      "awe-inspiring",
      "troubling",
      "jaw-dropping",
      "brain-exploding",
      "tear-inducing",
      "outrageous",
      "pioneering",
      "revolutionary",
      "ridiculous",
      "sobering",
    ],

    actor: [
      "new mom",
      "seventh-grader",
      "physicist",
      "bullied teen",
      "science teacher",
      "eight year-old",
      "man",
      "woman",
      "comedian",
      "former model",
      "single dad",
      "former drug addict",
      "veteran",
      "Holocaust survivor",
      "trailblazer",
      "mother of three",
      "LGBT activist",
      "NBA coach",
      "converted racist",
      "former klansman",
      "witness to a murder",
      "tween",
      "high schooler",
      "cheerleader",
      "late night host",
      "teacher",
      "actor",
      "oscar winner",
      "millennial",
      "doctor",
      "talk show host",
      "actress",
      "stand-up comedian",
      "child star",
      "beauty queen",
      "model",
      "blogger",
      "mommy blogger",
      "criminologist",
      "sociologist",
      "cancer survivor",
      "cancer patient",
      "father of three",
      "teacher",
      "kindergartener",
      "author",
      "poet",
      "teenager",
      "criminal",
      "convict",
      "police officer",
      "plastic surgeon",
      "mayor",
      "city councilman",
      "senator",
      "animal rights activist",
      "community organizer",
      "music teacher",
      "pianist",
      "director",
      "fashonista",
    ],

    actoradjective: [
      "homeless",
      "bullied",
      "disgraced",
      "trailblazing",
      "transgender",
      "fearless",
      "introverted",
      "legendary",
      "forgotten",
      "iconic",
      "disabled",
      "blind",
      "autistic",
      "gay",
      "queer",
      "famous",
      "extroverted",
      "angry",
      "nostalgic",
      "slandered",
      "iconoclastic",
      "outraged",
      "unstoppable",
      "barrier-smashing",
      "unknown",
      "inspiring",
      "",
      "",
      "",
    ],

    action: [
      "won't give up",
      "doesn't take no for an answer",
      "says what none of us will",
      "lays it all out",
      "talks about the elephant in the room",
      "gets real about the biggest problem in America",
      "refuses to be silent",
      "starts a revolution",
      "doesn't worry about what anyone thinks",
      "stands up to the critics",
      "doesn't accept bullying",
      "throws political correctness out the window",
      "says what we've all thought",
      "speaks up for the voiceless",
      "stands up for the people who can't",
      "knows when it's time to make a stand",
      "won't retreat",
    ],

    createdsynonym: [
      "made",
      "wrote",
      "created",
      "found",
      "delighted the internet with",
      "came up with",
    ],
  }.freeze

  # Generates a new clickbait headline.
  # @example
  #  Upworthy.headline # => "Watch an extroverted police officer become a legend with six words"
  # @return [String] the headline
  def self.headline
    content = Hash[CONTENT.map { |k, v| [k, v.sample] }]

    (HEADLINES.sample % content).gsub("  ", " ")
  end
end
