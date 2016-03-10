# Introduction #

L1J-En is the active codebase for the L1J-En Lineage Server Emulator. It is an English language port of various L1J variants (mainly -jp and -tw), with a reworked database, numerous bugfixes, additional server/database features, and English-translated content.

The goal for L1J-En is to recreate as close as possible the final state of the US servers, minus most of the LoA additions.  The final English client release was S3ep1, or the Tikal/Antharas release, and that is the targeted client version for this emulator.  While some remaining polish will probably always be needed, most of the major problems with the server have been fixed, and one should be able to run a server with this codebase even with an extremely high user load (over 100 players isn't out of the question, if you can find that many people).

Note that a GitHub fork of this project was created [here](https://github.com/l1j/en).  Effort has been made recently to keep these two repositories in sync via merges both ways.  It may be the case in the future that the GitHub version attempts to support post-US shutdown clients.  If that happens, this repository will continue to stay on S3ep1.

## Repository Access ##

Read access is available to everyone. Simply point your favorite SVN client to our repository and start downloading. For help installing the server, see our [Setup Wiki](http://code.google.com/p/l1j-en/wiki/SetupGuide).

Commit access is available for anyone who requests. To get started, pick a bug off the issues list or one that annoys you while playing on the server, write a fix for it, and send it in.  Alternatively, clone the GitHub repo cited above, make your fixes there, and send in a pull request.  We'll try our best to make helping as easy as possible, as more development help is always needed.

## Legal Information ##

No proprietary information or copyrighted intellectual property are contained in this repository. L1J-En is available under the GNU General Public License Version 3. For more information on the GPLv3, and before using/modifying any code here, please read the full [GPLv3](http://www.gnu.org/licenses/gpl-3.0.html) text.

As this code is [free software](http://en.wikipedia.org/wiki/Free_software), there are no expressed or implied warrantees.  As this is an open source, volunteer effort, we are under no obligations to provide support to any consumers of this codebase.


## Project Owner Contact Info ##

If you have questions, try the [l1j-en user group](http://groups.google.com/group/l1j-en), the IRC channel #l1j on freenode, or contact tricidt@gmail.com or bm3719@gmail.com.


## Current Status ##

A recent merge to/from GitHub was completed.  The [FAQ](http://code.google.com/p/l1j-en/wiki/FAQ) and [Setup Guide](http://code.google.com/p/l1j-en/wiki/SetupGuide) have been recently updated as well.  Most likely active work will continue on GitHub with merges into this codebase as time permits.  Some things to look forward to:

  * A new full database script and binary build is probably forthcoming.
  * We'll look into finding a place to host the client for those unable to find a copy on their own.