=========================================================
gemset - manage different sets of Rubygems on your system
=========================================================

gemset is a simple replacement for RVM gemsets.

Usage
-----

Preparing the environment::

  $ gemset setup
  Now using gemset "default".

If you already have any gems installed, your current environment will be
made the "default" gemset::

  $ gemset setup
  Your current Rubygems environment was moved to a gemset named "default".
  Now using gemset "default".

Creating and using a gemset::

  $ gemset create rails3
  $ gemset use rails3
  Now using gemset "rails3".
  $ gem install rails3
  [...]
  $ gem list

  *** LOCAL GEMS ***

  abstract (1.0.0)
  actionmailer (3.0.0)
  actionpack (3.0.0)
  activemodel (3.0.0)
  activerecord (3.0.0)
  activeresource (3.0.0)
  activesupport (3.0.0)
  arel (1.0.1)
  builder (2.1.2)
  bundler (1.0.0)
  erubis (2.6.6)
  i18n (0.4.1)
  mail (2.2.6)
  mime-types (1.16)
  polyglot (0.3.1)
  rack (1.2.1)
  rack-mount (0.6.13)
  rack-test (0.5.4)
  rails (3.0.0)
  railties (3.0.0)
  rake (0.8.7)
  ruby-prof (0.9.2)
  sqlite3-ruby (1.3.1)
  thor (0.14.0)
  treetop (1.4.8)
  tzinfo (0.3.23)

Now changing back to the default gemset::

  $ gemset use default
  Now using gemset "default".
  $ gem list

  *** LOCAL GEMS ***

  bundler (1.0.0)

Listing existing gemsets (the gemset currently in use is marked with an
`*` and printed in green)::

  $ gemset list
  * default
    empty
    noosfero
    rails3

Inspecting gemset capabilities::

  $ gemset  usage
  gemset - manage different sets of Rubygems on your system

  Usage:

    gemset list                lists the existing gemsets.
    gemset create [NAME]       creates a new gemset
    gemset remove [NAME]       removes an existing gemset
    gemset show [NAME]         shows the gems installed in a gemset
    gemset use [NAME]          change to using an existing gemset
    gemset help                displays usage information

Features
--------

* Works no matter which interactive shell you use: bash, zsh, csh, tcsh,
  fish etc, are all welcome.
* Works outside of interactive shells. For example, if you change your
  default gemset even GUI applications started without a shell will have
  access to that gemset you changed to. This can also be considered a
  bug.
* Works transparently both for the superuser (root), creating global
  gemsets, and for regular users, creting user-specific gemsets.
* Respects ``$GEM_HOME`` (will manage gemsets in ``$GEM_HOME/..``).
* Works with Bundler.

Limitations
-----------

* Does not deal with the issue of multiple ruby interpreters being
  installed. (although if you manage to change which interpreter is
  called by the ``ruby`` binary, it should work). If you want to manage
  different ruby interpreter installation, you should use RVM or
  something else instead.

Copyright
---------

Copyright © 2010, Antonio Terceiro <terceiro@softwarelivre.org>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
