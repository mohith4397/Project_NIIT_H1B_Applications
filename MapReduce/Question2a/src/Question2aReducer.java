import java.io.IOException;
import java.util.TreeMap;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
public  class Question2aReducer extends Reducer<Text,LongWritable,NullWritable,Text>
	{
		private TreeMap<LongWritable, Text> Top5DataEngineer = new TreeMap<LongWritable, Text>();
		long sum=0;
		public void reduce(Text key,Iterable <LongWritable> values,Context context) throws IOException, InterruptedException
		{
			sum=0;
			for(LongWritable val:values)
			{
			sum+=val.get();
			}
			Top5DataEngineer.put(new LongWritable(sum),new Text(key+","+sum));
			if (Top5DataEngineer.size()>5)
				Top5DataEngineer.remove(Top5DataEngineer.firstKey());
		}
		protected void cleanup(Context context)throws IOException, InterruptedException
		{
			for (Text t : Top5DataEngineer.descendingMap().values()) 
				context.write(NullWritable.get(), t);
		}				
	} 
