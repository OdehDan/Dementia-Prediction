#!/bin/bash
# SBATCH job script to batch process all 436 subjects on the HPC cluster
#SBATCH --partition=full
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G

# Load required neuroimaging software module environment
module load freesurfer/8.1.0

INPUT_DIR="input"
FIXED_DIR="fixed"
OUTPUT_DIR="output"

mkdir -p "$FIXED_DIR" "$OUTPUT_DIR"

echo "Batch processing: Correcting T1 orientations to ASL format..."
for f in "${INPUT_DIR}"/*_T1.nii.gz; do
    if [ -f "$f" ]; then
        mri_convert --in_orientation ASL "$f" "${FIXED_DIR}/$(basename "$f")"
    fi
done

echo "Executing FreeSurfer multi-tissue and WMH SynthSeg pipeline..."
mri_WMHsynthseg --i "$FIXED_DIR/" \
                --o "$OUTPUT_DIR/" \
                --csv_vols wmh_volumes.csv \
                --device cpu \
                --threads 8

echo "Batch processing complete! Segmentation metrics saved to wmh_volumes.csv"
