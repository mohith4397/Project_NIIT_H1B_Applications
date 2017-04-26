hadoop com.sun.tools.javac.Main *.java
jar cf Question1a.jar Question1a*.class
hadoop fs -rm -r -f /Project/output/Mapreduce/Question1a
hadoop jar Question1a.jar Question1a /Project/input/ /Project/output/Mapreduce/Question1a
echo -e "1 a) Is the number of petitions with Data Engineer job title increasing over time?\n\n"
hadoop fs -cat /Project/output/Mapreduce/Question1a/p*
