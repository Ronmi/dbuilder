Build Debian package from source package with docker

# Synopsis

Just mount the folder contains source package to `/data`, and tell it which `.dsc` to build

```sh
# No matter how, just get your source package somewhere, like:
apt-get source dpkg=1.18.24

# You can cleanup everything after build, best for CI/CD integration
docker run -v `pwd`:/data ronmi/dbuilder -t --rm dpkg_1.18.24.dsc

# Give a name to container so you can reuse and debug with it with ease.
# It is best for developing.
docker run -v /home/me/mycode/mypkg:/data ronmi/dbuilder -t --name mypkg mypkg_1.0.0.dsc
# After modify your code and rebuild the source package, just restart the container.
# It will build for you again:
docker start -a mypkg

# It has a pre-build-hook for you to prepare the environment,
# like adding keys for 3rd party repositories... etc
echo '#!/bin/bash' > myhook
echo 'apt-key adv --keyserver pgp.mit.edu --recv-key 0000000000000000' >> myhook
echo 'deb http://some.where/3rdparty unstable main' > 3rdparty.list
chmod a+x myhook
docker run -v /home/me/mycode/mypkg:/data ronmi/dbuilder \
           -v `pwd`/3rdparty.list:/etc/apt/sources.list/3rdparty.list \
		   -v `pwd`/myhook:/prebuild \
		   -t --rm mypkg_1.0.0.dsc
```

# License

WTFPL
