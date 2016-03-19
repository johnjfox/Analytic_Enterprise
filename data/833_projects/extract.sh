#!/bin/sh -f

grep  '^D: ' projects.txt | sed 's/^D: //' > projects.desc.txt
