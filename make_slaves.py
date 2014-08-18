#!/usr/bin/env python

import os
import re
import json

slave_role = os.environ.get('SLAVE_ROLE', 'hadoop_slave')
servers = json.loads(os.environ['SERVERS'])
regex = re.compile('^%s(-[0-9]+)?$' % slave_role)

for server in servers.values():
    if regex.match(server['name']):
        print server['internal_ip']
