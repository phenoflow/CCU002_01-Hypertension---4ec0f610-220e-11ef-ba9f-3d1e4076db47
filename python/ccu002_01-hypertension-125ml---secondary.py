# Rochelle Knight, Venexia Walker, et al., 2024.

import sys, csv, re

codes = [{"code":"0202030S0AAEFEF","system":"icd10"},{"code":"0205051F0AABYBY","system":"icd10"},{"code":"0205010J0AAA3A3","system":"icd10"},{"code":"0202010D0AABWBW","system":"icd10"},{"code":"0202010D0AABCBC","system":"icd10"},{"code":"0205051I0AABSBS","system":"icd10"},{"code":"0202010L0AAASAS","system":"icd10"},{"code":"0205051F0AABRBR","system":"icd10"},{"code":"0205010Y0AAACAC","system":"icd10"},{"code":"0202010B0AAAXAX","system":"icd10"},{"code":"0202030S0AACZCZ","system":"icd10"},{"code":"0202030S0AADCDC","system":"icd10"},{"code":"0202030C0AAAZAZ","system":"icd10"},{"code":"0205052C0AAAJAJ","system":"icd10"},{"code":"0205010Y0BBACAC","system":"icd10"},{"code":"0206020R0AABKBK","system":"icd10"},{"code":"0202010D0AACDCD","system":"icd10"},{"code":"0205051M0AAALAL","system":"icd10"},{"code":"0202030S0AACRCR","system":"icd10"},{"code":"0206020A0AAAMAM","system":"icd10"},{"code":"0206020A0AAAFAF","system":"icd10"},{"code":"0205051I0AACBCB","system":"icd10"},{"code":"0205052N0AAAEAE","system":"icd10"},{"code":"0205010J0AAA8A8","system":"icd10"},{"code":"0205051R0AAAGAG","system":"icd10"},{"code":"0205051I0AABTBT","system":"icd10"},{"code":"0204000I0AAAIAI","system":"icd10"},{"code":"0205051F0AADZDZ","system":"icd10"},{"code":"0202010D0BCAAAU","system":"icd10"},{"code":"0202010V0AAAMAM","system":"icd10"},{"code":"0205051I0AAAUAU","system":"icd10"},{"code":"0204000E0AAAAAA","system":"icd10"},{"code":"0205010J0AABQBQ","system":"icd10"},{"code":"0204000H0AABFBF","system":"icd10"},{"code":"0204000M0AAAIAI","system":"icd10"},{"code":"0204000T0AAARAR","system":"icd10"},{"code":"0202030S0AAEDED","system":"icd10"},{"code":"0205051R0AAATAT","system":"icd10"},{"code":"0206020A0AAATAT","system":"icd10"},{"code":"0205052I0AAAMAM","system":"icd10"},{"code":"0206020R0AAAUAU","system":"icd10"},{"code":"0205051F0AABTBT","system":"icd10"},{"code":"0202010L0AAAMAM","system":"icd10"},{"code":"0202010D0AADEDE","system":"icd10"},{"code":"0205051M0AAAKAK","system":"icd10"},{"code":"0205051F0AADFDF","system":"icd10"},{"code":"0205052N0AAAGAG","system":"icd10"},{"code":"0206020A0AAADAD","system":"icd10"},{"code":"0202030S0AACPCP","system":"icd10"},{"code":"0202010P0AAABAB","system":"icd10"},{"code":"0205020H0AAAIAI","system":"icd10"},{"code":"0204000K0AAATAT","system":"icd10"},{"code":"0206020R0AABQBQ","system":"icd10"},{"code":"0205051R0AAAHAH","system":"icd10"},{"code":"0204000E0BBABAA","system":"icd10"},{"code":"0204000M0AAAFAF","system":"icd10"},{"code":"0205051M0AAACAC","system":"icd10"},{"code":"0202030S0AACYCY","system":"icd10"},{"code":"0205052I0AAAFAF","system":"icd10"},{"code":"0206020T0BKAAAV","system":"icd10"},{"code":"0206020T0AAAVAV","system":"icd10"},{"code":"0202030S0AACQCQ","system":"icd10"},{"code":"0205051F0AABWBW","system":"icd10"},{"code":"0205052N0AAAFAF","system":"icd10"},{"code":"0204000K0AABMBM","system":"icd10"},{"code":"0206020T0AAAZAZ","system":"icd10"},{"code":"0204000H0AABIBI","system":"icd10"},{"code":"0206020C0AABHBH","system":"icd10"},{"code":"0204000H0AAARAR","system":"icd10"},{"code":"0205052V0AAAEAE","system":"icd10"},{"code":"0205040D0AAAZAZ","system":"icd10"},{"code":"0202030S0AADSDS","system":"icd10"},{"code":"0205051I0AAAJAJ","system":"icd10"},{"code":"0205051R0AAAFAF","system":"icd10"},{"code":"0205051I0AACACA","system":"icd10"},{"code":"0202030S0AACXCX","system":"icd10"},{"code":"0205051F0AACICI","system":"icd10"},{"code":"0204000H0AABEBE","system":"icd10"},{"code":"0202030S0AADUDU","system":"icd10"},{"code":"0202010B0AAAUAU","system":"icd10"},{"code":"0202010D0AABIBI","system":"icd10"},{"code":"0205040D0AAAXAX","system":"icd10"},{"code":"0205051F0AACACA","system":"icd10"},{"code":"0205051M0AAAHAH","system":"icd10"},{"code":"0204000E0AAASAS","system":"icd10"},{"code":"0204000K0AABKBK","system":"icd10"},{"code":"0205051L0AAAKAK","system":"icd10"},{"code":"0205051L0AAAIAI","system":"icd10"},{"code":"0202010D0AADDDD","system":"icd10"},{"code":"0204000K0AABLBL","system":"icd10"},{"code":"0204000T0AAATAT","system":"icd10"},{"code":"0204000M0AAADAD","system":"icd10"},{"code":"0202010V0AAAKAK","system":"icd10"},{"code":"0205010J0AAA4A4","system":"icd10"},{"code":"0205040D0AAAHAH","system":"icd10"},{"code":"0204000K0AAAMAM","system":"icd10"},{"code":"0204000M0AAAJAJ","system":"icd10"},{"code":"0202010L0AAAJAJ","system":"icd10"},{"code":"0204000I0AAAJAJ","system":"icd10"},{"code":"0205052I0AAAGAG","system":"icd10"},{"code":"0205052B0AAADAD","system":"icd10"},{"code":"0202010D0AABJBJ","system":"icd10"},{"code":"0202010D0AADGDG","system":"icd10"},{"code":"0206020A0AAANAN","system":"icd10"},{"code":"0205040D0AAAYAY","system":"icd10"},{"code":"0204000H0AABJBJ","system":"icd10"},{"code":"0205010J0AABTBT","system":"icd10"},{"code":"0205051F0AABXBX","system":"icd10"},{"code":"0202030S0AADADA","system":"icd10"},{"code":"0204000T0AAAMAM","system":"icd10"},{"code":"0202010D0AABHBH","system":"icd10"},{"code":"0205040D0AABABA","system":"icd10"},{"code":"0205040D0AAAIAI","system":"icd10"},{"code":"0202010D0AAAUAU","system":"icd10"},{"code":"0202030S0AACWCW","system":"icd10"},{"code":"0205051I0AABFBF","system":"icd10"},{"code":"0202010L0AAAPAP","system":"icd10"},{"code":"0204000H0AABDBD","system":"icd10"},{"code":"0206020R0AABCBC","system":"icd10"},{"code":"0204000K0AAASAS","system":"icd10"},{"code":"0202030S0AAEAEA","system":"icd10"},{"code":"0202030S0AAEBEB","system":"icd10"},{"code":"0204000E0AAANAN","system":"icd10"},{"code":"0205052N0AAAJAJ","system":"icd10"},{"code":"0204000T0AABCBC","system":"icd10"},{"code":"0202030S0AAEEEE","system":"icd10"},{"code":"0205052N0AAALAL","system":"icd10"},{"code":"0206020A0AAAJAJ","system":"icd10"},{"code":"0202030S0AACTCT","system":"icd10"},{"code":"0205051L0AAAHAH","system":"icd10"},{"code":"0205040S0AAAKAK","system":"icd10"},{"code":"0206020F0AAAGAG","system":"icd10"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_01-hypertension-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_01-hypertension-125ml---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_01-hypertension-125ml---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_01-hypertension-125ml---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)