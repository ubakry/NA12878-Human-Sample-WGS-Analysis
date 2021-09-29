# NA12878 Human Sample WGS Analysis

```
# Download reference genome GRCh38
wget -c https://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/latest/*

# Download NA12878 sample fastq files
# URL: https://www.internationalgenome.org/data-portal/sample/NA12878
wget -c ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR622/SRR622461/SRR622461_2.fastq.gz	\
  ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR622/SRR622461/SRR622461_1.fastq.gz

# Download NA12878 sample vcf file
wget -c https://ftp-trace.ncbi.nih.gov/giab/ftp/release/NA12878_HG001/latest/GRCh38/*
```

## Used Tools in analysis
- Fastp
- BWA-MEM
- bgzip
- SAMTools
- GATK
- tabix
- BCFTools
- VCFTools
- VEP

