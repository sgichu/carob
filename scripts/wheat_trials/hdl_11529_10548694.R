# R script for "carob"

carob_script <- function(path) {

"Description:

    [International Durum Yield Nurseries are replicated yield trials designed
    to measure the yield potential and adaptation of superior CIMMYT-bred spring
    durum wheat germplasm that have been developed from tests conducted under
    irrigation and induced stressed cropping conditions in northwest Mexico.
    These materials have been subjected to numerous diseases (leaf, stem and
    yellow rust; Septoria tritici blotch) and varied growing environments.
    It is distributed to 70 locations, and contains 50 entries. (2022)]"

	uri <- "hdl:11529/10548694"
	dataset_id <- carobiner::simple_uri(uri)
	group <- "wheat_trials"

	ff  <- carobiner::get_data(uri, path, group)
	js <- carobiner::get_metadata(dataset_id, path, group, major=1, minor=0)

	## dataset level data 
	dset <- data.frame(
		carobiner::extract_metadata(js, uri, group),
		project="International Durum Yield Nurseries",
		data_citation="Global Wheat Program; IWIN Collaborators; Ammar, Karim; Payne, Thomas, 2022, 53th International Durum Yield Nursery, https://hdl.handle.net/11529/10548695, CIMMYT Research Data & Software Repository Network, V1",
		publication=NA,
		data_institutions = "CIMMYT",
   		data_type="experiment", 
		carob_contributor="Blessing Dzuda",
		carob_date="2024-02-12"
	)
	
	proc_wheat <- carobiner::get_function("proc_wheat", path, group)
	d <- proc_wheat(ff, dataset_id)

	carobiner::write_files(dset, d, path=path)
}

