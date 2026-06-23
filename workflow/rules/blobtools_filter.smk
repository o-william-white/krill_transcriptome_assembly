rule blobtools_filter:
    input:
        "results/blobtools/bestsumorder_class_cindex.json",
        "results/blobtools/bestsumorder_class.json",
        "results/blobtools/bestsumorder_class_positions.json",
        "results/blobtools/bestsumorder_class_score.json",
        "results/blobtools/bestsumorder_family_cindex.json",
        "results/blobtools/bestsumorder_family.json",
        "results/blobtools/bestsumorder_family_positions.json",
        "results/blobtools/bestsumorder_family_score.json",
        "results/blobtools/bestsumorder_genus_cindex.json",
        "results/blobtools/bestsumorder_genus.json",
        "results/blobtools/bestsumorder_genus_positions.json",
        "results/blobtools/bestsumorder_genus_score.json",
        "results/blobtools/bestsumorder_kingdom_cindex.json",
        "results/blobtools/bestsumorder_kingdom.json",
        "results/blobtools/bestsumorder_kingdom_positions.json",
        "results/blobtools/bestsumorder_kingdom_score.json",
        "results/blobtools/bestsumorder_order_cindex.json",
        "results/blobtools/bestsumorder_order.json",
        "results/blobtools/bestsumorder_order_positions.json",
        "results/blobtools/bestsumorder_order_score.json",
        "results/blobtools/bestsumorder_phylum_cindex.json",
        "results/blobtools/bestsumorder_phylum.json",
        "results/blobtools/bestsumorder_phylum_positions.json",
        "results/blobtools/bestsumorder_phylum_score.json",
        "results/blobtools/bestsumorder_positions.json",
        "results/blobtools/bestsumorder_species_cindex.json",
        "results/blobtools/bestsumorder_species.json",
        "results/blobtools/bestsumorder_species_positions.json",
        "results/blobtools/bestsumorder_species_score.json",
        "results/blobtools/bestsumorder_superkingdom_cindex.json",
        "results/blobtools/bestsumorder_superkingdom.json",
        "results/blobtools/bestsumorder_superkingdom_positions.json",
        "results/blobtools/bestsumorder_superkingdom_score.json",
        "results/blobtools/gc.json",
        "results/blobtools/identifiers.json",
        "results/blobtools/length.json",
        "results/blobtools/meta.json",
        "results/blobtools/ncount.json",
    output:
        "results/blobtools/table.tsv",
    log:
        "logs/blobtools_filter.log",
    conda:
        "../envs/blobtools.yaml"
    shell:
        """
        blobtools filter \
            --table {output} \
            --table-fields gc,length,bestsumorder_superkingdom,bestsumorder_kingdom,bestsumorder_phylum,bestsumorder_class,bestsumorder_order,bestsumorder_family,bestsumorder_species \
            results/blobtools/ &>{log}
        """
