



@base_pairs = %w(
  AA AC AG AT AD AI
  CA CC CG CT CD CI
  GA GC GG GT GD GI
  TA TC TG TT TD TI
  IA IC IG IT ID II
  DA DC DG DT DD DI
)

@titles = [
  "Finite Sites Reticulate Hierarchical Coalescent Models and the Ron Jeremy Hypothesis",
  "The influence of relatives on the efficiency and error rate of familial searching",
  "A Developmental Network Theory of Gynandromorphs",
  "Genomic Copy Number Imbalances in Human Malignancies",
  "Phenotypic Plasticity (The Baldwin Effect)",
  "A genome wide dosage suppressor for Huntington's disease",
  "Detecting footprints of local adaptation using a Bayesian factor model",
  "Implications of the k-mer Distributions in the Human Genome",
  "A computational model for the distribution of heterochromatin",
  "Strong selective sweeps associated with ampliconic regions",
  "A Multivariate Biomarker for Parkinson's Disease",
  "Malignant field signature with localized Gleason 6 and 7 prostate cancer",
  "Systematic Target Function Annotation of Human Transcription Factors (2016)",
  "Genetic and pathological sources of corticobasal syndrome",
  "Alzheimer's disease beta-amyloid pathology",
  "Speculative role of Tmp21 mediated protein secretory pathway",
  "Parkinson disease as a TH17 dominant autoimmune disorder",
  "Contributory effects of alpha-synuclein production",
  "Bipartite Community Structure of eQTLs",
  "A hierarchical coding-window model of Parkinson's disease",
  "Detecting Genome-wide Joint Association among Low Marginal Effect loci",
  "Differential hydrophobicity in Huntington's disease",
  "Convergence of Y chromosome STR haplotypes",
  "In-vivo mutation rates and fitness landscape of HIV-1",
  "Enabling Privacy-Preserving GWAS in Heterogeneous Human Populations",
  "Demography-adjusted tests of neutrality based on genome-wide SNP data",
  "Assembly-based variant for Illumina resequencing",
  "Multivariate Functional Regression Models for Epistasis Analysis",
  "Application of Support Vector Machine and multiple SNP variations",
  "Detection of regulator genes and eQTLs in gene networks",
  "Genomic study of the Ket: a Paleo-Eskimo-related ethnic group",
  "The dichotomy structure of Y chromosome Haplogroup N",
  "Inferring the joint demographic history from multidimensional SNP frequency data",
  "Large-scale trans-eQTLs mediating patterns of transcriptional co-regulation",
  "Natural CMT2 variation and genome-wide methylation",
  "DISC1 genetic variants in schizophrenia",
  "Genetic Classification of Populations using Supervised Learning",
  "Signals of convergent adaptation to high altitude in Asia and America",
  "Archaic Hominin Introgressions in Eurasians",
  "Predictability of IL-28B-polymorphism on protease-inhibitor-based triple-therapy in chronic HCV-genotype-1 patients",
  "Extracellular matrix remodeling and neuronal development in myopia",
  "General triallelic frequency spectrum analysus under demographic models",
  "Integrative genomic identification of pericentromeric regions",
  "Friendship and Natural Selection",
  "Genome disorder and breast cancer susceptibility",
  "IKZF3, BATF and ESRRA as key transcription factors in type 1 diabetes",
  "quantification of somatic copy number alterations in heterogeneous tumor",
  "Heritability and Polygenic Modeling of Bipolar Disorder",
  "Polymerase activity and multinucleotide mutations in humans",
  "Genetic Variation of Diabetes-Associated Misfolded Human Proinsulin",
]
location_total = Location.count
3.times do
  # use the same Location for a whole set of studies to ensure matching at a point on the user
  @base_pairs.each do | base_pair |
    id = Random.rand(1..location_total)
      study = Study.create(
        description: Faker::Lorem.paragraph,
        name: @titles.shuffle.first
      )

      location = Location.find(id)
      sv = SnpValue.where(base_pair: base_pair, location_id: location.id).first_or_create
      study.snps << Snp.create(snppable_type: "study", snppable_id: study.id, snp_value_id: sv.id)
      # study.snps.first.snp_value = SnpValue.where(base_pair: base_pair, location_id: location).first_or_create
  end
end
researchers = []
36.times do
  researcher = User.create(
      first_name: Faker::Name.first_name,
      last_name:  Faker::Name.last_name + ", PhD",
      password: "password",
      email: Faker::Internet.safe_email
    )
    researcher.researcher_credential = ResearcherCredential.create(
      organization: Faker::University.name,
      description: "We like science and stuff"
    )

    researchers << researcher
end

Study.all.each do | study |
  user = researchers.shuffle.first
  user.studies << study
end
