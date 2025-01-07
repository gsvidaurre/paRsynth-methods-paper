# paRsynth-methods-paper

This repository holds code for a methods manuscript on creating synthetic vocal identity signals with paRsynth and decoding information in the resulting synthetic vocalizations using traditional bioacoustics tools.

The repository holds methods manuscript drafts and feedback, as well as a code directory. The code directory holds the following scripts:

1. `Generate_SyntheticDatasets.Rmd`: Create two datasets of synthetic vocal identity signals that contain more group membership information or more individual identity information. The resulting audio files and metadata spreadsheet are saved in the shared Google Drive folder [paRsynth_methods_ms_data](https://drive.google.com/drive/folders/1_CJA-WVry3pANskbtCIx6fFwrc85dWUs?usp=sharing) for internal collaboration.

2. `Figures_SpectrogramLexicons.Rmd`: Generate spectrogram image files that will be used for a figure of call lexicons in the methods manuscript. The resulting image files are saved in the shared Google Drive folder [paRsynth_methods_ms_data](https://drive.google.com/drive/folders/1_CJA-WVry3pANskbtCIx6fFwrc85dWUs?usp=sharing) for internal collaboration.

3. `Figures_SPCCAcousticSpace.Rmd`: Perform spectrographic cross-correlation (SPCC) and multidimensional scaling to build low-dimensional acoustic space plots for more manuscript figures. The SPCC matrix is also saved on the shared Google Drive folder [paRsynth_methods_ms_data](https://drive.google.com/drive/folders/1_CJA-WVry3pANskbtCIx6fFwrc85dWUs?usp=sharing) to avoid having to rerun this computationally intensive code over and over. If we decide to change the vocal identity signal datasets in the first script, then SPCC should be performed again.

4. `Experiments_InformationEncoding.Rmd`: Run synthetic experiments to address how well the original information encoded at two social levels can be recovered with traditional bioacouustics tools (SPCC, k-means clustering, Normalized Mutual Information) over different social environment and information encoding treatments.
