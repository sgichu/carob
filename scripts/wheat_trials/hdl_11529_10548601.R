# R script for "carob"

carob_script <- function(path) {

"Description:

    [International Durum Yield Nurseries (IDYN) are replicated yield trials designed to measure the yield potential and adaptation of superior CIMMYT-bred spring durum wheat germplasm that have been developed from tests conducted under irrigation and induced stressed cropping conditions in northwest Mexico. These materials have been subjected to numerous diseases (leaf, stem and yellow rust; Septoria tritici blotch) and varied growing environments. It is distributed to 70 locations, and contains 50 entries. (2020)]

"
#### Identifiers
	uri <- "hdl:11529/10548601"
	group <- "wheat_trials"

# the script filename should be paste0(dataset_id, ".R")
	dataset_id <- carobiner::simple_uri(uri)

#### Download data 
	ff  <- carobiner::get_data(uri, path, group)
	js <- carobiner::get_metadata(dataset_id, path, group=group, major=4, minor=0)

##### dataset level metadata 
	dset <- data.frame(
	  carobiner::extract_metadata(js, uri, group),
	  data_citation="Global Wheat Program; IWIN Collaborators; Ammar, Karim; Payne, Thomas, 2021, 52nd International Durum Yield Nursery, https://hdl.handle.net/11529/10548601, CIMMYT Research Data & Software Repository Network, V4",
		data_institutions = "CIMMYT",
		publication=NA,
		project=NA,
		data_type= "experiment",
		carob_contributor= "Blessing Dzuda",
		carob_date="2024-02-22"
	)
	
##### PROCESS data records

	proc_wheat <- carobiner::get_function("proc_wheat", path, group)
	d <- proc_wheat(ff)
	d$dataset_id <- dataset_id
	#d$previous_crop<-carobiner::replace_values(d$previous_crop,"sesbania aculeata","sesbania")
	
# all scripts must end like this
	carobiner::write_files(dset, d, path=path)
}


