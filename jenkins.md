
## Repos with Submodules

In the Github organization plugin, add the advanced submodule behaviors. [Also, you may need to add the "Checkout over SSH" behaviour (and provide an SSH 
key credential) if the submodule(s) use the SSH protocol](https://plugins.jenkins.io/git/).

#### Use credentials from default remote of parent repository
Use credentials from the default remote of the parent project. Submodule updates do not use credentials by default. Enabling this extension will provide 
the parent repository credentials to each of the submodule repositories. Submodule credentials require that the submodule repository must accept the same 
credentials as the parent project. If the parent project is cloned with https, then the authenticated submodule references must use https as well. If the 
parent project is cloned with ssh, then the authenticated submodule references must use ssh as well.
