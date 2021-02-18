#!/usr/bin/env cwltool
cwlVersion: v1.0
class: Workflow
inputs:
  infile:
    type: File
  lig_id:
    type: int[]
  begin_id:
    type: int
  end_id:
    type: int
outputs:
  outfiles:
    type: File[]
    outputSource: log2pieda/outfile
steps:
  log2pieda:
    run: log2pieda.cwl
    scatter: 
      - lig_id
    in:
      infile: infile
      lig_id: lig_id
      begin_id: begin_id
      end_id: end_id
    out:
      - outfile

requirements:
  ScatterFeatureRequirement: {}