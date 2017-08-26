Scala+Sbt Docker image
==================

This image is based on Alpine Linux image, which is only a 5MB image, and contains
[Scala](http://www.scala-lang.org/) and [Sbt](http://www.scala-sbt.org/) based on Oracle JDK 8
[`frolvlad/alpine-oraclejdk8` slim image](https://hub.docker.com/r/frolvlad/alpine-oraclejdk8/).

Versions
------------
Scala: 2.12.3
Sbt: 1.0.0


Usage Example
-------------

```bash
$ docker run --rm marcusalmeida/alpine-scala-sbt scala -e 'object HelloWorld extends App { println("Hello World") };'
```

Once you have run this command you will get printed 'Hello World' from Scala!