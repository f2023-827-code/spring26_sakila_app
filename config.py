# Developer: Team Member Tashfeen
# Date: June 15, 2026
# Task: Added database health metrics

import os

MYSQL_HOST = 'db-primary'
HEALTH_CHECK_INTERVAL = int(os.environ.get('HEALTH_CHECK_INTERVAL', '10'))
