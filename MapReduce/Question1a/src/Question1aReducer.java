import java.io.IOException; 
import org.apache.hadoop.io.LongWritable; 
import org.apache.hadoop.io.Text; 
import org.apache.hadoop.mapreduce.Reducer; 

public  class Question1aReducer extends Reducer <Text,LongWritable,Text,LongWritable> 
    {        LongWritable SUM=new LongWritable(0); int i=0; 
                String[] years={"2011","2012","2013","2014","2015","2016"}; 
        long [] arr=new long[6]; 
        public void reduce(Text key,Iterable<LongWritable> values ,Context context) throws IOException, InterruptedException
        { 
            long sum=0; 
            for(LongWritable val:values) 
            sum+=val.get(); 
            arr[i++]=sum; 
        } 
         
    public void cleanup(Context context) throws IOException, InterruptedException 
    { 
    for (int i=0;i<6;i++)     
        if (i==0) 
        context.write(new Text(years[i]), new LongWritable(0)); 
        else 
            context.write(new Text(years[i]),new LongWritable((arr[i]-arr[i-1])*100/arr[i-1])); 
     
    } 
         
    } 
