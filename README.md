# k0s-WSL
Build and install a custom WSL image with k0s preinstalled

## Build the image
`docker build -t k0s-wsl:latest .`

## Launch the image and save the image for WSL
`docker run -d --rm --name temp-k0s-container k0s-wsl sh sleep 600`

`docker export temp-k0s-container > custom-k0s-rootfs.tar`

## Import into WSL
`wsl --import k0s C:\WSL\k0s .\custom-k0s-rootfs.tar --version 2`

## Edit the WSL settings
Add `-e bash -c "/usr/local/bin/k0s controller --single --enable-worker --no-taints"` to the end of the command line to launch k0s:
<img width="2593" height="1384" alt="image" src="https://github.com/user-attachments/assets/91ac4c03-9b67-4c0a-b3f2-d2d2ddb90370" />

Now when you launch the k0s instance you'll see the logs live!
<img width="2596" height="1389" alt="image" src="https://github.com/user-attachments/assets/738e5704-e0b0-43af-a1c3-0597dd9a50f9" />

You can log into the instance from PowerShell by running:
`wsl -d k0s -- bash`
You can then grab your kubeconfig file (use `ip` to get the IP address - you'll have to modify this)

