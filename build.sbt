name := """shorl"""
version := "1.0.0-rc"

lazy val root = (project in file(".")).enablePlugins(PlayScala)

scalaVersion := "2.11.7"

libraryDependencies ++= Seq(
  "org.json4s" %% "json4s-jackson" % "3.4.0",
  "org.json4s" %% "json4s-ext" % "3.4.0",
  "org.postgresql" % "postgresql" % "9.4.1209",
  "org.scalaz" %% "scalaz-core" % "7.2.6",
  "org.scalikejdbc" %% "scalikejdbc"                  % "2.4.+",
  "org.scalikejdbc" %% "scalikejdbc-config"           % "2.4.+",
  "org.scalikejdbc" %% "scalikejdbc-play-initializer" % "2.5.+",
  jdbc,
  evolutions,
  "org.scalatestplus.play" %% "scalatestplus-play" % "1.5.1" % Test
  )

resolvers ++= Seq(
  "scalaz-bintray" at "http://dl.bintray.com/scalaz/releases",
  Resolver.sonatypeRepo("public")
  )