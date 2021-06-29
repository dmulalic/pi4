# Project21.06.29 - Setting up OpenAM

## Install Java

```
sudo apt update
java -version
sudo apt install default-jdk
javac -version
```

## Set `JAVA_HOME` environment variable

Create a file `/etc/profile.d/jdk_home.sh and add the following:

```
export JAVA_HOME=/usr/lib/jvm/deafult-java/bin
```
