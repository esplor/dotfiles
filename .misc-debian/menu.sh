#!/usr/bin/env sh

# Function to display the menu
show_menu() {
    echo "Choose an option:"
    echo "1. Option 1"
    echo "2. Option 2"
    echo "3. Option 3"
    echo "4. Execute all options"
    echo "5. Exit"
}

# Function to handle option 1
option_1() {
    echo "You chose Option 1"
    # Add actions for Option 1 here
}

# Function to handle option 2
option_2() {
    echo "You chose Option 2"
    # Add actions for Option 2 here
}

# Function to handle option 3
option_3() {
    echo "You chose Option 3"
    # Add actions for Option 3 here
}

# Function to execute all options
execute_all_options() {
    option_1
    option_2
    option_3
    echo "All options executed"
}

# Main menu loop
while true; do
    show_menu
    read -p "Enter your choice: " choice
    case $choice in
        1)
            option_1
            ;;
        2)
            option_2
            ;;
        3)
            option_3
            ;;
        4)
            execute_all_options
            ;;
        5)
            echo "Exiting the script"
            break
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 5."
            ;;
    esac
done
