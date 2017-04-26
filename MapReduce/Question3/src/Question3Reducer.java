import java.io.IOException;
import java.util.TreeMap;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
public class Question3Reducer extends Reducer < Text, LongWritable, NullWritable, Text > {
    private TreeMap < LongWritable,
    Text > DataScientistJobs = new TreeMap < LongWritable,
    Text > ();

    public void reduce(Text key, Iterable < LongWritable > values, Context context) throws IOException,
    InterruptedException {

        long sum = 0;
        for (LongWritable val: values)
            sum += val.get();

        DataScientistJobs.put(new LongWritable(sum), new Text(key.toString().replaceAll("\"", "") + "," + sum));
        if (DataScientistJobs.size() > 5)
            DataScientistJobs.remove(DataScientistJobs.firstKey());
    }

    protected void cleanup(Context context) throws IOException,
    InterruptedException {
        for (Text t: DataScientistJobs.descendingMap().values())
            context.write(NullWritable.get(), t);

    }

}