#!/bin/bash
exec play --volume 0.5 /home/thomasr/Sounds/dice.mp3 &
# Roll a six-sided die
dice_faces=("⚀" "⚁" "⚂" "⚃" "⚄" "⚅")
# Send 8 rapid, random updates to simulate rolling
for i in {1..10}; do
    anim_index=$(( RANDOM % 6 ))
    eww update dice-button-text="${dice_faces[$anim_index]}"
    eww update animation_delay="150"
done
# Generate a random number 0-32767, then get remainder 0-5 then add 1
final_roll=$(( RANDOM % 6 ))
eww update dice-button-text="${dice_faces[$final_roll]}"