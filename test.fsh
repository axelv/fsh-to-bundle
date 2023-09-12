Instance: PSA
InstanceOf: ObservationDefinition
Usage: #inline
Title: "PSA"
Description: "Prostate Specific Antigen measurement definition"
* status = #draft
* permittedDataType = #Quantity
* code.text = "Prostate Specific Antigen"
* permittedUnit = http://unitsofmeasure.org#ng/mL "ng/mL"

Instance: Bundle
InstanceOf: Bundle
Usage: #example
Title: "Bundle"
Description: ""
* type = #batch
* entry[+]
  * resource = PSA
  * request
    * method = #POST
    * url = "ObservationDefinition" 
    * ifNoneExist = "url=http://tiro.health/fhir/ObservationDefinition/psa|1.0.0"

