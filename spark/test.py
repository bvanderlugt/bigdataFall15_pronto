from pyspark import SparkContext
from pyspark.streaming import StreamingContext

from operator import add

sc = SparkContext('local[*]', 'TestCount')
ssc = StreamingContext(sc, 60)

# From docs; I need:
# 1. define input source with DStreams
data = ssc.textFileStream('hdfs:///flume/pronto')

#2. Define the streaming computations by applying transformations and output operations to Dstreams

pairs = data.map(lambda x: (x.split(',')[0], int(x.split(',')[1])))

reduced = pairs.reduceByKey(add)

reduced.pprint()
# need to clear the contents after each file is loaded
reduced = ()

#3. Start receiving data and processing it using streamingContext.start()
ssc.start()
#4. Wait for the processing to be stopped using streamingContext.awaitTermination()
ssc.awaitTermination()



