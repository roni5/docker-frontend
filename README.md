User this to build local container

`docker build -t d-front .`

`alias n='docker run --rm -t -v $(pwd):/work -w /work nn '`

and then `n bundler install`
