# Rochelle Knight, Venexia Walker, et al., 2024.

import sys, csv, re

codes = [{"code":"0204000P0AAAAAA","system":"icd10"},{"code":"0205052ABBBABAB","system":"icd10"},{"code":"0206020F0BEAAAB","system":"icd10"},{"code":"0202030C0AAAXAX","system":"icd10"},{"code":"0205010X0BBAAAA","system":"icd10"},{"code":"0205051L0AAANAN","system":"icd10"},{"code":"0205052ACAAABAB","system":"icd10"},{"code":"0204000H0AABBBB","system":"icd10"},{"code":"0205051S0BBABAB","system":"icd10"},{"code":"0206020F0BJAAAB","system":"icd10"},{"code":"0206020T0AAAAAA","system":"icd10"},{"code":"0206020F0AAAHAH","system":"icd10"},{"code":"0202030C0BFAAAS","system":"icd10"},{"code":"0204000H0AAAKAK","system":"icd10"},{"code":"0205051ABAAAAAA","system":"icd10"},{"code":"0205051L0AAAQAQ","system":"icd10"},{"code":"0205052I0BBAAAA","system":"icd10"},{"code":"0204000K0AAAAAA","system":"icd10"},{"code":"0205051I0BBABAB","system":"icd10"},{"code":"0204000ABBBAAAA","system":"icd10"},{"code":"0205051Y0AAABAB","system":"icd10"},{"code":"0205051L0BBABAB","system":"icd10"},{"code":"0206020A0AAAUAU","system":"icd10"},{"code":"0205040V0BBACAC","system":"icd10"},{"code":"0205051F0AABNBN","system":"icd10"},{"code":"0202010L0AAATAT","system":"icd10"},{"code":"020400010AAAAAA","system":"icd10"},{"code":"0205051F0AACTCT","system":"icd10"},{"code":"0206020A0AAACAC","system":"icd10"},{"code":"0205051Q0BBAAAA","system":"icd10"},{"code":"0206020F0BKAAAB","system":"icd10"},{"code":"0205051E0AAAEAE","system":"icd10"},{"code":"0206020Z0BBABAB","system":"icd10"},{"code":"0205051W0AAABAB","system":"icd10"},{"code":"0202010V0AAAAAA","system":"icd10"},{"code":"0205052ABAAABAB","system":"icd10"},{"code":"0204000H0BFAEAL","system":"icd10"},{"code":"0202030S0AACMCM","system":"icd10"},{"code":"0204000H0AAALAL","system":"icd10"},{"code":"0202030S0AAECEC","system":"icd10"},{"code":"0206020Z0AAABAB","system":"icd10"},{"code":"0202030C0AAASAS","system":"icd10"},{"code":"0206020R0AABRBR","system":"icd10"},{"code":"0206020Z0BBAAAA","system":"icd10"},{"code":"0205051ACAAADAD","system":"icd10"},{"code":"0205051W0BBABAB","system":"icd10"},{"code":"0206020R0AAAAAA","system":"icd10"},{"code":"0202030C0AAACAC","system":"icd10"},{"code":"0205051R0AAAEAE","system":"icd10"},{"code":"0205052ACAAADAD","system":"icd10"},{"code":"0202010V0BBAAAA","system":"icd10"},{"code":"0205051ACAAAAAA","system":"icd10"},{"code":"0205051R0AAACAC","system":"icd10"},{"code":"0205051F0AAEAEA","system":"icd10"},{"code":"020400080AAAPAP","system":"icd10"},{"code":"0204000H0AAAAAA","system":"icd10"},{"code":"0206020F0BLAAAB","system":"icd10"},{"code":"0205051I0AAABAB","system":"icd10"},{"code":"0204000H0BFACAK","system":"icd10"},{"code":"0205052I0BEAAAA","system":"icd10"},{"code":"0206020F0BIAAAB","system":"icd10"},{"code":"0202010B0AAACAC","system":"icd10"},{"code":"0204000H0AABHBH","system":"icd10"},{"code":"0205052ACBBABAB","system":"icd10"},{"code":"0205052ACBBADAD","system":"icd10"},{"code":"0206020F0AAABAB","system":"icd10"},{"code":"0204000P0BBAAAA","system":"icd10"},{"code":"0204000H0AABGBG","system":"icd10"},{"code":"0205052I0AAAAAA","system":"icd10"},{"code":"0205051L0AAABAB","system":"icd10"},{"code":"0204000ACAAABAB","system":"icd10"},{"code":"0205051Y0BBABAB","system":"icd10"},{"code":"0204000K0AAANAN","system":"icd10"},{"code":"0205040S0AAAEAE","system":"icd10"},{"code":"0205051Q0AAAAAA","system":"icd10"},{"code":"0205051AAAAABAB","system":"icd10"},{"code":"0204000ABAAAAAA","system":"icd10"},{"code":"0206020F0BIAEAB","system":"icd10"},{"code":"0204000H0BFADAA","system":"icd10"},{"code":"0204000ACAAAAAA","system":"icd10"},{"code":"0206020R0BBAAAA","system":"icd10"},{"code":"0205010N0BBABAB","system":"icd10"},{"code":"0205051Z0BBAAAA","system":"icd10"},{"code":"0206020F0BGAAAB","system":"icd10"},{"code":"0205051R0AAAMAM","system":"icd10"},{"code":"0206020F0BIACAB","system":"icd10"},{"code":"0205051I0AABZBZ","system":"icd10"},{"code":"0205051R0BBAHAM","system":"icd10"},{"code":"0206020T0BDAIAA","system":"icd10"},{"code":"0205051S0AAABAB","system":"icd10"},{"code":"0205040D0AAAKAK","system":"icd10"},{"code":"0204000ACAAADAD","system":"icd10"},{"code":"0206020Z0AAAAAA","system":"icd10"},{"code":"0205051I0AABYBY","system":"icd10"},{"code":"0205010N0AAABAB","system":"icd10"},{"code":"0202010B0AAAQAQ","system":"icd10"},{"code":"0205040V0AAACAC","system":"icd10"},{"code":"0205051L0AAAGAG","system":"icd10"},{"code":"0206020F0BBAAAB","system":"icd10"},{"code":"0206020A0AAALAL","system":"icd10"},{"code":"0206020A0AAAAAA","system":"icd10"},{"code":"0205051Z0AAAAAA","system":"icd10"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_01-hypertension-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_01-hypertension-375mg---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_01-hypertension-375mg---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_01-hypertension-375mg---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
