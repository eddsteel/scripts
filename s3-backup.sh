#!/bin/bash
#
# incremental backup to S3

s3cmd sync ~/var/phone-backup s3://eddsteel-backup/phone/ --follow-symlinks
s3cmd sync ~/txt s3://eddsteel-backup/txt/ --follow-symlinks
