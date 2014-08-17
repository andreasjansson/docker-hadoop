<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<configuration>

  {% if ROLE == "namenode" %}

  <property>
    <name>dfs.namenode.name.dir</name>
    <value>file://var/hadoop/dfs/name</value>
  </property>

  <property>
    <name>dfs.blocksize</name>
    <value>134217728</value>
  </property>

  <property>
    <name>dfs.namenode.handler.count</name>
    <value>{{ NAMENODE_SERVER_THREADS | default(50) }}</value>
  </property>

  {% elif ROLE == "datanode" %}

  <property>
    <name>dfs.namenode.name.dir</name>
    <value>file://var/hadoop/dfs/data</value>
  </property>

  {% end %}

</configuration>
