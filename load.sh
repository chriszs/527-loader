#!/bin/bash

set -euo pipefail

wget -nv https://forms.irs.gov/app/pod/dataDownload/fullData
unzip fullData
python process_data.py
csvs-to-sqlite line_2.txt 527s.db --separator '|' --quoting 3 --table=filings
csvs-to-sqlite line_A.txt 527s.db --separator '|' --quoting 3 --table=contributions
csvs-to-sqlite line_B.txt 527s.db --separator '|' --quoting 3 --table=expenditures
rm -rf var
rm *.txt
rm fullData
rm 527s.db
