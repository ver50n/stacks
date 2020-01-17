#!/bin/bash
service mysql start
mysql -u root -e CREATE USER root@ IDENTIFIED BY root
CREATE DATABASE melting
mysqladmin -u root password 'root'