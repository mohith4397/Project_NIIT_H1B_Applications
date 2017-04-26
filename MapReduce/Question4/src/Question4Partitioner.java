import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Partitioner;

public class Question4Partitioner extends
Partitioner < Text, LongWritable > {
    @Override
    public int getPartition(Text key, LongWritable value, int numReduceTasks) {
        String[] str = key.toString().split("\t");
        if (str[1].equals("2011"))
            return 0;
        if (str[1].equals("2012"))
            return 1;
        if (str[1].equals("2013"))
            return 2;
        if (str[1].equals("2014"))
            return 3;
        if (str[1].equals("2015"))
            return 4;
        if (str[1].equals("2016"))
            return 5;
        else
            return 6;


    }
}