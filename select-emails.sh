#!/bin/bash

Student_record=students-list_1023.txt
output_file="student-emails.txt"

#select just student emails
awk -F '{print $4}' "$students_file" > "$output_file"

echo "Emails selected and saved in $output_file."
