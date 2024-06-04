# Rochelle Knight, Venexia Walker, et al., 2024.

import sys, csv, re

codes = [{"code":"I11","system":"icd10"},{"code":"I12","system":"icd10"},{"code":"I13","system":"icd10"},{"code":"66052004","system":"icd10"},{"code":"36221001","system":"icd10"},{"code":"194781004","system":"icd10"},{"code":"5148006","system":"icd10"},{"code":"194779001","system":"icd10"},{"code":"194767001","system":"icd10"},{"code":"77970009","system":"icd10"},{"code":"64715009","system":"icd10"},{"code":"36315003","system":"icd10"},{"code":"86234004","system":"icd10"},{"code":"66610008","system":"icd10"},{"code":"54225002","system":"icd10"},{"code":"83105008","system":"icd10"},{"code":"194780003","system":"icd10"},{"code":"G231.","system":"icd10"},{"code":"G222.","system":"icd10"},{"code":"G21z.","system":"icd10"},{"code":"G210.","system":"icd10"},{"code":"G233.","system":"icd10"},{"code":"G21z1","system":"icd10"},{"code":"G234.","system":"icd10"},{"code":"G23..","system":"icd10"},{"code":"G22..","system":"icd10"},{"code":"Gyu21","system":"icd10"},{"code":"G221.","system":"icd10"},{"code":"G2100","system":"icd10"},{"code":"G21zz","system":"icd10"},{"code":"G22z.","system":"icd10"},{"code":"G23z.","system":"icd10"},{"code":"G21..","system":"icd10"},{"code":"G2111","system":"icd10"},{"code":"G232.","system":"icd10"},{"code":"G230.","system":"icd10"},{"code":"G2101","system":"icd10"},{"code":"G21z0","system":"icd10"},{"code":"G2110","system":"icd10"},{"code":"G220.","system":"icd10"},{"code":"G211.","system":"icd10"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_01-hypertension-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["heartrenal-ccu002_01-hypertension---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["heartrenal-ccu002_01-hypertension---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["heartrenal-ccu002_01-hypertension---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
