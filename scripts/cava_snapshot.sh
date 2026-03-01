#!/bin/bash
# ~/.config/eww/scripts/cava_visualizer.sh

# Function to format the raw data into a single line of ASCII
format_cava_output() {
    while read -r line; do
        echo "$line" | tr ';' ' ' | awk '{
            vis="";
            for(i=1; i<=NF; i++) {
                # Create a bar using block characters: ▁▂▃▄▅▆▇█
                # Adjust the mapping based on ascii_max_range (here 32)
                if ($i < 4) vis=vis"▁";
                else if ($i < 8) vis=vis"▂";
                else if ($i < 12) vis=vis"▃";
                else if ($i < 16) vis=vis"▄";
                else if ($i < 20) vis=vis"▅";
                else if ($i < 24) vis=vis"▆";
                else if ($i < 28) vis=vis"▇";
                else vis=vis"█";
            }
            print vis;
        }'
    done
}

# Run cava and pipe its formatted output to an Eww variable
cava -p /home/thomasr/.config/cava/config | format_cava_output | while read -r line; do
    eww update cava-ascii-string="$line"
done