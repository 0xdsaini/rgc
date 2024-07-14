## Overview
The idea is simple. It uses `hg` (mercurial) under the hood to version control git's internal files.

## Requirements:
`apt-get install mercurial`

## Installation:
`dpkg -i build/rgc.deb`

## Usage
`$ rgc do`

`$ <Some risky git command>`

Messed it?

`$ rgc undo`

## FAQ
**1. Why can't we use copy-paste to just backup?**

**Ans.** Copy-paste can be a bit too much, it forces you to decide and keep track of folders manually, a mental overload. There is a reason why internet is still filled with users with post-messed repo help posts. `rgc` can be a pleasure.

**2. Why not use copy-paste internally?**

**Ans.** We planned to implement `rgc redo` so copy-paste won't cut it. Also, `rgc undo 2`, `rgc undo 3`... But we don't want to make it complicated so `rgc undo <n>` is highly unlikely to happen.

**3. Why not use git under the hood too instead of hg?**

**Ans.** Originally, the idea was to initialize a `.git` repo in parent directory but then git(in parent-dir) was considering inside .git repo as submodule and left no way to track internal files of inner `.git` repo. Have been using `hg` since then. Can change to `git` in newer versions once it is found git can work with another git repo inside, the way we want. For now, `hg` is fitting the bill very well.
