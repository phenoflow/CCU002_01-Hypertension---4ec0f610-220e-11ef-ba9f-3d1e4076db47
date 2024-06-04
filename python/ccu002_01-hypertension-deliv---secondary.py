# Rochelle Knight, Venexia Walker, et al., 2024.

import sys, csv, re

codes = [{"code":"0204000K0BBACAA","system":"icd10"},{"code":"198945003","system":"icd10"},{"code":"198944004","system":"icd10"},{"code":"198953006","system":"icd10"},{"code":"199000005","system":"icd10"},{"code":"198952001","system":"icd10"},{"code":"198946002","system":"icd10"},{"code":"198951008","system":"icd10"},{"code":"199002002","system":"icd10"},{"code":"198999008","system":"icd10"},{"code":"L1221","system":"icd10"},{"code":"L1223","system":"icd10"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_01-hypertension-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_01-hypertension-deliv---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_01-hypertension-deliv---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_01-hypertension-deliv---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
