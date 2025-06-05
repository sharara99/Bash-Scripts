#!/bin/bash

while true; do
    echo "Select menu (account - group)"
    echo "1) User"
    echo "2) Group"
    echo "3) Exit"
    read -p "Enter choice: " main_choice

    case $main_choice in
        1)
            while true; do
                echo -e "\nUser Menu:"
                echo "1) Add"
                echo "2) Delete"
                echo "3) Add user to group"
                echo "4) Back"
                read -p "Enter user option: " user_choice

                case $user_choice in
                    1)
                        read -p "Enter username to add: " username
                        sudo useradd "$username" && echo "User $username added successfully." || echo "Failed to add user."
                        ;;
                    2)
                        read -p "Enter username to delete: " username
                        sudo userdel "$username" && echo "User $username deleted successfully." || echo "Failed to delete user."
                        ;;
                    3)
                        read -p "Enter username: " username
                        read -p "Enter group to add $username to: " group
                        sudo usermod -aG "$group" "$username" && echo "User $username added to group $group." || echo "Failed to add user to group."
                        ;;
                    4)
                        break
                        ;;
                    *)
                        echo "Invalid option"
                        ;;
                esac
            done
            ;;
        2)
            while true; do
                echo -e "\nGroup Menu:"
                echo "1) Add"
                echo "2) Delete"
                echo "3) Rename"
                echo "4) Back"
                read -p "Enter group option: " group_choice

                case $group_choice in
                    1)
                        read -p "Enter group name to add: " groupname
                        sudo groupadd "$groupname" && echo "Group $groupname added successfully." || echo "Failed to add group."
                        ;;
                    2)
                        read -p "Enter group name to delete: " groupname
                        sudo groupdel "$groupname" && echo "Group $groupname deleted successfully." || echo "Failed to delete group."
                        ;;
                    3)
                        read -p "Enter old group name: " oldgroup
                        read -p "Enter new group name: " newgroup
                        sudo groupmod -n "$newgroup" "$oldgroup" && echo "Group renamed to $newgroup." || echo "Failed to rename group."
                        ;;
                    4)
                        break
                        ;;
                    *)
                        echo "Invalid option"
                        ;;
                esac
            done
            ;;
        3)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid choice!"
            ;;
    esac
done
