#'@title TX Mesonet site metadata
#'
#'@param station_ids Character vector of station ids. 
#'
#'@description
#'TX site metadata for TX mesonet sites. 
#'
#'@return A data.frame of metadata. All metadata methods return a data.frame with 
#'\code{station}, \code{latitude}, \code{longitude}
#'
#'@examples
#'
#'tx = tx_data()
#'meta = tx_sites_metadata(tx$station)
#'
#'@export
tx_sites_metadata = function(station_ids){
  
  meta_path     = system.file('extdata/tx_mesonet_site_info.csv', package=packageName())
  meta = read.csv(meta_path, header=TRUE, as.is=TRUE)
  
  meta = meta[meta$StationName != '', ]
  
  meta$station = paste(meta$StationName, "TX", sep=':', "TX_MESO")
  names(meta) = tolower(names(meta))
  
  meta = merge(data.frame(station=station_ids), meta, all.x=TRUE)
  meta$name = meta$stationname  #add back as name
  
  return(meta)
}
