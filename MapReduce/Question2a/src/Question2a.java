//2 a) Which part of the US has the most Data Engineer jobs for each year?
import java.io.IOException;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class Question2a 
{
	public static void main(String args[])  throws IOException, InterruptedException, ClassNotFoundException
	{
		  Configuration conf = new Configuration();
		  Job job = Job.getInstance(conf, "Top  5 Data Engineer in a worksite");

		  job.setJarByClass(Question2a.class);
		  job.setMapperClass(Question2aMapper.class);
		  job.setPartitionerClass(Question2aPartitioner.class);
		  job.setReducerClass(Question2aReducer.class);
		  	  
		  job.setNumReduceTasks(7);

		  job.setMapOutputKeyClass(Text.class);
		  job.setMapOutputValueClass(LongWritable.class);
		    
		  job.setOutputKeyClass(NullWritable.class);
		  job.setOutputValueClass(Text.class);
		  
		  FileInputFormat.addInputPath(job, new Path(args[0]));
		  FileOutputFormat.setOutputPath(job, new Path(args[1]));
		  System.exit(job.waitForCompletion(true) ? 0 : 1);

	  }

	
}
