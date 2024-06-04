# Rochelle Knight, Venexia Walker, et al., 2024.

import sys, csv, re

codes = [{"code":"471521000000108","system":"icd10"},{"code":"38341003","system":"icd10"},{"code":"706882009","system":"icd10"},{"code":"275516004","system":"icd10"},{"code":"132721000119104","system":"icd10"},{"code":"428163005","system":"icd10"},{"code":"443482000","system":"icd10"},{"code":"F4213","system":"icd10"},{"code":"G672.","system":"icd10"},{"code":"F4042","system":"icd10"},{"code":"G2y..","system":"icd10"},{"code":"Gyu2.","system":"icd10"},{"code":"G2...","system":"icd10"},{"code":"662G.","system":"icd10"},{"code":"G2z..","system":"icd10"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_01-hypertension-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["antihypertensive-ccu002_01-hypertension---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["antihypertensive-ccu002_01-hypertension---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["antihypertensive-ccu002_01-hypertension---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
