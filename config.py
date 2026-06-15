# Developer: Rana Tashfeen Fazal & Team Member Jane Doe
# Date: June 15, 2026
# Task: Optimizing host configurations and adding health metrics

import os

MYSQL_HOST = 'sakila-db-server'
CONNECTION_TIMEOUT = int(os.environ.get('CONNECTION_TIMEOUT', '30'))
HEALTH_CHECK_INTERVAL = int(os.environ.get('HEALTH_CHECK_INTERVAL', '10'))
