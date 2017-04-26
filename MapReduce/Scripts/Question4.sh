hadoop com.sun.tools.javac.Main *.java
jar cf Question4.jar Question4*.class
hadoop fs -rm -r -f /Project/output/Mapreduce/Question4
hadoop jar Question4.jar Question4 /Project/input/ /Project/output/Mapreduce/Question4
hadoop fs -cat /Project/output/Mapreduce/Question4/p*
