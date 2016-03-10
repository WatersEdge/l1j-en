# Aside #

Running this as a personal diary page isn't really in the spirit of wikis, but for the moment I think it's useful since it shows what's being pursued. Once we're up and running again this page can go to the digital void; anything useful can be moved to the faq.

# Introduction #

The l1j effort has been stagnant for awhile, but due to the increased interest in l1 private servers (and frankly, since I want some of the updates) there's interest in updating l1j-en.


# Details #

Several other l1j branches have been much better at keeping up with (not-so) recent client changes. l1j-jp2 and l1j-tw both seem to support at least 3.3, if not more recent clients. The short term goal is to get l1j-en back up to parity.

Things which would have to be done:
  * ~~Pick a branch of l1j to pull changes from - leaning towards l1j-jp2~~
  * ~~Setup machine to build and run server, and run backing database~~
  * Test server
    * Determine appropriate client
      * Get client
    * Determine how much needs to work before we start merging
  * Pull changes back to l1j-en & test
    * Probably try to merge stuff in chunks - while this might make for several revisions which couldn't be built, it avoids the Giant Revision of Doom.

Things which would be nice to do:
  * figure out a clean way of keeping multiple lineage clients installed at a time
  * translate some of the related pages for whichever l1j we use as a base.

# In-Progress #

  * Using l1j-jp2 as a base. Have recent versions building, but need to get second box at home working before I can really test server. At least it builds and runs now.
  * Now talked to several older contributors and left messages for some others who (very probably) have done something similar to plan

# Tricids extra plans #

I hope its ok if we share this document, if not remove me, but I think its a good idea for a temporary list of ideas/plans for now.

**y says** Feel free to add/remove/edit the above sections, that's the beauty of wiki. I was thinking of moving your points into the nice-to-have list, but then I realized you might prefer keeping them separate. Likewise, if my inline comments annoy you, feel free to move them. I tend to think of wikis as adequate documentation, but if it's not working for people we could start a mailing list.

  * I want user friendly install scripts for the server once we have it stable again.
  * An easy to maintain way to have branches/options within the code.  As an example if we have a maintainer from another server that wants to share his custom changes, with some config options and/or the install script, it can be optional to implement those changes, while keeping the more strict live like code in place as well.

**y says** Mind elaborating on this a little more? If you're talking about code changes, is there something wrong with using the normal /branches and /trunk for organization? We could possibly make /branches world writable and reserve /trunk for mainline development - or am I missing something obvious here? =) If we're talking about moving more gameplay options into config files, I agree that'd be nice - and there are definitely LOTS of places in the code that should probably be pulled out into constants, at which point it's easy to use the default value (allowing a config file to override it).

**t says** You got the last half right, but for the first half I mean that some possible configuration options may be easier to handle in pre-compile helper scripts, if that makes sense.  Hell it may make not make any sense outside of my own head lol.  Feel free to move what I added here around however you like.  I can't remember all teh wiki formatting tags anymore so you can probably keep it cleaner than I can

  * A seperate tools directory that I'll be uploading soon that I wrote that helped me with the maintanance of this project.  They were mostly ruby scripts that helped me do database merges with l1j-jp and things of that nature