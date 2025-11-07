#!/bin/bash

# Generate HTML code for photos in website/media/photos
# Output: HTML div elements for each photo

# Get absolute paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PHOTOS_DIR="$SCRIPT_DIR/../website/media/photos"

# Process each WebP file in photos directory (in reverse order)
for file in $(ls -r "$PHOTOS_DIR"/*.webp); do
    # Get the filename without path
    filename=$(basename "$file")

    # Extract date from filename (YYYY-MM-DD format)
    if [[ $filename =~ ^([0-9]{4})-([0-9]{2})-([0-9]{2}) ]]; then
        year="${BASH_REMATCH[1]}"
        month="${BASH_REMATCH[2]}"
        day="${BASH_REMATCH[3]}"

        # Convert month number to name
        case $month in
            01) month_name="January" ;;
            02) month_name="February" ;;
            03) month_name="March" ;;
            04) month_name="April" ;;
            05) month_name="May" ;;
            06) month_name="June" ;;
            07) month_name="July" ;;
            08) month_name="August" ;;
            09) month_name="September" ;;
            10) month_name="October" ;;
            11) month_name="November" ;;
            12) month_name="December" ;;
        esac

        # Remove leading zero from day
        day_num=$((10#$day))

        # Generate HTML
        echo "<div class=\"photo-item\">"
        echo "    <img loading=\"lazy\" src=\"media/photos/$filename\" alt=\"Photo from $month_name $day_num, $year\" />"
        echo "</div>"
    fi
done
