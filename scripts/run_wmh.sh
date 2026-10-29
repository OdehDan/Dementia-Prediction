#!/bin/bash
# Execution Pipeline: FreeSurfer mri_WMHsynthseg to isolate White Matter Hyperintensities

INPUT_DIR="../fixed"
OUTPUT_DIR="../output"
CSV_OUT="../results/tissue_volumes.csv"

mkdir -p "$OUTPUT_DIR" ../results

echo "Starting bulk cohort White Matter Hyperintensity synthesis segmentation..."

# Run the automated deep-learning synthesis segmentation across the reoriented inputs folder
mri_WMHsynthseg --i "$INPUT_DIR" \
                --o "$OUTPUT_DIR" \
                --csv_vols "$CSV_OUT" \
                --device cpu \
                --threads 4 \
                --crop

echo "WMH Segmentation batch processing complete. Volume statistics logged to: ${CSV_OUT}"
