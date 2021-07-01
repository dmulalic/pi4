# Pi4

## Creating a group on Linux

To create a new group, type the following command: `groupadd [-g group-ID] <group-name>`, where *group-ID* is optional.

## Creating a User

If you are signed in as the root user, you can create a new user by typing:

```
adduser newuser
```
This will create a group for the user.

To add user to a new group type the following command: `usermod -aG tomcat <newuser>`

## First-Time Git Setup 

```
git config --global user.name "Denis Mulalic"
git config --global user.email demu4731@example.com"
```

### Checking Your Settings

```
git config --list
git config user.name
```
