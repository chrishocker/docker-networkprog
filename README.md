# docker-networkprog
Dockerfile for Network Programmability Containers

Developed for Docker for Mac.

Credit to Steven Carter.

## Step 1 - Clone Repo
```
git clone ...
```

## Step 2 - Modify Dockerfile
Replace chocker in lines 11,13,14, and 15 for your OSX username.

## Step 3 - Build Container
Replace chocker for your OSX username.

```
docker build -t 'chocker/netprog:latest' .
```

## Step 4 - Update Bash Profile

In your home directly, append the following to the end of the .bash_profile

```
function title {
    echo -ne "\033]0;"$*"\007"
}

docker-run()
{
  title $1
  docker run -it --rm --name $1 -e PS1="\u@${1}:\w\$ " -v /Users:/Users ${USER}/${1} /bin/bash
}
```

## Step 5 - Open New Shell and Launch Container
```
docker-run netprog
```
