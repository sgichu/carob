
carob_script <- function(path) {
"Description:
This is an international study that contains data on yield and other agronomic traits of maize including striga attacks on maize in Africa.

The study was carried out by the International Institute of Tropical Agriculture in 2016 in eight African countries and one Asian country.
"
	uri <- "doi:10.25502/20180727/1612/MA"
	group <- "maize_trials"	

	dataset_id <- carobiner::simple_uri(uri)
	ff  <- carobiner::get_data(uri, path, group)
	js <- carobiner::get_metadata(dataset_id, path, major=2, minor=1, group)

	## dataset level data 
	dset <- data.frame(
		carobiner::extract_metadata(js, uri, group),
		data_citation="Menkir, A. (2018). Grain Yield and Other Agronomic Traits of International Maize Trials – Chad, 1996 [Data set]. International Institute of Tropical Agriculture (IITA). https://doi.org/10.25502/20180727/1612/MA",
		publication="doi:10.1016/j.jenvman.2017.06.058",
		carob_contributor = "Robert Hijmans",
		carob_date="2023-07-03",
		data_type = "experiment",
		project="International Maize Trials",
		data_institutions="IITA"
	)

	mzfun <- carobiner::get_function("intmztrial_striga", path, group)
	d <- mzfun(ff, id=dataset_id)

	carobiner::write_files(dset, d, path=path)
}
