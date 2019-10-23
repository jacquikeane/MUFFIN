process metabat2 {
    label 'metabat2'
    if (params.out_metabat == true ) { publishDir "${params.output}/${name}_metabat2/", mode: 'copy', pattern: "bins_dir/metabat_bin/*" }
    input:
    set val(name), file(assembly), file(ont_bam), file(illumina_bam)
    output:
    set val(name), file("bins_dir")
    script:
    """
    metabat -i ${assembly} ${ont_bam} ${illumina_bam} -o bins_dir/metabat_bin -t ${task.cpus}
    """
}

process metabat2_extra {
    label 'metabat2'
    if (params.out_metabat == true ) { publishDir "${params.output}/${name}_metabat2/", mode: 'copy', pattern: "bins_dir/metabat_bin/*" }
    input:
    set val(name), file(assembly), file(ont_bam), file(illumina_bam)
    file(extra_bam)
    output:
    set val(name), file("bins_dir")
    script:
    """
    metabat -i ${assembly} ${ont_bam} ${illumina_bam} ${extra_bam} -o bins_dir/metabat_bin -t ${task.cpus}
    """
}