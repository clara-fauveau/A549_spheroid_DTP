//Asks the user to select the directory containing the images to analyze 
dir1 = getDirectory("Choose Source Directory ");

//Creates a subdirectory to save the analysis results 
File.makeDirectory(dir1+"analysis");

//Creates a list containing the names of the files in the selected directory 
list = getFileList(dir1);
//Stores the name of the directory
dossier = File.getName(dir1)

//Loops through all the files in the selected directory 
setBatchMode(true);
for (i=0; i<list.length; i++) {
	
    showProgress(i+1, list.length);
    filename = dir1 + list[i];
	//Selects only files in tif format    
    if (endsWith(filename, "tif")) {
    	
        open(filename);	
		//Sets the image scale and prepares image for segmentation         
        run("Set Scale...", "distance=136 known=0.5 unit=mm");
		run("Median...", "radius=2");
		run("8-bit");
		setAutoThreshold("Default");
		
		//Identifies spheroid outline and measures spheroid area		
		run("Analyze Particles...", "size=0.0100-Infinity circularity=0.03-1.00 show=Outlines display exclude include summarize");  
       
       //Save the image of the segmentation outline  
        name = replace(list[i], ".tif", "");
		saveAs("Tiff", dir1 + "analysis/" + name + "_spheroid_outline.tif");
	}
}
		
//Generates and saves the summary measurement table 		
run("Summarize");    
saveAs("Results", dir1 + "analysis/Results_" + dossier + ".csv");
