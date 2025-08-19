# Code review for synthetic vocal identity signals paper

This branch holds a copy of all scripts for the purpose of code review. Code review will be performed by the co-authorship team to 1) ensure that all code can be evaluated and produce the expected output across different machines, and 2) the narrative text explaining code across scripts is accessible to readers. Code review starts with the lead coder, or the person who led a particular script, and then concludes with review by a co-author on the manuscript team. For this manuscript, all code review should be performed in RStudio in the original RMarkdown document, as well as knitting each RMarkdown document.

## First round of code review (lead coder)

1. Ensure that the final version of the code produces the expected output on your computer.

  - First check that the code in the RMarkdown document evaluates correctly, which should have already been part of your process of developing the script.
  
  - Then update the RMarkdown document to produce a clean knitted HTML report This includes:
  
     - Modifying the global chunk options to evaluate and include code in the HTML report.
     
     - Updating all paths you use to be the full path on your local machine, otherwise the RMarkdown knitting process will fail. You can do this in two different ways. You can update path variables to be the full path in every chunk. Alternatively, you can include an extra chunk above each chunk that uses a path, then use `eval = TRUE` and `echo = FALSE` to make sure that chunk is evaluated, but the code is not included in the report. If you do this, you must also use `eval = FALSE` and `echo = TRUE` in the subsequent chunk that does not use the full path to ensure that the code for that chunk is included but not evaluated.
     
     - Use the script `example_datasets/Example_Main_AcousticSpacePlots.Rmd` as an example of how to structure an RMarkdown file for knitting in the ways described above, as well as how to lay out the YAML header and global knitting options.
     
  - The final version of the knitted report should include all code and evaluated output (plots as well), but should not include messages, warnings, or errors. Any errors produced by a particular line or chunk of code should be noted in your narrative text.
  
2. Check all narrative text for clarity and typos at the end of your iterative RMarkdown knitting process.

3. Push the final RMarkdown document and knitted HTML report to the main and code review branches of the manuscript repository.

4. Let the co-author assigned to each of your scripts know that the RMarkdown document and knitted HTML report for each of your scripts are ready for them to review.

## Second round of code review (co-author)

1. Pull changes from this `code-review` branch, and focus on the following steps for one script at a time.

2. Read through the narrative text of the RMarkdown file and the knitted HTML report to make sure you understand the purpose of each code chunk. Do not modify the narrative text or code yet.

3. Ensure you've downloaded the most recent version of the example datasets or simulation results from Google Drive (depending on the script to which you're assigned).

4. Update the path variables in the RMarkdown file to reflect your local computer, then start running code chunks in order and check the output of each chunk.

  - Run code line by line inside of each chunk, and ensure that you understand what each line of code is doing. There should be narrative text above each chunk, and comments inside of the chunk, that indicate the purpose of either the overall code chunk or specific lines of code.
  
    - The only exception to running code line by line is the script `simulation_experiments/Simulation_Experiments.Rmd`. Co-authors assigned to review this script should focus on the two following levels of code review of the code chunk with nested loops that performs the simulation experiment:
    
      - Freeze the iterating variable to run code line by line inside of the nested loops for one experimental treatment combination. Focus on checking the code for correctness, clarity, and whether it produces the expected output. Repeat this process again a second time to check the code and output for another experimental treatment combination. Here you should run code inside of the looping structures (do not evaluate lines of code that contain `apply()` functions). Doing this is important to ensure you avoid running all treatment combinations, which is computational intensive.
      
      - Run the entire inner nested loop for one iteration of one experimental treatment combination. Here you will freeze the iterating variables again, but you will run code starting from the line with the inner `apply()` loop.
  
  - Whenever you encounter a chunk or a line of code that is not well explained, does not produce the correct output, or is wrong, write a comment above it to the lead coder in the following style "TODO: More information about what needs to change". When you find code that is wrong, please tell the lead coder how to fix the code if you see a solution for the problem.
  
  - Do not knit the RMarkdown file, as this will overwrite the version knitted by the lead coder.
  
  - When you are done, add "Code review completed by [insert your name]" underneath the global knitting options chunk when. Please do this even if you did not see any changes that need to be made to the RMarkdown script, so we can track that you completed your code review duties.
  
5. Repeat this process for each script to which you have been assigned.

6. Push the final RMarkdown document that you reviewed, including the comments you added, to the main and code review branches of the manuscript repository.

7. Let the lead coder for each of your scripts know that your feedback on the RMarkdown document is ready for them to integrate.

## Final code edits (lead coder)

1. The lead coder for each script should address all comments and feedback by the co-author who performed code review. After addressing feedback, knit the RMarkdown document one final time, then commit your changes with a description that states that you integrated or addressed all feedback from code review before pushing your changes to the `code-review` branch.

2. Once you have pushed to the `code-review` branch, make a pull request to merge your changes with the main branch of the repository. Grace will review and approve these final pull requests.

This branch should remain in the repository even after all changes have been integrated into the main repository, to maintain a history of all code review activities by our team.

## Code review assignments




