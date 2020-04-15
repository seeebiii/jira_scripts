# jira_scripts

A collection of small shell scripts to download, start and stop Jira Server instances.
Supports Jira Software, Jira Core and Jira Service Desk.

**Note:** Use them for development purposes only.


## Install

First, clone the repo and create a local config file in your user folder:

```bash
$ git clone git@github.com:seeebiii/jira_scripts.git
$ cd jira_scripts
$ mv .jira_scripts.cfg ~/.jira_scripts.cfg
```

Make sure to adjust the `JIRA_DOWNLOAD_PATH` in the `~/.jira_scripts.cfg` file before continuing.
Then, make the different commands available to your preferred terminal.

#### zsh

In my setup, I'm using zsh, a symlink to this repository and aliases to the scripts but there are other ways.

```bash
$ ln -s ~/_scripts/jira ./jira_scripts/scripts
$ cat alias.txt >> ~/.zshrc
```


## Examples

Download Jira Software 8.8.0 and start it as a foreground process:

```bash
$ downloadJira 8.8.0
$ startJira 8.8.0
```

Simply stop it by using CTRL+C.


List all locally available Jira installations:

```bash
$ lsJira
```


Remove a Jira version that has been downloaded before:

```bash
$ removeJira 8.8.0
```


## Usage

### Download Jira

Downloads Jira to the download path configured in `~/.jira_scripts.cfg`.

```bash
$ downloadJira <jiraVersion> [jiraType]
```

- **jiraVersion**: the Jira version, e.g. 8.8.0
- **jiraType**: the type of Jira, i.e. `software`, `core` or `servicedesk`. Default: `software`


### Start Jira

Starts a Jira installation if it has been downloaded before.
It automatically starts Jira using a debug port and creates a `home` folder within the Jira installation folder.

```bash
$ startJira <jiraVersion> [debugPort] [jvmMemory] [jiraType]
```

- **jiraVersion**: the Jira version, e.g. 8.8.0
- **debugPort**: the debug port you'd like to use, e.g. 5005 (default). The default debug port can be configured in `~/.jira_scripts.cfg`
- **jvmMemory**: the JVM memory to be used in MB, e.g. 2048 (default). The default JVM memory can be configured in `~/.jira_scripts.cfg`
- **jiraType**: the type of Jira, i.e. `software`, `core` or `servicedesk`. Default: `software`


### List Jira Installations

Lists all available Jira installations that have been downloaded into the target Jira folder.

```bash
$ listJira
```


### Remove Jira

Removes a single Jira installation from the target Jira folder.

```bash
$ removeJira <jiraVersion> [jiraType]
```

- **jiraVersion**: the Jira version, e.g. 8.8.0
- **jiraType**: the type of Jira, i.e. `software`, `core` or `servicedesk`. Default: `software`


### Clean Jira

Cleans the home folder of a given Jira installation.

```bash
$ cleanJira <jiraVersion> [jiraType]
```

- **jiraVersion**: the Jira version, e.g. 8.8.0
- **jiraType**: the type of Jira, i.e. `software`, `core` or `servicedesk`. Default: `software`


### Stop Jira

Stops a running Jira.
Only useful if you're running the scripts as a background process.

```bash
$ stopJira <jiraVersion> [jiraType]
```

- **jiraVersion**: the Jira version, e.g. 8.8.0
- **jiraType**: the type of Jira, i.e. `software`, `core` or `servicedesk`. Default: `software`


## Pro Tip

If you're a plugin/add-on/app developer for Jira, then I can recommend using the
[QuickReload (QR) plugin from Atlassian](https://developer.atlassian.com/server/framework/atlassian-sdk/automatic-plugin-reinstallation-with-quickreload/).
It's watching the `target` folder of your plugin repository for new `.jar` or `.obr` files and automatically installs them to Jira.
You can download it from Atlassian's Maven repository:
https://packages.atlassian.com/content/repositories/atlassian-public/com/atlassian/labs/plugins/quickreload/


## License

MIT License

Copyright (c) 2020 Sebastian Hesse

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
