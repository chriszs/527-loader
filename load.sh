#!/bin/bash

set -euo pipefail

wget -nv https://forms.irs.gov/app/pod/dataDownload/fullData
unzip fullData
python process_data.py
mkdir out
cat headers/filings.txt line_2.txt > out/filings.txt
cat headers/contributions.txt line_A.txt > out/contributions.txt
cat headers/expenditures.txt line_B.txt > out/expenditures.txt
csvs-to-sqlite out/filings.txt 527s.db --separator '|' --quoting 3 --just-strings --date org_formation_date --date pre_or_post_elect_date --date period_begin_date --date period_end_date --datetime-format '%Y%m%d'
sqlite-utils transform 527s.db filings --type total_sched_a float --type total_sched_b float
csvs-to-sqlite out/contributions.txt 527s.db --separator '|' --quoting 3 --fts org_name --fts ein --fts contributor_name --date contribution_date --datetime-format '%Y%m%d' --just-strings
sqlite-utils transform 527s.db contributions --type contribution_amount float
csvs-to-sqlite out/expenditures.txt 527s.db --separator '|' --quoting 3 --fts org_name --fts ein --fts recipient_name --date expenditure_date --datetime-format '%Y%m%d' --just-strings
sqlite-utils transform 527s.db expenditures --type expenditure_amount float
rm -rf var
rm *.txt
rm fullData
rm -rf out
