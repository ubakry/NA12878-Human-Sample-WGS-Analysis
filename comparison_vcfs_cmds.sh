# Unzip NA12878 ctrl vcf file after change directory that contain the vcf
gunzip -k HG001_GRCh38_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf.gz 

# Rename the sample name in the vcf file
sed -i 's/HG001/NA12878/g' HG001_GRCh38_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf

# Unzip NA12878 extracted vcf file after change directory that contain the vcf
gunzip -k NA12878.vcf.gz 

# Compress and indexing vcf file
bgzip -c NA12878.vcf > NA12878.vcf.gz
tabix -p vcf NA12878.vcf.gz

# Filter vcf file by chromosomes
bcftools view -r chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chr20,chr21,chr22,chrX NA12878.vcf.gz > NA12878_filt.vcf

# Get count of mutation in each chromosome 
cat NA12878_filt.vcf | grep -v "^#" | cut -f1 | uniq -c

# Compare the two vcf files
time vcftools --vcf ./vcf/HG001_GRCh38_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf --diff ./vcf/NA12878_filt.vcf --out diff-site --diff-site
time vcftools --vcf ./vcf/HG001_GRCh38_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf --diff ./vcf/NA12878_filt.vcf --out diff-site-discordance --diff-site-discordance
time vcftools --vcf ./vcf/HG001_GRCh38_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf --diff ./vcf/NA12878_filt.vcf --out diff-discordance-matrix --diff-discordance-matrix

