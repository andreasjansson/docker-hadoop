<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<configuration>

  <property>
    <name>yarn.resourcemanager.hostname</name>
    <value>{% if ROLE == 'RESOURCEMANAGER' %}0.0.0.0{% else %}{{ RESOURCEMANAGER_HOST }}{% endif %}</value>
  </property>    

  <property>
    <name>yarn.resourcemanager.webapp.address</name>
    <value>${yarn.resourcemanager.hostname}:80</value>
  </property>

  <property>
    <name>yarn.resourcemanager.scheduler.class</name>
    <value>org.apache.hadoop.yarn.server.resourcemanager.scheduler.fair.FairScheduler</value>
  </property>

  <property>
    <name>yarn.nodemanager.address</name>
    <value>0.0.0.0:50001</value>
  </property>

</configuration>
