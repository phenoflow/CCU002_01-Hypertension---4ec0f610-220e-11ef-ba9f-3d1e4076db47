# Rochelle Knight, Venexia Walker, et al., 2024.

import sys, csv, re

codes = [{"code":"0206020C0AABIBI","system":"icd10"},{"code":"0206020C0BPACAJ","system":"icd10"},{"code":"0206020R0BGADBF","system":"icd10"},{"code":"0206020C0BBAAAA","system":"icd10"},{"code":"0206020C0AAARAR","system":"icd10"},{"code":"0206020R0AABFBF","system":"icd10"},{"code":"0206020R0CJABAP","system":"icd10"},{"code":"0206020R0CFACAP","system":"icd10"},{"code":"0206020C0BWAEAJ","system":"icd10"},{"code":"0206020R0BBAIAP","system":"icd10"},{"code":"0206020R0CIABAP","system":"icd10"},{"code":"0206020C0AABABA","system":"icd10"},{"code":"0206020C0AAAJAJ","system":"icd10"},{"code":"0206020C0BYAAAJ","system":"icd10"},{"code":"0206020R0AAAPAP","system":"icd10"},{"code":"0206020R0BRADAP","system":"icd10"},{"code":"0206020C0BRAAAJ","system":"icd10"},{"code":"0206020C0BNAEBA","system":"icd10"},{"code":"0206020C0AAAAAA","system":"icd10"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_01-hypertension-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_01-hypertension-360mg---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_01-hypertension-360mg---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_01-hypertension-360mg---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
