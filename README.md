# SemanGit

[![DOI](https://zenodo.org/badge/131811721.svg)](https://zenodo.org/badge/latestdoi/131811721)

The semantic git (SemanGit) is a novel resource description framework dataset consisting of information generated by the git protocol and its protocol extensions. So far, it contains nearly 20.000.000.000 triples about either native git protocol data or about social interactions on the GitHub platform. Please consider visiting our [Homepage](www.semangit.de) for news, downloads, contacts and a visualization of our ontology. Our Repositories contain Codes for creating the SemanGit dataset and additional material like scripts for automatic processing, conversion to rdf and basic documentation on the codes.

This repository is structured as follows:
  - **Documentation**: Contains our Ontology stored as RDF, instructions on the usage of our Converter to obtain the SemanGit datasets  
  - **Converter:** The heart of our project. A Java program which converts the monthly dumps from  [ghtorrent.org](www.ghtorrent.org) into the turtle file format for the Resource Description Framework (RDF). An initial instruction on the usage can be obtained [here](
        https://github.com/SemanGit/SemanGit/blob/master/Documentation/instructions/Compute_the_SemanGit_RDF_Dataset.pdf
     ). A short documentation on the different call parameters can be found in the respective repository.
  - **Linux Downloader:** A download tool writen for the Linux Shell, which automizes, logs and organizes the conversion. 

Note: The links to other submodules posted here will lead you to the latest stable version, we consider suitable for a release. These might not be newest version we provide in the Repositories SemanGit/Converter or Semangit/LinuxDownloader.

---

This fork contains extensions to the original SemanGit ontology and is used in experiments for Ontology-based data access on the GHTorrent MySQL dataset using [Ontop](https://ontop-vkg.org).
The extensions are contained in the [**obda**](obda) directory

For detailed insights and methodologies related to this project, please refer to the associated research paper:

Jafta, Y., Leenen, L., Meyer, T. (2023). Investigating Ontology-Based Data Access with GitHub. In: Pesquita, C., et al. The Semantic Web. ESWC 2023. Lecture Notes in Computer Science, vol 13870. Springer, Cham. https://doi.org/10.1007/978-3-031-33455-9_38
