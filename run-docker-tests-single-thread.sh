docker container run --rm -it \
    -u root \
    -v `pwd`/reports:/opt/robotframework/reports \
    -v `pwd`/resources:/opt/robotframework/resources \
    -v `pwd`/tests:/opt/robotframework/tests \
    ppodgorsek/robot-framework:latest