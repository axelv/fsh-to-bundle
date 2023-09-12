Instance: PSA
InstanceOf: ObservationDefinition
Usage: #example
Title: "PSA"
Description: "Prostate Specific Antigen measurement definition"
* permittedDataType = #Quantity
* code.text = "Prostate Specific Antigen"
* qualifiedInterval
* permittedUnit = http://unitsofmeasure.org#ng/mL "ng/mL"

Instance: Bundle
InstanceOf: Bundle
Usage: #example
Title: "Bundle"
Description: ""
* entry[+]
    * resource = PSA
    * request
        * method = #POST
        * url = "ObservationDefinition" 
        * ifNoneExist = "url=http://tiro.health/fhir/ObservationDefinition/psa|1.0.0"

