#!/bin/sh

postgres -p 5432 >logs 2>&1 &
sleep 1
psql