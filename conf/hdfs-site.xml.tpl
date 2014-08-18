<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<configuration>

  <property>
    <name>dfs.blocksize</name>
    <value>134217728</value>
  </property>

  <property>
    <name>dfs.namenode.handler.count</name>
    <value>{{ NAMENODE_SERVER_THREADS | default(50) }}</value>
  </property>

</configuration>
