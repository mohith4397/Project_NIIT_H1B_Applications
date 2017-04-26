hadoop com.sun.tools.javac.Main *.java
jar cf Question2a.jar Question2a*.class
hadoop fs -rm -r -f /Project/output/Mapreduce/Question2a
hadoop jar Question2a.jar Question2a /Project/input/ /Project/output/Mapreduce/Question2a
hadoop fs -cat /Project/output/Mapreduce/Question2a/p*
