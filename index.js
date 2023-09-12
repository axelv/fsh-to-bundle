#!/usr/bin/env node

import { sushiClient } from 'fsh-sushi'

import * as fs from 'fs'
(async function main() {
    const cliArgs = process.argv.slice(2)
    const input = cliArgs[0]
    const output = cliArgs[1]

    const inputText = fs.readFileSync(input, 'utf8')
    const { fhir, errors, warnings } = await sushiClient.fshToFhir(inputText, { fhirVersion: '5.0.0' })
    if (errors.length > 0) {
        process.exit(1)
    }
    if (fhir.length === 0) {
        console.log("No FHIR resources were generated")
        process.exit(1)
    }
    if (fhir.length > 1) {
        console.log("Resulting resources should only contain an single bundle! Received: " + fhir.map(r => r.resourceType).join(', '))
        console.log("Continuing with first Bundle in list.")
    }
    const bundle = fhir.find(r => r.resourceType === 'Bundle')
    if (!bundle) {
        console.log("No Bundle was generated")
        process.exit(1)
    }
    fs.writeFileSync(output, JSON.stringify(bundle, null, 2))
})()