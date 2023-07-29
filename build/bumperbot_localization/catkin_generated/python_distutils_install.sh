#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/zq/bumperbot_ws/src/bumperbot_localization"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/zq/bumperbot_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/zq/bumperbot_ws/install/lib/python3/dist-packages:/home/zq/bumperbot_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/zq/bumperbot_ws/build" \
    "/usr/bin/python3" \
    "/home/zq/bumperbot_ws/src/bumperbot_localization/setup.py" \
     \
    build --build-base "/home/zq/bumperbot_ws/build/bumperbot_localization" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/zq/bumperbot_ws/install" --install-scripts="/home/zq/bumperbot_ws/install/bin"
