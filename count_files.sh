#!/bin/bash

count=$(find /etc -maxdepth 1 -type f | wc -l)
echo "Кількість файлів у /etc: $count"