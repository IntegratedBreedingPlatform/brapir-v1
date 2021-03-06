% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/brapi_put_studies_studyDbId_observations.R
\name{brapi_put_studies_studyDbId_observations}
\alias{brapi_put_studies_studyDbId_observations}
\title{put /studies/\{studyDbId\}/observations}
\usage{
brapi_put_studies_studyDbId_observations(
  con = NULL,
  studyDbId = "",
  observations = ""
)
}
\arguments{
\item{con}{list; required: TRUE; BrAPI connection object}

\item{studyDbId}{character; required: TRUE; Identifier of the study. Usually a number, could be alphanumeric.}

\item{observations}{data.frame; required: TRUE; data.frame of observation references to be created or updated with default: ""; Each row in the  \code{observations} data.frame represents a single observation and can consist of the following columns:
\itemize{
\item \code{collector} vector of type character; the name or identifier of the entity which collected each observation.
\item \code{observationDbId}  vector of type character; the internal database identifier of each existing observation to be updated.
\item \code{observationTimeStamp} vector of type character; The date and time each individual observation was taken and specified in the ISO 8601 standard, e.g. for two observations c("2020-06-09T10:18:29.000Z", "2020-06-09T10:18:40.010Z")
\item \code{observationUnitDbId} vector of type character; the unique internal database identifier specifying the observation unit for each observation.
\item \code{observationVariableDbId} vector of type character; the internal database identifier of the trait for each observation
\item \code{value} vector of type character; the value of each observation as specified by the observation variable defined by its \code{observationVariableDbId} in the previous column.
}

The Examples Section shows an example of how to construct the \code{observations} argument as a data.frame object.}
}
\value{
data.frame
}
\description{
Update the Observations or create new Observations of a specific Study
}
\details{
The following rules are used for updating observations and creating new observations:
\itemize{
\item If an \code{observationDbId} is "null" or an empty string in the request, a NEW observation should be created for the given study and observationUnit
\item If an \code{observationDbId} is populated but not found in the database, a NEW observation should be created for the given study and observationUnit AND an NEW \code{observationDbId} should be assigned to it. A warning should be returned to the client.
\item If an \code{observationDbId} is populated and found in the database, but the existing entry is not associated with the given study or observationUnit, a NEW observation should be created for the given study and observationUnit AND an NEW \code{observationDbId} should be assigned to it. A warning should be returned to the client.
\item If an \code{observationDbId} is populated and found in the database and is associated with the given study and observationUnit, then it should be updated with the new data given.
}
}
\examples{
\dontrun{

# Create a connection object
con <- brapi_db()$testserver

# Create an observations data.frame
# containing the observations to be updated and added
# 1) change Plant Height (observationVariableDbId = "MO_123:100002")
#    from 1.1. to 2.1 for Plant 1 (observationUnitDbId = "2") matching
#    observationDbId = "3"
# 2) add Virus severity (observationVariableDbId = "MO_123:100006")
#    of 0.8 for Plant 2 (observationUnitDbId = "4")
observations <- data.frame(
  collector = c("Jack", "Freddy"),
  observationDbId = c("3", ""),
  observationTimeStamp = c(
    paste0(anytime::iso8601(lubridate::with_tz(Sys.time(),
                                               tzone = "UTC")),
           "Z"),
    paste0(anytime::iso8601(lubridate::with_tz(Sys.time(),
                                               tzone = "UTC")),
           "Z")),
  observationUnitDbId = c("2", "4"),
  obserbationVariableDbId = c("MO_123:100002", "MO_123:100006"),
  value = c("2.2", "0.8"))

# Make put /studies/{studyDbId}/observations call
brapi_put_studies_studyDbId_observations(con = con,
                                         studyDbId = '1001',
                                         observations = observations)
}

}
\references{
\href{https://app.swaggerhub.com/apis/PlantBreedingAPI/BrAPI/1.3#/Studies/put_studies__studyDbId__observations }{BrAPI SwaggerHub}
}
\seealso{
Other brapi_1.3: 
\code{\link{brapi_get_allelematrices_search}()},
\code{\link{brapi_get_allelematrices}()},
\code{\link{brapi_get_attributes_categories}()},
\code{\link{brapi_get_attributes}()},
\code{\link{brapi_get_breedingmethods_breedingMethodDbId}()},
\code{\link{brapi_get_breedingmethods}()},
\code{\link{brapi_get_calls}()},
\code{\link{brapi_get_commoncropnames}()},
\code{\link{brapi_get_germplasm_germplasmDbId_attributes}()},
\code{\link{brapi_get_germplasm_germplasmDbId_markerprofiles}()},
\code{\link{brapi_get_germplasm_germplasmDbId_mcpd}()},
\code{\link{brapi_get_germplasm_germplasmDbId_pedigree}()},
\code{\link{brapi_get_germplasm_germplasmDbId_progeny}()},
\code{\link{brapi_get_germplasm_germplasmDbId}()},
\code{\link{brapi_get_germplasm}()},
\code{\link{brapi_get_images_imageDbId}()},
\code{\link{brapi_get_images}()},
\code{\link{brapi_get_lists_listDbId}()},
\code{\link{brapi_get_lists}()},
\code{\link{brapi_get_locations_locationDbId}()},
\code{\link{brapi_get_locations}()},
\code{\link{brapi_get_maps_mapDbId_positions_linkageGroupName}()},
\code{\link{brapi_get_maps_mapDbId_positions}()},
\code{\link{brapi_get_maps_mapDbId}()},
\code{\link{brapi_get_maps}()},
\code{\link{brapi_get_markerprofiles_markerProfileDbId}()},
\code{\link{brapi_get_markerprofiles}()},
\code{\link{brapi_get_markers_markerDbId}()},
\code{\link{brapi_get_markers}()},
\code{\link{brapi_get_methods_methodDbId}()},
\code{\link{brapi_get_methods}()},
\code{\link{brapi_get_observationlevels}()},
\code{\link{brapi_get_observationunits}()},
\code{\link{brapi_get_ontologies}()},
\code{\link{brapi_get_people_personDbId}()},
\code{\link{brapi_get_people}()},
\code{\link{brapi_get_programs}()},
\code{\link{brapi_get_samples_sampleDbId}()},
\code{\link{brapi_get_samples}()},
\code{\link{brapi_get_scales_scaleDbId}()},
\code{\link{brapi_get_scales}()},
\code{\link{brapi_get_search_germplasm_searchResultsDbId}()},
\code{\link{brapi_get_search_images_searchResultsDbId}()},
\code{\link{brapi_get_search_markers_searchResultsDbId}()},
\code{\link{brapi_get_search_observationtables_searchResultsDbId}()},
\code{\link{brapi_get_search_observationunits_searchResultsDbId}()},
\code{\link{brapi_get_search_programs_searchResultsDbId}()},
\code{\link{brapi_get_search_samples_searchResultsDbId}()},
\code{\link{brapi_get_search_studies_searchResultsDbId}()},
\code{\link{brapi_get_search_variables_searchResultsDbId}()},
\code{\link{brapi_get_seasons}()},
\code{\link{brapi_get_studies_studyDbId_germplasm}()},
\code{\link{brapi_get_studies_studyDbId_layouts}()},
\code{\link{brapi_get_studies_studyDbId_observations}()},
\code{\link{brapi_get_studies_studyDbId_observationunits}()},
\code{\link{brapi_get_studies_studyDbId_observationvariables}()},
\code{\link{brapi_get_studies_studyDbId_table}()},
\code{\link{brapi_get_studies_studyDbId}()},
\code{\link{brapi_get_studies}()},
\code{\link{brapi_get_studytypes}()},
\code{\link{brapi_get_traits_traitDbId}()},
\code{\link{brapi_get_traits}()},
\code{\link{brapi_get_trials_trialDbId}()},
\code{\link{brapi_get_trials}()},
\code{\link{brapi_get_variables_observationVariableDbId}()},
\code{\link{brapi_get_variables}()},
\code{\link{brapi_get_vendor_orders_orderId_plates}()},
\code{\link{brapi_get_vendor_orders_orderId_results}()},
\code{\link{brapi_get_vendor_orders_orderId_status}()},
\code{\link{brapi_get_vendor_orders}()},
\code{\link{brapi_get_vendor_plates_submissionId}()},
\code{\link{brapi_get_vendor_specifications}()},
\code{\link{brapi_post_allelematrices_search}()},
\code{\link{brapi_post_images}()},
\code{\link{brapi_post_lists_listDbId_items}()},
\code{\link{brapi_post_lists}()},
\code{\link{brapi_post_methods}()},
\code{\link{brapi_post_people}()},
\code{\link{brapi_post_phenotypes}()},
\code{\link{brapi_post_scales}()},
\code{\link{brapi_post_search_germplasm}()},
\code{\link{brapi_post_search_images}()},
\code{\link{brapi_post_search_markers}()},
\code{\link{brapi_post_search_observationtables}()},
\code{\link{brapi_post_search_observationunits}()},
\code{\link{brapi_post_search_programs}()},
\code{\link{brapi_post_search_samples}()},
\code{\link{brapi_post_search_studies}()},
\code{\link{brapi_post_search_variables}()},
\code{\link{brapi_post_studies_studyDbId_table}()},
\code{\link{brapi_post_traits}()},
\code{\link{brapi_post_vendor_orders}()},
\code{\link{brapi_post_vendor_plates}()},
\code{\link{brapi_put_images_imageDbId_imagecontent}()},
\code{\link{brapi_put_images_imageDbId}()},
\code{\link{brapi_put_lists_listDbId}()},
\code{\link{brapi_put_methods_methodDbId}()},
\code{\link{brapi_put_people_personDbId}()},
\code{\link{brapi_put_samples}()},
\code{\link{brapi_put_scales_scaleDbId}()},
\code{\link{brapi_put_studies_studyDbId_layouts}()},
\code{\link{brapi_put_studies_studyDbId_observationunits}()},
\code{\link{brapi_put_traits_traitDbId}()}

Other Studies: 
\code{\link{brapi_get_search_studies_searchResultsDbId}()},
\code{\link{brapi_get_seasons}()},
\code{\link{brapi_get_studies_studyDbId_germplasm}()},
\code{\link{brapi_get_studies_studyDbId_layouts}()},
\code{\link{brapi_get_studies_studyDbId_observations}()},
\code{\link{brapi_get_studies_studyDbId_observationunits}()},
\code{\link{brapi_get_studies_studyDbId_observationvariables}()},
\code{\link{brapi_get_studies_studyDbId_table}()},
\code{\link{brapi_get_studies_studyDbId}()},
\code{\link{brapi_get_studies}()},
\code{\link{brapi_get_studytypes}()},
\code{\link{brapi_post_search_studies}()},
\code{\link{brapi_post_studies_studyDbId_table}()},
\code{\link{brapi_put_studies_studyDbId_layouts}()},
\code{\link{brapi_put_studies_studyDbId_observationunits}()}

Other Observations: 
\code{\link{brapi_get_observationlevels}()},
\code{\link{brapi_get_observationunits}()},
\code{\link{brapi_get_search_observationtables_searchResultsDbId}()},
\code{\link{brapi_get_search_observationunits_searchResultsDbId}()},
\code{\link{brapi_get_studies_studyDbId_observations}()},
\code{\link{brapi_get_studies_studyDbId_observationunits}()},
\code{\link{brapi_get_studies_studyDbId_table}()},
\code{\link{brapi_post_phenotypes}()},
\code{\link{brapi_post_search_observationtables}()},
\code{\link{brapi_post_search_observationunits}()},
\code{\link{brapi_post_studies_studyDbId_table}()},
\code{\link{brapi_put_studies_studyDbId_observationunits}()}
}
\author{
brapir generator package
}
\concept{Observations}
\concept{Studies}
\concept{brapi_1.3}
