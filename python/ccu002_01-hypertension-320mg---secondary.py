# Rochelle Knight, Venexia Walker, et al., 2024.

import sys, csv, re

codes = [{"code":"0206020R0AAARAR","system":"icd10"},{"code":"0205051L0AAAYAY","system":"icd10"},{"code":"0206020R0AAASAS","system":"icd10"},{"code":"0205051Q0BBACAC","system":"icd10"},{"code":"0205051W0AAACAC","system":"icd10"},{"code":"0205052Y0BBAAAA","system":"icd10"},{"code":"0205051L0BBADAD","system":"icd10"},{"code":"0205051K0AAAAAA","system":"icd10"},{"code":"0205051J0AAABAB","system":"icd10"},{"code":"0206020R0BTAAAS","system":"icd10"},{"code":"0202010Y0AAAAAA","system":"icd10"},{"code":"0204000U0AAAAAA","system":"icd10"},{"code":"0205010Y0BBAAAA","system":"icd10"},{"code":"0206020B0BBAAAA","system":"icd10"},{"code":"0205052V0BBAEAF","system":"icd10"},{"code":"0205051I0BBADAD","system":"icd10"},{"code":"0205051I0AAADAD","system":"icd10"},{"code":"0205052ADBBAAAA","system":"icd10"},{"code":"0206020Q0BBAAAA","system":"icd10"},{"code":"0205052V0AAAFAF","system":"icd10"},{"code":"0206020Q0AAAAAA","system":"icd10"},{"code":"0204000N0AAABAB","system":"icd10"},{"code":"0204000M0AAAGAG","system":"icd10"},{"code":"0205052Y0BBABAB","system":"icd10"},{"code":"0205052ADAAAAAA","system":"icd10"},{"code":"0205051H0BBAAAA","system":"icd10"},{"code":"0205051J0BBABAB","system":"icd10"},{"code":"0205051L0AAAZAZ","system":"icd10"},{"code":"0205052Q0AAACAC","system":"icd10"},{"code":"0206020L0BBABAB","system":"icd10"},{"code":"0205051F0AABPBP","system":"icd10"},{"code":"0206020R0BGAAAH","system":"icd10"},{"code":"0205052Y0AAABAB","system":"icd10"},{"code":"0205052Q0BBACAC","system":"icd10"},{"code":"0202010Y0BBAAAA","system":"icd10"},{"code":"0205051K0BFAAAA","system":"icd10"},{"code":"0206020R0AAAHAH","system":"icd10"},{"code":"0205052B0AAABAB","system":"icd10"},{"code":"0205052Q0BCACAC","system":"icd10"},{"code":"0206020R0BLAAAR","system":"icd10"},{"code":"0202030S0AADDDD","system":"icd10"},{"code":"0205052ABAAAAAA","system":"icd10"},{"code":"0204000U0BCAAAA","system":"icd10"},{"code":"0205052ABBBAAAA","system":"icd10"},{"code":"0205051K0BDABAA","system":"icd10"},{"code":"0206020R0BBAFAR","system":"icd10"},{"code":"0204000M0AAAHAH","system":"icd10"},{"code":"0206020R0BBAJAR","system":"icd10"},{"code":"0205052ACAAAAAA","system":"icd10"},{"code":"0205051L0AAADAD","system":"icd10"},{"code":"0205051W0BBACAC","system":"icd10"},{"code":"0205051Q0AAACAC","system":"icd10"},{"code":"0205052ACBBAAAA","system":"icd10"},{"code":"0205052Y0AAAAAA","system":"icd10"},{"code":"0205010Z0BBAAAA","system":"icd10"},{"code":"0205010Y0AAAAAA","system":"icd10"},{"code":"0205052B0BBABAB","system":"icd10"},{"code":"0205051H0AAAAAA","system":"icd10"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_01-hypertension-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_01-hypertension-320mg---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_01-hypertension-320mg---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_01-hypertension-320mg---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
