Build local container

`docker build -t front .`

Then add shell alias

`alias n='docker run --rm -it -v $(pwd):/work -w /work front '`

Finally use for build

`cd your-theme-folder` && `n gulp`

TODO Files are created by root user in container, needs to `chown` to your local user.
