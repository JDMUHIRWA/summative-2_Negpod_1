# summative-2_Negpod_1
an application that registers students' details into the ALU registration system
#!/bin/bash

students_file="students-list_1023.txt"

# Function to create a student record
create_student_record() {
    echo "Enter student details:"
    read -p "Student ID: " student_id
    read -p "Student Name: " student_name
    read -p "Student Age: " student_age
    read -p "Student Email: " student_email

    echo "$student_id,$student_name,$student_age,$student_email" >> "$students_file"
    echo "Student record added successfully."
}

# Function to view all student records
view_all_students() {
    if [ -s "$students_file" ]; then
        echo "Student ID | Name | Age | Email"
        echo "---------------------------------"
        cat "$students_file" | while IFS=, read -r id name age email; do
            echo "$id | $name | $age | $email"
        done
    else
        echo "No student records available."
    fi
}

# Function to delete a student record by ID
delete_student_record() {
    read -p "Enter student ID to delete: " delete_id
    sed -i "/^$delete_id,/d" "$students_file"
    echo "Student record with ID $delete_id deleted."
}

# Function to update a student record by ID
update_student_record() {
    read -p "Enter student ID to update: " update_id
    sed -i "/^$update_id,/d" "$students_file"
    create_student_record
}

# Main menu
while true; do
    echo "ALU Registration System"
    echo "1. Create Student Record"
    echo "2. View All Students"
    echo "3. Delete Student Record"
    echo "4. Update Student Record"
    echo "5. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1) create_student_record ;;
        2) view_all_students ;;
        3) delete_student_record ;;
        4) update_student_record ;;
        5) echo "Exiting the ALU Registration System. Goodbye!"; exit 0 ;;
        *) echo "Invalid choice. Please enter a valid option." ;;
    esac
done
