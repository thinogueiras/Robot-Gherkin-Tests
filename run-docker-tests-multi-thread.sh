docker container run --rm -it \
    -u root \
    -v `pwd`/reports:/opt/robotframework/reports \
    -v `pwd`/resources:/opt/robotframework/resources \
    -v `pwd`/tests:/opt/robotframework/tests \
    -e ROBOT_THREADS=12 \
    -e PABOT_OPTIONS="--testlevelsplit" \
    ppodgorsek/robot-framework:latest