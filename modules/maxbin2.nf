process maxbin2 {
    maxForks 1
    label 'maxbin2'
    publishDir "${params.output}/${name}/assemble/binning/maxbin2/", mode: 'copy', pattern: "maxbin_bin" 
    input:
    tuple val(name), path(assembly), path(ont), path(illumina)
    output:
    tuple val(name), path("maxbin_bin")
    shell:
    """
    run_MaxBin.pl -contig ${assembly}  -reads ${illumina[0]} -reads2 ${illumina[1]} -reads3 ${ont}  -out maxbin2 -thread ${task.cpus}
    mkdir maxbin_bin
    mv maxbin2.*.fasta maxbin_bin/
    """
        
}  // add -prob_threshold 0.5 -markerset 40 ??