NAME = skilldlabs/frontend
TAGS = d7 latest omega_4_3 omega_4_4 zen

.PHONY: all build push

all: build push

build:
	set -e; for i in $(TAGS); do printf "\nBuilding $(NAME):$$i \n\n"; cd $$i; docker build -t $(NAME):$$i --no-cache --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` --build-arg VCS_REF=`git rev-parse --short HEAD` .; cd ..; done

push:
	set -e; for i in $(TAGS); do printf "\nPushing $(NAME):$$i \n\n"; docker push $(NAME):$$i; done
