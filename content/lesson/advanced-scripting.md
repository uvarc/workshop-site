---
title: "Advanced Scripting with bash"
author: "Neal Magee"
# date: 2015-07-23T21:13:14-05:00
categories: ["Advanced Research Computing"]
draft: true
---

<p class="lead">Scripts are powerful automation tools. You can use them to make repetitive tasks easier, to schedule tasks
to recur at regular intervals, or to look for certain conditions when they run. Scripts can also written to be interactive
or non-interactive. The most common scripting tool in Linux systems is the Bourne Again Shell (BASH).
</p>

Users should be sure they are familiar with basic CLI and environment resources and commands:

* [Shell variables](https://workshops.somrc.virginia.edu/lesson/command-line/#shell-variables)
* [Environment variables](https://workshops.somrc.virginia.edu/lesson/command-line/#environment-variables)
* [Interacting with remote systems](https://workshops.somrc.virginia.edu/lesson/command-line/#interact-with-other-systems)


## Shell Scripting

Scripts are simple ways of bundling up a series of commands to run in order. You can run your script manually, or scheduled to run automatically.

The basics of a shell script:

1. Start with a shebang to bash `#!/bin/bash`.
2. Add shell commands in the order you need and expect them to run.
3. Assume the script is running from its current location, so all paths should be explicit.

A simple example of a non-interactive script that clears the screen, pauses, then displays a quote from an API:

    #!/bin/bash

    clear
    sleep 3

    echo -e "Here is a quote of the day:\n\n"
    qod=`curl -s http://quotes.rest/qod.json | jq -r .contents.quotes[0].quote`
    echo "  " $qod
    echo ""

## More Information

* SOM Research Computing - https://somrc.virginia.edu/
* UVA Research Computing FAQ/Knowledgebase - https://discuss.rc.virginia.edu/
