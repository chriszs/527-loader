#!/bin/bash

set -euo pipefail

rm 527s.db || true
wget -nv https://forms.irs.gov/app/pod/dataDownload/fullData
unzip fullData
python process_data.py
mkdir out
cat headers/filings.txt line_2.txt > out/filings.txt
cat headers/contributions.txt line_A.txt > out/contributions.txt
cat headers/expenditures.txt line_B.txt > out/expenditures.txt
csvs-to-sqlite out/filings.txt 527s.db --separator '|' --quoting 3 --just-strings
csvs-to-sqlite out/contributions.txt 527s.db --separator '|' --quoting 3 --shape 'contribution_amount:contribution_amount\(integer\),contribution_date:contribution_date\(date\)' --just-strings
csvs-to-sqlite out/expenditures.txt 527s.db --separator '|' --quoting 3 --shape 'expenditure_amount:expenditure_amount\(integer\),expenditure_date:expenditure_date\(date\)' --just-strings
rm -rf var
rm *.txt
rm fullData
rm -rf out
