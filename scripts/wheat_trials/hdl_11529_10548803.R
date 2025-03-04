# R script for "carob"

carob_script <- function(path) {

"Description:

    [International Durum Yield Nurseries are replicated yield trials designed
    to measure the yield potential and adaptation of superior CIMMYT-bred spring
    durum wheat germplasm that have been developed from tests conducted under
    irrigation and induced stressed cropping conditions in northwest Mexico.
    These materials have been subjected to numerous diseases (leaf, stem and
    yellow rust; Septoria tritici blotch) and varied growing environments.
    It is distributed to 70 locations, and contains 50 entries. (2016)]"

	uri <- "hdl:11529/10548803"
	dataset_id <- carobiner::simple_uri(uri)
	group <- "wheat_trials"
	## dataset level data 
	dset <- data.frame(
		dataset_id = dataset_id,
		group=group,
		project="International Durum Yield Nursery",
		uri=uri,
		data_citation="Global Wheat Program; IWIN Collaborators; Ammar, Karim; Payne, Thomas, 2016. 48th International Durum Yield Nursery, https://hdl.handle.net/11529/10548035, CIMMYT Research Data & Software Repository Network, V1",
		publication=NA,
		data_institutions = "CIMMYT",
   		data_type="experiment", 
		carob_contributor="Blessing Dzuda",
		carob_date="2024-02-12"
	)


	ff  <- carobiner::get_data(uri, path, group)
	js <- carobiner::get_metadata(dataset_id, path, group, major=2, minor=0)
	dset$license <- carobiner::get_license(js)
	dset$title <- carobiner::get_title(js)
	dset$authors <- carobiner::get_authors(js)
	dset$description <- carobiner::get_description(js)
	
	proc_wheat <- carobiner::get_function("proc_wheat", path, group)
	d <- proc_wheat(ff)
	d$dataset_id <- dataset_id

	carobiner::write_files(dset, d, path=path)
}

