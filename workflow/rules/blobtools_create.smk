rule blobtools_create:
    input:
        "resources/taxdump/",
        "resources/taxdump/citations.dmp",
        "resources/taxdump/delnodes.dmp",
        "resources/taxdump/division.dmp",
        "resources/taxdump/excludedfromtype.dmp",
        "resources/taxdump/fullnamelineage.dmp",
        "resources/taxdump/gencode.dmp",
        "resources/taxdump/host.dmp",
        "resources/taxdump/images.dmp",
        "resources/taxdump/merged.dmp",
        "resources/taxdump/names.dmp",
        "resources/taxdump/nodes.dmp",
        "resources/taxdump/rankedlineage.dmp",
        "resources/taxdump/taxidlineage.dmp",
        "resources/taxdump/typematerial.dmp",
        "resources/taxdump/typeoftype.dmp",
        fas=TRINITY_FASTA,
        bla="results/diamond/blastx_taxid.txt",
    output:
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
    log:
        "logs/blobtools_create.log",
    conda:
        "../envs/blobtools.yaml"
    shell:
        """
        blobtools create \
            --fasta {input.fas} \
            --hits {input.bla} \
            --taxrule bestsumorder \
            --taxdump resources/taxdump \
            results/blobtools/ &>{log}
        """
