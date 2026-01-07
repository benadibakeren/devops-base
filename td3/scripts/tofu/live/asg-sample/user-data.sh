#!/bin/bash
cd /home/ec2-user
pm2 start app.config.js
pm2 save
