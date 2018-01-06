# Kucfg

 [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A tool for managing [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)
configurations.

## Install

To install the tool from a source directory:

```
$ make install
```

## Usage

Kucfg overwrites the "$HOME/.kube/config" file to make it a symbolic link to one
of the files located in the "$HOME/.kucfg" directory. Therefore to use the tool
you need to create this directory and put you kubectl configuration files there.

To avoid destroying important data it does not overwrite the
"$HOME/.kube/config" file if it is not a symbolic link.

Running the tool without arguments prints out its usage:

```
$ kucfg
Usage: kucfg version|list|current|set <config>
Shortcuts:
    c|cur current
    l|ls  list
    s     set
    v     version
```

Each command can be invoked with the corresponding shortcut.

### List

Once the configuration files are in the "$HOME/.kucfg" directory they appeared
as available in the listing:

```
$ kucfg list
minikube-admin
gce-admin
aws-admin
```

### Current

The current configuration is the file which is currently a target of the
"$HOME/.kube/config" file.

```
$ kucfg current
minikube-admin
```

### Set

To set the current configuration, i.e. update the "$HOME/.kube/config" symbolic
link with one of the available configuration files use the "set" command:

```
$ kucfg set gce-admin
```

## Troubleshooting

Sometimes it turns out that kubectl uses some other configuration rather than
that set as a current. That might happen if the "KUBECONFIG" variable is set.
Therefore kucfg warns while using the "set" or "list" commands if that variable
is set.

## Uninstall

To uninstall the tool from a sorouce directory:

```
$ make uninstall
```

Or simply remove the "/usr/local/bin/kucfg" file. Note: the file might be
located in a different directory if installation was customized.
