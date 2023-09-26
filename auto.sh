#!/bin/bash

# Infinite loop
while true; do
    echo "Running 'make ho'..."
    make ho
    make up
    
    # Check the exit status of the 'make ho' command
    if [ $? -eq 0 ]; then
        echo "Successfully ran 'make ho'."
        
        bash user_data/strategy/create_new_strategy_version.sh
        # Run git add and git commit
        echo "Running 'git add'..."
        git add user_data/strategy/.
        echo "Running 'git commit'..."
        git commit -m "Auto commit"
#        git push origin
        
        # Sleep for a few seconds before running 'make ho' again
        sleep 10
    else
        echo "Failed to run 'make ho'. Retrying."
        sleep 10
    fi
done

