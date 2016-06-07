Simple container to support old compass based projects. (without gulp and nodejs).

##Build local container.

Put Dockerfile into theme folder which contains Gemfile and Gemfile.lock

`docker build -t pvcp .`

>pvcp - maybe any name(suggestion is project shortname)

Then add shell alias

`alias n='docker run --rm -it -v $(pwd):/work -w /work pvcp '`


####KNOWN ISSUES

Old version of omega has issue with ruby 2.1.8.
You need to change version of ffi gem in Gemfile.lock to 1.9.6
