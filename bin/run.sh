#!/bin/bash
# Example for running
docker run -ti --net=host -v /space:/space dockerinpractice/docker-dev-tools-image /bin/bash -c 'echo DEV: && /bin/bash'
