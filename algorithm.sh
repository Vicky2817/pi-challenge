#!/bin/bash

# Number of iterations (higher = more accuracy)
ITERATIONS=1000000
inside_circle=0

for ((i=0; i<ITERATIONS; i++)); do
    x=$(awk -v seed=$RANDOM 'BEGIN { srand(seed); print rand() }')
    y=$(awk -v seed=$RANDOM 'BEGIN { srand(seed); print rand() }')
    
    distance=$(echo "$x*$x + $y*$y" | bc -l)
    
    if (( $(echo "$distance <= 1" | bc -l) )); then
        ((inside_circle++))
    fi
done

pi=$(echo "4 * $inside_circle / $ITERATIONS" | bc -l)
echo "Estimated value of Pi: $pi"