#R script for "carob"

## ISSUES
# ....

carob_script <- function(path) {
  
  "
Description:
The Elite Selection Wheat Yield Trial (ESWYT) is a replicated yield trial that contains spring bread wheat (Triticum aestivum) germplasm adapted to Mega-environment 1 (ME1) which represents the optimally irrigated, low rainfall areas. Major stresses include leaf, stem and yellow rusts, Karnal bunt, and lodging. Representative areas include the Gangetic Valley (India), the Indus Valley (Pakistan), the Nile Valley (Egypt), irrigated river valleys in parts of China (e.g. Chengdu), and the Yaqui Valley (Mexico). This ME encompasses 36 million hectares spread primarily over Asia and Africa between 350S -350N latitudes. White (amber)-grained types are preferred by consumers of wheat in the vast majority of the areas. It is distributed to upto 200 locations and contains 50 entries. (2015)
"
	uri <- "hdl:11529/10989"
	dataset_id <- carobiner::simple_uri(uri)
	group <- "wheat_trials"

	ff  <- carobiner::get_data(uri, path, group)
	js <- carobiner::get_metadata(dataset_id, path, group, major=4, minor=1)

	dset <- data.frame(
		carobiner::extract_metadata(js, uri, group),
		project="Elite Selection Wheat Yield Trial",
		publication = NA,
		data_citation = "Global Wheat Program; IWIN Collaborators; Singh, Ravi; Payne, Thomas, 2018, '36th Elite Selection Wheat Yield Trial', https://hdl.handle.net/11529/10989, CIMMYT Research Data & Software Repository Network, V4, UNF:6:kLxFsNDa8qNxvzNvutGQiQ== [fileUNF]",
		data_institutions = "CIMMYT",
		carob_contributor="Mitchelle Njukuya, Blessing Dzuda",
		carob_date="2023-11-14",
		data_type="on-station experiment" 
	)
  
  ## process file(s)
	proc_wheat <- carobiner::get_function("proc_wheat", path, group)
	d <- proc_wheat(ff, dataset_id)
  
  # all scripts must end like this
	carobiner::write_files(path, dset, d)
}

