#!/bin/bash

# Convert photos from raw-photos to website/media/photos as WebP
# Uses local ImageMagick for conversion

# Get absolute paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INPUT_DIR="$SCRIPT_DIR/../raw-photos"
OUTPUT_DIR="$SCRIPT_DIR/../website/media/photos"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Track files by date to handle duplicates
declare -A date_counter

# Process each JPG file in raw-photos
for file in "$INPUT_DIR"/*.jpg; do
    # Get the filename without path
    filename=$(basename "$file")

    # Extract date from filename (YYYYMMDD format)
    if [[ $filename =~ ^([0-9]{4})([0-9]{2})([0-9]{2}) ]]; then
        year="${BASH_REMATCH[1]}"
        month="${BASH_REMATCH[2]}"
        day="${BASH_REMATCH[3]}"
        date_key="${year}-${month}-${day}"

        # Check if we've already processed a file with this date
        if [[ -n "${date_counter[$date_key]}" ]]; then
            # Increment counter for this date
            date_counter[$date_key]=$((date_counter[$date_key] + 1))
            output_name="${date_key}-${date_counter[$date_key]}.webp"
        else
            # First file with this date
            date_counter[$date_key]=1
            output_name="${date_key}.webp"
        fi

        echo "Converting: $filename -> $output_name"

        # Convert using ImageMagick (locally installed)
        # -auto-orient: automatically rotate image based on EXIF orientation
        # -resize: resize to max width 1200px for web display
        # -quality 85: quality 85% (good balance between size and quality)
        # -gravity: position watermark in bottom right corner
        # -pointsize: font size for watermark
        # -fill: watermark color (white with transparency)
        # -annotate: add text watermark with padding
        # Convert to /tmp first to avoid ImageMagick path policy issues
        temp_file="/tmp/$output_name"
        convert "$file" -auto-orient -resize 1200x \
            -gravity South -pointsize 24 -font Palatino-Roman -fill 'rgba(255,255,255,0.6)' \
            -annotate +0+20 '© Chadi El Masri' \
            -quality 85 "$temp_file"
        mv "$temp_file" "$OUTPUT_DIR/$output_name"
    else
        echo "Skipping $filename - doesn't match date format"
    fi
done

echo "Conversion complete!"
echo "Converted images are in $OUTPUT_DIR"
