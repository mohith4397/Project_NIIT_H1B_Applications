import java.io.IOException;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class Question2aMapper extends Mapper < LongWritable, Text, Text, LongWritable > {
    LongWritable one = new LongWritable(1);
    public void map(LongWritable key, Text values, Context context) throws IOException,
    InterruptedException {
        if (key.get() > 0)

        {

            String[] token = values.toString().split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)");
            if (token[4] != null && token[4].contains("DATA ENGINEER") && token[8] != null && !token[8].equals("NA")) {
                Text answer = new Text(token[8].replaceAll("\"", "") + "\t" + token[7]);
                context.write(answer, one);
            }
        }

    }

}