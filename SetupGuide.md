# Server Setup Guide #

The following text is mostly a combination of the original setup guide, written on  Nov 4, 2008, and major recent rewording in response to feedback since then.

## Introduction ##

This document is a platform-independent guide to setting up and installing your own local instance of the L1J-En Lineage server.

Some words of caution:

  * This guide is, by necessity, platform independent. We support multiple OSes, and don't want to provide a guide for each. When something is OS-specific, it will be noted as such.
  * Along those lines, it's not possible to make a setup guide specific to every possible tool one could use.  Some tool-specific help will be provided here, but it will by necessity probably be inadequate if you require a complete step by step guide for your specific tool used.
  * If you want to competently run a server with a large player count, you'll probably need to know at least some of the emulator internals, at least on the database side.  Most people can get away without looking at a line of code though.
  * We are not responsible for anything that you do to your computer.

## Choosing an Update Method ##

You basically have 3 options:

### Using a Milestone Build ###

**Note that at the current time (2014-06-01), no milestone build is available for the S3ep1 client.  This is due to Google Code disabling adding new downloads.  So, we're unable to post a new m8 precompiled build.  The remainder of this section can be safely ignored until that changes.**

Acknowledging that not everyone is patient or skilled enough to follow this guide to completion. If you consider yourself a novice or have trouble at some point following the steps here, then you have the option of using a pre-built version of the server and a pre-packaged database that is associated with it. This will spare you multiple, potentially-confusing steps in this process. We will try to release milestones at points where either significant progress has been made, large amounts of code have been merged in, or a major client version becomes supported.

To use a milestone build, grab the latest pre-built server binary from the Downloads tab and check out the full repository from ONLY the revision in which it is noted to be associated with. Then use the l1jdb\_mX.sql file (where X is the number of the milestone) to build your database in MySQL. Once you've done this, jump to the configuration section below for the rest of the setup process.

If you want to run a permanent server that gets updated regularly or if you just want to keep up with the latest changes, then ignore the previous text in this section and go with the manual tracking.

### Tracking Current ###

This is the default setup assumed in most of this document.  You'll grab the source either here or on GitHub, follow the instructions for manually creating or updating your server, then when new changes are made, you'll apply the database changes new to you and rebuild the server codebase.

### Using a Config Manager ###

A new possibility recently opened up by some contributors is to use a tool like Vagrant to automate the deployment of the server and database.  These have both upsides (like sparing you from typing in a lot of commands and ensuring the proper order of them) and some downsides (like limiting you to deployment on a VM).  See the [l1j-vagrant project page](https://github.com/phuedx/l1j-vagrant) to explore this option.

There is some interest in posting pre-built VM images with the server and database installed.  If this comes to fruition, links will be provided here.

## The Game Client ##

Hopefully, you already have a copy of the last US client that you saved before the US servers went offline.  If not, you can still find copies of it online.  What you want is the Tikal/Antharas client, originally distributed as a file called "Lineage\_Tikal\_Antharas\_Update.zip".  This is also known as the S3ep1 client, or internally as version 3.0.  As a last resort, you can grab a hopefully-unmodified version of this client from a private server somewhere, and just replace the connector.  In the future, we'll provide a copy of this here, once we find a place to put it (it's large, at almost 2.5GB).

Next, you'll need to setup the connector.  The connector originally provided by NCSoft expects a loginserver at a specific IP address, and of course that no longer exists, nor would it do you much good for connecting to your own server even if it did.  This is provided here on the Downloads tab.  See Tricid's [Connector setup guide](http://code.google.com/p/l1j-en/wiki/NewConnector) for details on how to get this working.

Once you've got your client in order, you'll need something for it to connect to.  That's where this project has you covered.

## Accessing the Repository ##

To download the files contained in this repository, follow the instructions already provided by Google on the Source tab. You'll need an SVN client to create a local target for the repository, and the options provided by each vary per client. On this tab, you can also follow the latest changes or browse individual files remotely.

Some recommendations: The command line Subversion client is best for shell scripts, TortoiseSVN is popular for Windows users, Subclipse allows for integrated SVN access from the Eclipse IDE, and psvn.el is a full-featured Emacs SVN module.  If you're a casual Windows user, go with TortoiseSVN, which can be found [here](http://tortoisesvn.net/).

If you're using the [GitHub version of l1j-en](https://github.com/l1j/en), which does get updates more frequently than here now, follow the instructions on the GitHub help pages to setup your environment.

## Setting up your Environment ##

Like most MMOs, Lineage operates on a client-server, or n-tiered architecture (where n=3). These tiers consist of the presentation layer: the client, the application layer: the server, and the data layer: the database. The official Lineage 1 servers, as run by NCSoft, break out the server into components including the NPC server and login server. Here, these functions are all handled by a single, monolithic server.

The server is written in Java. If using a pre-built milestone, you'll only need a JRE installation of v1.6 or greater. Most Windows and OSX users will already have this installed. You may need to set system/user environmental variables to ensure that your PATH includes the directory for the JRE executables. If you intend to compile the latest source, you'll need the [Java SE Development Kit](http://www.oracle.com/technetwork/java/javase/downloads/index.html?ssSourceSiteId=otnjp) (also called the JDK). Compilation of the source can be done without an IDE, but an Eclipse-compatible .project file and an Ant build directive are already provided to make this much easier. Simply install Eclipse and load the project, then run the Ant build. Alternatively, if you want the latest source but don't feel like installing a huge IDE, just install the [Apache Ant](http://ant.apache.org/) build manager and run the build from the command line. Other IDEs can also be used, and project files for these may be provided later (if you create one for your favorite IDE, feel free to send it in).

A common problem is not having your JDK or JRE installed or accessible.  To check this, run "java" from a terminal or command prompt window.  If you get some scroll describing its usage, then that part is properly setup.  If not, then you either haven't installed it properly or forgot to set your environment's PATH variable.  To ensure just the JDK is installed, do the same but with "javac".

The database requires an installation of a database.  Multiple databases are supported by the data access layer, but [MySQL](http://www.mysql.com/) is the most common, so only that will be covered here. The community edition of MySQL is free, so download and install it. MySQL comes with a full-featured command line interface, from which you can perform any task relevant to working on the database. There are also several graphical interfaces to MySQL with varying subsets of the functionality of the CLI. Navicat is probably the most popular among Windows users and is reasonably priced.  Several exist of varying quality for Unix-variants. However, these aren't necessary and you can complete any database task using the prepackaged client from the command line.

## Installing ##

If you want to use the provided Ant build, simply run "ant" in the project root.  This will by default generate output in the form of a file named l1jen.jar. The server should compile without any errors. Some warnings may be generated, depending on your IDE's warning level setting. Most of these are unused variable declarations and log instances in packet classes, and are left in intentionally at the moment. You can suppress or ignore these if you want.  Now that we aren't tracking new client versions, these will be cleaned up eventually.

Log into your database instance and execute the base database installation script in the db/ subdirectory, called l1jdb\_mX.sql (where X is the current milestone build number). The base database creation script is the latest complete database from the time of the last milestone build. To convert this to the latest database (which you'll want to do if you're not using a milestone jar), you should then apply any update scripts to this milestone. The update currently being worked on will have a "-pending" appended to its filename. This means the queries within this update are still in progress and have not yet been finalized. Developers will try to keep additions to this as stable as possible, but it is only until after this update has been released that these are considered finished. You can tell that an update has finished when a new pending update is created. It may be the case that some server code change depends on a pending update change. If you've updated to a repository in this state, you can either apply the pending updates, or use an older revision. If a genuine error occurs, you can fix it yourself or let us know by submitting an issue with the file, line number, error returned, and the sequence of scripts executed up to that point.

Update: Recently, some contributors have been checking in database scripts outside of the numbered update system.  We'll try to incorporate these into standardized scripts soon, but in the meantime, you can ignore them if you're not sure you want their contents applied.

With these tasks complete, you can now create a directory for your server to execute from and copy over the startup script, the build .jar file, and the config, data, maps, and lib subdirectories to it. The maps.tar.bz2 file in /maps needs to be unpacked within /maps, too.  Alternatively, you can simply run it from its current project location.  However, if you plan to do development on the server, you'll want a separate execution folder for the server, separate from your local copy of the repository.

Before you can actually run the server, be sure to open config/server.properties and edit the "URL" parameter in the beginning of the file.  You'll need to make sure this matches the host and database name that you created earlier.  Do the same with the MySQL login and password.

Now would be a good time to test running the server to see if you've done everything up to this point correctly.  To do so, simply execute the startup script.  You have two options for this:

  * If on Windows, just run the serverstart-console.bat file.
  * If on a Unix-variant, chmod u+x serverstart.sh, then run it.

Some common problems are encountered here:

  * If you have a database connection error, check that MySQL is running, is accessible from where you're running it, and that you have the database name correct.
  * If you have a bunch of errors about missing tables or fields, then go back and check that you ran the database build in the correct order.
  * If you have an error when loading maps, then ensure that you unpacked them in the correct subdirectory.
  * If you can't see logs or emblems won't upload, be sure to create an emblem/ and log/ directory (these should be automated when running on **nixes).**

## Configuration ##

All configurable options are present in the config subdirectory. Any new feature that has been deemed as something other servers might want to deactivate or adjust has been left as a config setting. Most of these settings should be self-explanatory. If not, you can easily check references to it within the code to see how it is used.

The defaults are set to be as close to the live server as possible, but chances are you'll want to tweak a large number of them, so it's probably worth your time to carefully consider each of them.

With the config settings tweaked to your liking, you are now ready to log in and start farming furs and bone pieces.

Some common problems are encountered here:

  * If you can't see your server from the client, then take a look at the server console when you try to log in.  If it didn't recognize a connection attempt (in other words, it just says nothing when you try), then you probably setup the connector wrong.
  * If you get an error when logging in on the client side, then the most likely cause is a client to server version mismatch.  Be sure you're using the supported version for the version of the server you're using (trunk uses S3ep1).

## Making Modifications ##

So, you now have your own server up and running. If you did everything correctly, you should have a clean slate copy of what is currently in production on several live private servers (minus any player data, of course). If you used a pre-built milestone distribution, you'll have a snapshot of how it was at some point in the recent past.

Whether you're just a normal Lineage player you or have ambitions to host your own server, if you want to make modifications, you'll probably want to follow the latest source code. Bugs are fixed and features added on fairly regular basis, so make sure you understand the update process thoroughly before changing anything. If not, you may make changes that conflict with the current state of the codebase, which equals wasted effort. If you aren't sure what to change, take a look at the Issues tab on this site, which is an up to date listing of the things that need to be addressed. If you know about an issue not listed, go ahead and add it. You do not need to be a project member to add an issue to this list.

Once you've identified something you want to change, do so, and let us know about it!  If you fix something or add a feature, not only will many people appreciate it now, but all future servers that derive their code from here will owe you thanks. Not only are you helping others, but you'll also make for one less difference between your upstream that you'll have to factor into every merge.  See the main page of this project to get the full details.

## Getting Further Help ##

If you run into problems setting the server up, feel free to post on the [l1j-en user group](https://groups.google.com/forum/#!forum/l1j-en). You can probably also get help on #l1j on Freenode or on the [GitHub fork](https://github.com/l1j/en) where most of the active development occurs these days.  Between these you can get help from the core L1J-En userbase and other people following the latest code. If you've found what you're sure is a bug with the project itself, don't hesitate to add it to the Issues tab here or on GitHub.

There's a limit to how much can be modified via the config files.  A great deal more can be done if you expand your scope to custom database modifications.  For that, learning SQL from any of the tutorials online will make modifications here no problem.  Finally, to really change gameplay mechanics, you'll need at least some level of comfort with Java, which is what the server tier is written in.

## Helping Others Who Need Help ##

If you've made it through and set everything up, then congrats.  However, there seem to be a large supply of others who always seem to have problems.  One way to help them is to contribute alternative guides.  Several other setup guides existed in various private server forums, but these always disappeared when the server went offline.  Of particular use to newbies were the graphical guides specific to Windows.  If you have a copy of one of these or feel like writing one, let us know and we'll host it here.

Here's a few that we know of:

[Lineage Retribution's old setup guide](http://web.archive.org/web/20100430082609/http://www.retrib.net/wiki/Setting_up_your_own_L1J-EN_server_database): Only covers the database, but goes into a bit of extra detail than covered here.

[A video guide](https://www.youtube.com/watch?v=KBlMCjzcnhA): Probably is pretty accurate due to being recent.

## Conclusion ##

While admittedly not all-encompassing, this document hopefully demystifies server setup for those who are almost there but couldn't quite figure it out on their own. Literally anyone should be able to follow the steps here and have their own server up and running within an hour or two. Have fun, and let us know how it goes.