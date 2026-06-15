# Developer: Rana Tashfeen Fazal
# Date: June 15, 2026
# Task: Optimizing host configurations

import os

MYSQL_HOST = 'sakila-db-server'
CONNECTION_TIMEOUT = int(os.environ.get('CONNECTION_TIMEOUT', '30'))
