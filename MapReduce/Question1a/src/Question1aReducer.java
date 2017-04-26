import java.io.IOException;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public  class Question1aReducer extends Reducer <Text,LongWritable,Text,LongWritable>
	{		LongWritable SUM=new LongWritable(0);
		public void reduce(Text key,Iterable<LongWritable> values ,Context context) throws IOException, InterruptedException
		{
			long sum=0;
			for(LongWritable val:values)
			sum+=val.get();
			SUM.set(sum);
			context.write(key,SUM);
		}
		
	}