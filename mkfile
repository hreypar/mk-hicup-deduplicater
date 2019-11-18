# DESCRIPTION:
# mk module to run hicup_deduplicator
#
# USAGE:
# Single target execution: `mk <TARGET>` where TARGET is
# any line printed by the script `bin/targets`
#
# Multiple target execution in tandem `bin/targets | xargs mk`
#
# AUTHOR: HRG
#
# Load configuration file
< config.mk
#
# Run HiCUP deduplicator script
#
results/%.dedup.bam:	data/%.filt.sam
	mkdir -p `dirname $target`
	hicup_deduplicator \
		--threads $HD_THREADS_NUMBER \
		--zip \
		--outdir `dirname $target` \
		$prereq

