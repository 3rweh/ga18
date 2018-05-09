# ga18
Genome analysis, 10 credits, VT2018.

This README will be updated throughout the project and work as a diary.

-------------------------------------------------------------------------------------------------------------------------------
2018-04-10
Project planning with time estimates is almost done. Unfortunately the UPPMAX account wasn't activated, so the genome assembly couldn't get started. Hopefully, tomorrow the account will get accepted and the bash file can be written and executed from home. In that case, I can continue the thursday session without unnecessary waiting time for the genome assembly.

-------------------------------------------------------------------------------------------------------------------------------
2018-04-12
Since Uppmax will be shut down until monday next week, I took some extra time getting even more familiar with the article. I also went through the lecture slides for the De novo genome assembly, to get some answers for the "To think about" part underneath the Genome and Metagenome Assembly in the student manual. The question part underneath the Assembly evaluation also hade some answers in the lecture slides.

-------------------------------------------------------------------------------------------------------------------------------
2018-04-17
Uppmax is still shut down due to maintenance. However, today we were able to download the files needed for the genome assembly. I added folders with guidence from the student manual. Hopefully, this will be a structured help later on in the analysis. I will try to do the genome assembly locally from home on my own computer. This will help the progress since Uppmax will most likely be shut down untill friday this week. 

-------------------------------------------------------------------------------------------------------------------------------
2018-04-19
Today Uppmax was up and running! The genome assembly batch file was completed, and after som trail and error the work was succesfully uploaded to Uppmax. Therefore, all the thoughts of doing the genome assembly locally at home went out the window. Today's practise was really good and I got more familiar with the interface of Uppmax, and also how to get the batch file to work. Eva and Guilherme were super helpful and stayed over time. 

-------------------------------------------------------------------------------------------------------------------------------
2018-04-25
The results from the genome assembly was studied quickly, and then I created folders for the evaluation of the assembly. I did the evaluation and the annotation from a node on Uppmax. First I forgot to include the referencs assembly from the researchers. However, I fixed that before I went home. I also created the folders for the annoation results. The commands I executed in the node I saved as files in the code folder. Unfortunately, I didn't finnish the scripts for the trimming and for the BWA. I need to fix that before the lab on friday this week! 

-------------------------------------------------------------------------------------------------------------------------------
2018-04-26
I finnished the Trimmomatic part. Got help from Eva through email on how to fix the problem with the path to the adapter. Ran the job on the node at Uppmax, and it I didn't have to wait for much time before entering the node. Put the out files from Trimmomatic in the ~/analyses/01_preprocessing. Unfortunately I didn't fix the BWA script. Have to ask at the lab tomorrow. Will probably need to sit this weekend to get the necessary parts done.

-------------------------------------------------------------------------------------------------------------------------------
2018-04-27
Struggled with the BWA script and didn't figure out how to combine BWA mem with SAMtools. Put the scripting on ice due to Valborg festivities.

-------------------------------------------------------------------------------------------------------------------------------
2018-05-06
Started to work with the BWA script again. Took some extra time off due to illness. Got stuck and sent an email to the teachers.

-------------------------------------------------------------------------------------------------------------------------------
2018-05-07
Got a good answer from Andrea and I think I figured out how to write the BWA script. Tested a sub part of the code in a node at Uppmax before sending it as a complete batch job. The final version executes the BWA MEM "two and two" and converts the result files into a bam file directly. This to save a lot of space. The first infiles have a size of around 900 mb each and the resulting bam file resulted in around 2.9 gb. The execution time ended at 55 minutes for the two first infiles. 

-------------------------------------------------------------------------------------------------------------------------------
2018-05-08
Today I worked on the HTSeq script from home and got help from Eva through email. Unfortunately I missunderstood some information and removed wrong lines from the result.contigs.gfa. I renamed this file to result_modified.contig.gfa. After this I removed the correct lines from the correct PROkkA file. The FASTA part of the lepto.gff file in the prokka annotation folder. Finally I run the batch job. However, I missed two input options so the results went to the thrash the day after. 

-------------------------------------------------------------------------------------------------------------------------------
2018-05-09
Today I corrected the input options for the HTSeq and uploaded a job. Later I also uploaded a job for the homology search. 

