import java.io.IOException;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class Question4Mapper extends Mapper < LongWritable, Text, Text, LongWritable > {
    LongWritable one = new LongWritable(1);
    public void map(LongWritable key, Text value, Context context) throws IOException,
    InterruptedException {
        if (key.get() > 0)

        {
            String[] token = value.toString().split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)");
            if (!token[1].equals("NA") && token[1] != null && !token[2].equals("NA") && token[2] != null && !token[7].equals("NA") && token[7] != null) {
                Text answer = new Text(token[2].replaceAll("\"", "") + "\t" + token[7]);
                context.write(answer, one);
            }
        }
    }
}