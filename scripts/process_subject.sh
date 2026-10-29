#!/bin/bash
# Preprocessing script: Reorient structural images and perform tissue/WMH segmentation

INPUT_T1="$1"
FIXED_DIR="$2"
OUTPUT_DIR="$3"

if [ -z "$INPUT_T1" ]; then
    echo "Usage: ./process_subject.sh <input_T1.nii.gz> [fixed_dir] [output_dir]"
    exit 1
fi

# Set default folder paths if not provided
FIXED_DIR="${FIXED_DIR:-../fixed}"
OUTPUT_DIR="${OUTPUT_DIR:-../output}"
mkdir -p "$FIXED_DIR" "$OUTPUT_DIR"

BASE_NAME=$(basename "$INPUT_T1")
FIXED_T1="${FIXED_DIR}/${BASE_NAME}"

echo "=========================================================="
echo "1. Reorienting input to ASL coordinate space..."
echo "=========================================================="
mri_convert --in_orientation ASL "$INPUT_T1" "$FIXED_T1"

echo "=========================================================="
echo "2. Running FSL FAST Tissue Segmentation Baseline Example..."
echo "=========================================================="
# Convert file type to NIFTI_GZ and run brain extraction (BET)
fslchfiletype NIFTI_GZ "$FIXED_T1" "${FIXED_DIR}/T1"
bet "${FIXED_DIR}/T1.nii.gz" "${FIXED_DIR}/T1_brain.nii.gz"
fast "${FIXED_DIR}/T1_brain.nii.gz"

# Threshold and binarize the Gray Matter partial volume estimate (pve_1)
fslmaths "${FIXED_DIR}/T1_brain_pve_1" -thr 0.5 -bin "${OUTPUT_DIR}/gm"
echo "Gray Matter Volume Metrics:"
fslstats "${OUTPUT_DIR}/gm" -V
