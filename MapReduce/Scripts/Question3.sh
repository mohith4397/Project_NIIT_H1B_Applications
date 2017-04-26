hadoop com.sun.tools.javac.Main *.java
jar cf Question3.jar Question3*.class
hadoop fs -rm -r -f /Project/Mapreduce/output/Question3
hadoop jar Question3.jar Question3 /Project/input/ /Project/Mapreduce/output/Question3
hadoop fs -cat /Project/Mapreduce/output/Question3/p*
