Build local container.

Put Dockerfile any place then run

`docker build -t front .`

Put Project file into theme folder, rename it to Dockerfile and run there

`docker build -t pvcp .`

* pvcp - maybe any name(suggestion is project shortname)

Then add shell alias

`alias n='docker run --rm -it -v $(pwd):/work -w /work pvcp '`

Finally use for build

`cd your-theme-folder` && `n gulp`


* you can use simple compass aswell (n compass watch --poll). it will use gems from your theme folder.





KNOWN ISSUES

Old version of omega has issue with ruby 2.1.8.
1) you need to change version of ffi gem in Gemfile.lock to 1.9.6
2) comment this line "RUN bower install --allow-root"


gulp watch command not works yet cause of port needs to be configured

