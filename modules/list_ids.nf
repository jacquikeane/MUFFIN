process contig_list {
    label 'ubuntu'
    input:
    tuple val(name), path(bins)
    output:
    tuple val(name), path("*.contigs.list")
    shell:\
    """
    for bin in ${bins}/bin.*.fa
        do
        bin_name=\$(basename \$bin )
        cat \$bin | grep -o -E "^>\\w+\\.\\w+" |sed 's/>//g'| tr -d "@" > \$bin_name.contigs.list ;
        done ;
    """
}

