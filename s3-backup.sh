#!/bin/bash
#
# incremental backup to S3

s3cmd sync ~/Documents/ s3://eddsteel-backup/Documents/ --follow-symlinks --delete-removed
s3cmd sync ~/Photos/ s3://eddsteel-backup/Photos/ --follow-symlinks --delete-removed
