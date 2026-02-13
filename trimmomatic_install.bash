#1️ Activate (or create) a conda environment
#You can reuse your FastQC environment or create a new one.

#Option A: Use existing environment
conda activate fastqc_env

#Option B: Create a new environment
conda create -n trim_env python=3.10 -y
conda activate trim_env

#2️ Install Trimmomatic (Bioconda)
conda install -c bioconda trimmomatic -y

#This automatically installs:
 #Java (OpenJDK)
 #Trimmomatic JAR
 #Required libraries

#3️ Verify installation
trimmomatic -version
or
which trimmomatic

#Location of adapters (important)
#Conda installs adapters here:
$CONDA_PREFIX/share/trimmomatic/adapters

#List adapters:
ls $CONDA_PREFIX/share/trimmomatic/adapters

#Example: Run Trimmomatic
 #Single-end reads
trimmomatic SE -threads 8 \
input.fastq output_trimmed.fastq \
ILLUMINACLIP:$CONDA_PREFIX/share/trimmomatic/adapters/TruSeq3-SE.fa:2:30:10 \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

 #Paired-end reads
trimmomatic PE -threads 8 \
R1.fastq R2.fastq \
R1_paired.fastq R1_unpaired.fastq \
R2_paired.fastq R2_unpaired.fastq \
ILLUMINACLIP:$CONDA_PREFIX/share/trimmomatic/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

#Recommended next step
 #After trimming, always run FastQC again:
fastqc *_paired.fastq -o fastqc_trimmed

#FastQC → Trimmomatic → FastQC → MultiQC