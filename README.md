# Synthetic vocal identity signals with paRsynth

This repository holds code for a paper on creating synthetic vocal identity signals by sonifying character strings with the `paRsynth` and `soundgen` packages, and detecting identity information in the resulting synthetic vocalizations using a traditional bioacoustics tool. The repository holds code (scripts and functions), as well as lightweight spreadsheets of results from our simulation experiments. 

The manuscript associated with this repository is:
<br />

*Sonifying character strings into synthetic vocal identity signals and testing identity information detection*. Coppinger, B.A, Eckhardt, S.G., Cross, A.†, Samman, R.†, Juárez, G.A.†, Ferdinand, V.\*, Smith-Vidaurre, G.\*

†equal contributions, \*co-senior authors
<br />

Below we describe the code and data directories and the files in each directory.

The **`code`** directory holds the sub-directories and scripts described below. Across each of these files, we make scripts available as RMarkdown files that can be used to reproduce our results. We also make the knitted HTML reports associated with each RMarkdown document available. These knitted reports document the results produced by this code on our local machines that were used to write the associated paper.

`./example_datasets`:

  1. `Generate_Example_Datasets.Rmd`: We created two datasets of synthetic vocal identity signals that contain more group membership information ("group-specific" dataset) or more individual identity information ("individually distinctive" dataset). During manuscript preparation, we saved the audio files and metadata spreadsheet produced on Grace's computer in a shared Google Drive folder for internal collaboration and code reviewing purposes.
  
  2. `Example_Spectrograms.Rmd`: Here we generated spectrogram image files that were used for preliminary visual inspection, as well as spectrograms that we used in call catalogues for main figures of the associated paper. Image files of spectrograms produced on Grace's computer for visual checks were saved during manuscript preparation in a shared Google Drive folder for internal collaboration purposes. This script also contains code to create spectrograms for main figures in the paper. For these spectrograms, we used `seewave::ggspectro()`, then we used `imagemagick` to resize image files and add colored borders for publication-quality figures.
  
  3. `Conceptual_Figure.Rmd`: This script contains code to build individual components of a conceptual figure highlighting the pipeline used to generate synthetic vocal identity signals through sonification of character strings with the `paRsynth` and `soundgen` packages.
  
  4. `Example_Datasets_Similarity_Calculations.Rmd`: Here we performed spectrographic cross-correlation (SPCC) to calculate acoustic similarity across all audio files in both example datasets generated above. We also calculated the distance amongst all character strings using the Levenshtein edit distance. We then carried out multidimensional scaling (MDS) on the SPCC matrix (after converting this to distance measurements) and the edit distance matrix to convert all distance measurements to features. The SPCC and edit distance matrices and the MDS coordinates produced on Grace's computer were also saved on the shared Google Drive folder to avoid having to rerun this computationally intensive code over and over during internal collaboration. Whenever the vocal identity signal datasets are changed in `Generate_Example_Datasets.Rmd`, this script should be run again.
  
  5. `Example_Main_AcousticSpacePlots.Rmd`: We used the multidimensional scaling coordinates across the example call datasets and distance measurement methods to build low-dimensional acoustic space plots for main manuscript figures. These acoustic space plots were focused on SPCC and edit distance acoustic spaces (a universal space per method), and we drew convex hull polgyons around sets of calls by the  social level that had the most identity information encoded. For instance, the main figure for the group-specific dataset included a catalogue of spectrograms, a panel of the edit distance acoustic space and a panel of SPCC acoustic space, both with group-level polygons.
  
  6. `Example_Supplementary_AcousticSpacePlots.Rmd`: In this script we built acoustic space plots for supplementary figures to show the two example vocalization datasets with polygons drawn at both social levels, as well as using both distance methods to analyze the character string and audio representations of the vocalizations. These plots include the full datasets of vocalizations and also represent a universal acoustic space. This is the same universal space represented in the acoustic space plots generated in `Example_Main_AcousticSpacePlots.Rmd`.
  
`./simulation_experiments`:
  
  1. `Simulation_Experiments.Rmd`: We carried out simulation experiments to address how well the original identiy information encoded at two social levels can be detected using computational pipelines that rely on distance measurements with SPCC (audio) and the edit distance (character strings). We then used multidimensional scaling features generated per distance method to cluster calls back to their original classes at each social level. These experiments were performed over different information encoding treatments at the group and individual levels and signaling environment densities (numbers of groups and individuals in the simulated signaling environment).
  
  2. `AccuracyPlots_EffectSize.Rmd`: We plotted the accuracy results from simulation experiments and calculated effect sizes for statistical inference about identity information detection performance. In this script we also made a figure of the accuracy value distributions and effect size results.
  
The `./functions` directory holds:

1. `accuracy_score.R`: This is a function written to calculate the accuracy of predicting true class labels using k-means clustering. The function uses bipartite matching between original class labels and cluster labels to calculate all possible accuracy values for a given clustering solution.

The **`simulation_results`** directory contains lightweight spreadsheets of accuracy values computed at the individual and group levels using spectrographic cross-correlation or the edit distance. Each spreadsheet in .csv format holds accuracy results computed across iterations for each treatment combination. The file name of each spreadsheet indicates the unique treatment combination (the number of classes and the amount of group information). Each row of the spreadsheet contains results from 1 iteration. These spreadsheets can be used as input in the script `./code/simulation_experiments/AccuracyPlots_EffectSize.Rmd`. Each spreadsheet contains the following columns and information:

- `n_groups, n_individuals, n_calls_per_level`: The number of simulated groups, individuals within groups, and synthetic vocalizations used at each level (group or individual). Together, these parameters represent the number of classes that was manipulated to simulate less or more crowded signaling environments. These manipulations were symmetric across social levels.

- `group_information`: The number of characters allocated to group membership information in each character string.

- `individual_information`: The number of characters allocated to group membership information in each character string.

- `iteration`: A unique numeric identifier for the iteration of each experimental treatment combination.

- `group_information_proportion`: The proportion of characters allocated to group membership information relative to the length of the identity information encoding section within each character string.

- `individual_information_proportion`: The proportion of characters allocated to individual identity information relative to the length of the identity information encoding section within each character string.

- `accuracy_SPCC_group`: The group-level accuracy value obtained using spectrographic cross-correlation (SPCC) (analysis of audio files). This value represents the maximum accuracy computed at the group level using bipartite matching.

- `accuracy_edit_group`:The group-level accuracy value obtained using the edit distance (analysis of character strings). This value represents the maximum accuracy computed at the group level using bipartite matching. 

- `accuracy_mean_SPCC_individual`: The individual-level accuracy value obtained using SPCC (analysis of audio files). This value was obtained by computing the maximum accuracy at the individual level within groups through bipartite matching, then taking the mean of these accuracy values across groups. 

- `accuracy_mean_edit_individual`: The individual-level accuracy value obtained using the edit distance (analysis of character strings). This value was obtained by computing the maximum accuracy at the individual level within groups through bipartite matching, then taking the mean of these accuracy values across groups. 

- `notes`: This column contains notes from different steps of the computational pipeline used to compute accuracy for each treatment combination. These notes were intended to capture information on how SPCC and edit distance matrices were modified prior to clustering analyses. Notes from different steps were separated using a semi-colon. Treatment combinations that did not have any modifications to SPCC or edit distance matrices should contain the pattern `; ;`.
