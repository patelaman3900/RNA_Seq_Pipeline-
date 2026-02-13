##Method 1: Install FastQC using Conda (RECOMMENDED)

#1️ Create a new conda environment (optional but best practice)
conda create -n fastqc_env python=3.10 -y
conda activate fastqc_env

#2️ Install FastQC (auto-installs all dependencies)
conda install -c bioconda fastqc -y

#3️ Verify installation
fastqc --version

#Dependencies installed automatically via Conda
 #Java (OpenJDK)
 #Perl
 #Core Unix tools
 #FastQC binaries

#No manual dependency handling needed

##Method 2: Install FastQC using APT (Ubuntu / WSL)

#1️ Update system
sudo apt update

#2️ Install FastQC and Java
sudo apt install fastqc default-jre -y

#3️ Verify
fastqc --version

#Example
# STEP 1: Run fastqc (same directory)
fastqc demo.fastq

# Using folder path 
fastqc input_folder_path/file_name.fastq -o output_folder_path/

#Run FastQC on multiple FASTQ files
fastqc *.fastq

#Paired-end FASTQ files
fastqc sample_R1.fastq sample_R2.fastq

#Specify output directory
mkdir -p fastqc_results
fastqc *.fastq -o fastqc_results

#Use multiple CPU threads (recommended)
fastqc *.fastq -t 8 -o fastqc_results

#Run FastQC in background (long jobs)
nohup fastqc *.fastq -t 8 -o fastqc_results &

#Check status:
jobs
