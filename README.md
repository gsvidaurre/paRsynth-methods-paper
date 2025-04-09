# paRsynth-methods-paper

This repository holds code for a methods manuscript on creating synthetic vocal identity signals with paRsynth and decoding information in the resulting synthetic vocalizations using traditional bioacoustics tools.

The repository holds methods manuscript drafts, feedback, code (scripts and functions), and figures (see directory `figures`).

The `functions` directory holds a function written by Vanessa Ferdinand to calculate the accuracy of predicting true class labels using k-means clustering. The function uses bipartite mapping between original class labels and cluster labels to calculate all possible accuracy values for a given clustering result. 

The `code` directory holds the following scripts:

1. `Generate_SyntheticDatasets.Rmd`: Create two datasets of synthetic vocal identity signals that contain more group membership information or more individual identity information. The resulting audio files and metadata spreadsheet are saved in the shared Google Drive folder [paRsynth_methods_ms_data](https://drive.google.com/drive/folders/1_CJA-WVry3pANskbtCIx6fFwrc85dWUs?usp=sharing) for internal collaboration.

2. `Figures_Spectrograms.Rmd`: Generate spectrogram image files that will be used for visual checks, and spectrograms used in main figures of call catalogues in the manuscript. Image files of spectrograms for visual checks are saved in the shared Google Drive folder [paRsynth_methods_ms_data](https://drive.google.com/drive/folders/1_CJA-WVry3pANskbtCIx6fFwrc85dWUs?usp=sharing) for internal collaboration. This script also contains code to create spectrograms `seewave::ggspectro()`, then resize images and write them back out with colored borders for publication-quality figures using `imagemagick`. 

3. `Figures_SPCC_EditDistance.Rmd`: Perform spectrographic cross-correlation (SPCC) to calculate acoustic similarity across all audio files in both datasets. Also calculate the distance amongst all strings using the Levenstein edit distance. Perform multidimensional scaling (MDS) on the SPCC matrix (converted to distances) and the edit distance matrix to convert these measurements to features. The SPCC and edit distance matrices and the MDS coordinates are also saved on the shared Google Drive folder [paRsynth_methods_ms_data](https://drive.google.com/drive/folders/1_CJA-WVry3pANskbtCIx6fFwrc85dWUs?usp=sharing) to avoid having to rerun this computationally intensive code over and over. Whenever the vocal identity signal datasets are changed in `Generate_SyntheticDatasets.Rmd`, then this script should be run again.

4. `Figures_MainAcousticSpacePlots.Rmd`: Read in the multidimensional scaling coordinates across call datasets and (dis)similarity methods to build low-dimensional acoustic space plots for main manuscript figures. These acoustic space plots are focused on SPCC and edit distance acoustic space, and polygons will be drawn by social level. For instance, the group membership data should be represented in a single main figure that includes a catalog of spectrograms, a panel of the edit distance acoustic space and a panel of SPCC acoustic space, both with group-level polygons.

5. `Figures_SupplementaryAcousticSpacePlots.Rmd`: Build acoustic space plots for supplementary figures to show call datasets with polygons drawn at both social levels, ad using both (dis)similarity methods.

6. `Experiments_InformationEncoding_Accuracy.Rmd`: Run synthetic experiments to address how well the original information encoded at two social levels can be detected using computational pipelines to measure call (dis)similarity with SPCC and the edit distance, and then use features generated per (dis)similarity method to cluster calls back to their original classes at each social level. These experiments are performed over different social conditions (numbers of groups and individuals in the simulated signaling environment) and information encoding treatments at the group and individual levels.
