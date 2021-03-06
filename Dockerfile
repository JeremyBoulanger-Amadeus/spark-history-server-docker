ARG SPARK_IMAGE=gcr.io/spark-operator/spark:v2.4.0
FROM ${SPARK_IMAGE}

# Set up dependencies for Google Cloud Storage access.
RUN rm $SPARK_HOME/jars/guava-14.0.1.jar
ADD http://central.maven.org/maven2/com/google/guava/guava/23.0/guava-23.0.jar $SPARK_HOME/jars
# Add the connector jar needed to access Google Cloud Storage using the Hadoop FileSystem API.
ADD https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-latest-hadoop2.jar $SPARK_HOME/jars

# Add dependency for hadoop-aws
ADD http://central.maven.org/maven2/com/amazonaws/aws-java-sdk/1.7.4/aws-java-sdk-1.7.4.jar $SPARK_HOME/jars
# Add hadoop-aws to access Amazon S3
ADD http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.7.5/hadoop-aws-2.7.5.jar $SPARK_HOME/jars

ENTRYPOINT ["/opt/entrypoint.sh"]
