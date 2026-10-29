#!/bin/bash
# Preprocessing Pipeline: Brain Extraction (BET) and FSL FAST Automated Tissue Segmentation

INPUT_T1="$1"
FIXED_DIR="../fixed"
OUTPUT_DIR="../output"

if [ -z "$INPUT_T1" ]; then
    echo "Usage: ./tissue_extraction.sh <input_T1.nii.gz>"
    exit 1
fi

mkdir -p "$FIXED_DIR" "$OUTPUT_DIR"
BASE_NAME=$(basename "$INPUT_T1" .nii.gz)

echo "Extracting brain tissues for: ${BASE_NAME}"

# Step 1: Run FSL Brain Extraction Tool (BET) to isolate brain matter
bet "${INPUT_T1}" "${FIXED_DIR}/${BASE_NAME}_brain.nii.gz" -R -f 0.5 -g 0

# Step 2: Run FSL FAST to segment Gray Matter (GM), White Matter (WM), and CSF
fast -t 1 -n 3 -H 0.1 -I 4 -l 20 -v "${FIXED_DIR}/${BASE_NAME}_brain.nii.gz"

# Step 3: Copy final Partial Volume Estimates (PVE maps) to output directory
mv "${FIXED_DIR}/${BASE_NAME}_brain_pve_"* "$OUTPUT_DIR/"
echo "Tissue segmentation complete for ${BASE_NAME}."
