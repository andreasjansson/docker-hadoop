<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<configuration>

  <property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
  </property>
  
  <property>
    <name>mapred.child.java.opts</name>
    <value>{{ MAPRED_JAVA_OPTS | default("-Xmx2048m") }}</value>
  </property>

  <property>
    <name>mapreduce.tasktracker.map.tasks.maximum</name>
    <value>{{ MAP_TASKS_MAXIMUM }}</value>
  </property>

  <property>
    <name>mapreduce.tasktracker.reduce.tasks.maximum</name>
    <value>{{ REDUCE_TASKS_MAXIMUM }}</value>
  </property>

</configuration>
