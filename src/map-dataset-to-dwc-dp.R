library(here)
library(tidyverse)
source(here("src", "helpers.R"))

# read data
event <- read_tsv(here("data", "dwca-floridakeysreefvisualcensus2018-v1.7", "event.txt"))
occ <- read_tsv(here("data", "dwca-floridakeysreefvisualcensus2018-v1.7", "occurrence.txt"))
emof <- read_tsv(here("data", "dwca-floridakeysreefvisualcensus2018-v1.7", "extendedmeasurementorfact.txt"))

## DwC-DP
## Event
dwc_dp_event <- event %>%
  filter_dataframe_by_json("https://rs.gbif.org/sandbox/experimental/data-packages/dwc-dp/0.1/table-schemas/event.json")

# dwca event fields not in dwc-dp event 
setdiff(names(event), names(dwc_dp_event))

## Survey
dwc_dp_survey <- event %>%
  mutate(
    protocolNames = "Reef Fish Visual Census",
    protocolReferences = "https://doi.org/10.1016/j.fishres.2011.01.012",
    isAbundanceReported = "true",
    isLeastSpecificTargetCategoryQuantityInclusive = "true",
    hasMaterialSamples = "false",
    isSamplingEffortReported = "true",
    samplingEffortValue = 20,
    samplingEffortUnit = "observerMinutes"
  ) %>%
  filter_dataframe_by_json("https://rs.gbif.org/sandbox/experimental/data-packages/dwc-dp/0.1/table-schemas/survey.json")

## Occurrence
dwc_dp_occ <- occ %>%
  filter_dataframe_by_json("https://rs.gbif.org/sandbox/experimental/data-packages/dwc-dp/0.1/table-schemas/occurrence.json")

# dwca occ fields not in dwc-dp occ 
setdiff(names(occ), names(dwc_dp_occ))

## Event Assertion
dwc_dp_event_assertion <- emof %>%
  # filter for records without occurrenceID
  filter(is.na(occurrenceID)) %>%
  rename(
    eventID = id,
    assertionType = measurementType,
    assertionValueNumeric = measurementValue,
    assertionUnit = measurementUnit,
    assertionMadeDate = measurementDeterminedDate
  ) %>%
  filter_dataframe_by_json("https://rs.gbif.org/sandbox/experimental/data-packages/dwc-dp/0.1/table-schemas/event-assertion.json")

## Occurrence Assertion

# get emof of occurrence with occurrenceStatus = present only
emof_occ <- emof %>%
  filter(
    occurrenceID %in% (
      occ %>%
        filter(occurrenceStatus != "absent") %>%
        pull(occurrenceID)
    )
  )

# map to DwC-DP fields
dwc_dp_occ_assertion <- emof_occ %>%
  rename(
    assertionType = measurementType,
    assertionValueNumeric = measurementValue,
    assertionUnit = measurementUnit,
    assertionMadeDate = measurementDeterminedDate
  ) %>%
  filter_dataframe_by_json("https://rs.gbif.org/sandbox/experimental/data-packages/dwc-dp/0.1/table-schemas/occurrence-assertion.json")

# write table to file
write_tsv(dwc_dp_event, here("data", "dwc-dp", "event.txt"), na = "")
write_tsv(dwc_dp_survey, here("data", "dwc-dp", "survey.txt"), na = "")
write_tsv(dwc_dp_occ, here("data", "dwc-dp", "occurrence.txt"), na = "")
write_tsv(dwc_dp_event_assertion, here("data", "dwc-dp", "event-assertion.txt"), na = "")
write_tsv(dwc_dp_occ_assertion, here("data", "dwc-dp", "occurrence-assertion.txt"), na = "")

## Questions
# 1. Where does ownerInstitutionCode go? 
        
