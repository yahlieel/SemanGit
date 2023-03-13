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

This fork contains extensions to the original SemanGit ontology that is used in experiments for Ontology-based data access on the GHTorrent MySQL dataset using [Onyop]([https://www.google.com](https://ontop-vkg.org/)).
The extensions are contained in the [**obda**](obda) directory
