#!/bin/bash

Student_record="students-list_1023.txt"

#creating a student record
create_student_record() { echo "Enter student details:"
read -p "Student ID:" student_ID
read -p "Student name:" student_name
read -p "Student age:" student_age
read -p "Student email:" student_email

echo "$student_ID,$student_name,$student_age,$student_email" >> "$Student_record"
echo "Student has been successfully registered" }
}
#Viewing all student details
view_all_students() { 
    if [ -s $Student_record ]; 
        then  
            echo "Student ID | Name | Age| Email"
            echo "                              "
            cat "students-list_1023.txt" | while IFS=, read -r id name age email; do
            echo "$id | $name | $age | $email"
        done 
    else
    echo "No student registered"
    fi
}

#deleting the student record by ID
delete_student_record() { 
    read -p "Enter your Student ID" delete_ID
    sed -i "/^$delete_id,/d" "$Student_record"
    echo "Student with ID $delete_id has been deleted."
}

#Updating student record by ID

updating_student_record() { 
    read -p "Enter your Student ID" update_ID
    sed -i "/^$update_ID,/d" "Student_record"
    create_student_record
}

#Home

while true; do
echo "ALU registration system"
echo "1. Create Student Record"
echo "2. View All Students"
echo "3. Delete Student Record"
echo "4. Update Student Record"
echo "5. Exit"

read -p "Select from the drop down" Choice

case $Choice in
1) create_student_record ;;
2) view_all_students ;;
3) delete_student_record ;;
4) update_student_record ;;
5) echo " Exiting the ALU registration system, Thank you!"; exit 0 ;;
*) echo "Invalid choice, Please enter a valid choice." ;;
esac
done
