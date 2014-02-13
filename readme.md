# Suicide Git
*The utterly massochistic approach to revision control.*

Introducing Suicide Git, (very obviously) inspired by [Suicide Linux](http://qntm.org/suicide).  Similar to Suicide Linux (SL), Suicide Git (SG) could also be likened to a "game", albeit one that might cost you your job/colleagues.  Frankly, I suggest not using it at all.  A very simple (bash) installation guide is below, regardless.

In a nutshell, any git command that exits with a non-zero status will trigger The Bomb *[[Keymaker](https://www.google.com/search?q=matrix+keymaker) voice]*.  This consists of:

1. Wiping repo history
2. Wiping repo contents
3. Creating a new, blank repo in its place
4. Adding a readme with the git error (the horror!)
5. Force pushing the new repo to all previous origins

## Installation
    git clone http://github.com/mway/suicide.git
    chmod +x suicide/install-bash.sh && suicide/install-bash.sh

## Usage
The install script copies the SG script to `/usr/local/bin/sg` and aliases `git` to it.  Best case, it's a transparent wrapper and you won't notice a difference.  Anything other than best case (we all have hams for hands sometimes), and you're gonna have a bad time.

    $ git           # we get a pass here
    $ git status    # fortunately, status is easy!
    $ git statsu    # crap!
    $ git foo       # foo? more like F@#$!
    $ git rebase    # conflicts? ruh roh!

## Contributing
SOP FFPP.  Fork, feature, PR, party.  Any comments/ideas/suggestions/contributions welcome, especially if they do incredibly confounding things that my git-fu is not currently capable of.

## Etc
Thanks especially to Suicide Linux and its creator, as well as whatever twisted netherrealm my brain exists in.
