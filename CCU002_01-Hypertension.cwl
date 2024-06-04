cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  heartrenal-ccu002_01-hypertension---secondary:
    run: heartrenal-ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  secondary-ccu002_01-hypertension---secondary:
    run: secondary-ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: heartrenal-ccu002_01-hypertension---secondary/output
  essential-ccu002_01-hypertension---secondary:
    run: essential-ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: secondary-ccu002_01-hypertension---secondary/output
  ccu002_01-hypertension-stage---secondary:
    run: ccu002_01-hypertension-stage---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: essential-ccu002_01-hypertension---secondary/output
  ccu002_01-hypertension-kidney---secondary:
    run: ccu002_01-hypertension-kidney---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-stage---secondary/output
  ccu002_01-hypertension---secondary:
    run: ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-kidney---secondary/output
  antihypertensive-ccu002_01-hypertension---secondary:
    run: antihypertensive-ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension---secondary/output
  ccu002_01-hypertension-benign---secondary:
    run: ccu002_01-hypertension-benign---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: antihypertensive-ccu002_01-hypertension---secondary/output
  renovascular-ccu002_01-hypertension---secondary:
    run: renovascular-ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-benign---secondary/output
  ccu002_01-hypertension-malignant---secondary:
    run: ccu002_01-hypertension-malignant---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: renovascular-ccu002_01-hypertension---secondary/output
  ccu002_01-hypertension-refused---secondary:
    run: ccu002_01-hypertension-refused---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-malignant---secondary/output
  ccu002_01-hypertension-endocrine---secondary:
    run: ccu002_01-hypertension-endocrine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-refused---secondary/output
  contraceptive-ccu002_01-hypertension---secondary:
    run: contraceptive-ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-endocrine---secondary/output
  diastolic-ccu002_01-hypertension---secondary:
    run: diastolic-ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: contraceptive-ccu002_01-hypertension---secondary/output
  systolic-ccu002_01-hypertension---secondary:
    run: systolic-ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: diastolic-ccu002_01-hypertension---secondary/output
  ccu002_01-hypertension-tolerated---secondary:
    run: ccu002_01-hypertension-tolerated---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: systolic-ccu002_01-hypertension---secondary/output
  ccu002_01-hypertension-therapy---secondary:
    run: ccu002_01-hypertension-therapy---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-tolerated---secondary/output
  ccu002_01-hypertension-3125mg---secondary:
    run: ccu002_01-hypertension-3125mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-therapy---secondary/output
  ccu002_01-hypertension-tildiem---secondary:
    run: ccu002_01-hypertension-tildiem---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-3125mg---secondary/output
  ccu002_01-hypertension-fosinopril---secondary:
    run: ccu002_01-hypertension-fosinopril---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-tildiem---secondary/output
  ccu002_01-hypertension-lisopress---secondary:
    run: ccu002_01-hypertension-lisopress---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule22
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-fosinopril---secondary/output
  ccu002_01-hypertension-375mg---secondary:
    run: ccu002_01-hypertension-375mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule23
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-lisopress---secondary/output
  ccu002_01-hypertension-nicardipine---secondary:
    run: ccu002_01-hypertension-nicardipine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule24
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-375mg---secondary/output
  ccu002_01-hypertension-cozaarcomp---secondary:
    run: ccu002_01-hypertension-cozaarcomp---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule25
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-nicardipine---secondary/output
  ccu002_01-hypertension-doxazosin---secondary:
    run: ccu002_01-hypertension-doxazosin---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule26
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-cozaarcomp---secondary/output
  ccu002_01-hypertension-verapamil---secondary:
    run: ccu002_01-hypertension-verapamil---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule27
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-doxazosin---secondary/output
  ccu002_01-hypertension-eprosartan---secondary:
    run: ccu002_01-hypertension-eprosartan---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule28
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-verapamil---secondary/output
  ccu002_01-hypertension-125ml---secondary:
    run: ccu002_01-hypertension-125ml---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule29
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-eprosartan---secondary/output
  ccu002_01-hypertension-320mg---secondary:
    run: ccu002_01-hypertension-320mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule30
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-125ml---secondary/output
  ccu002_01-hypertension-teveten---secondary:
    run: ccu002_01-hypertension-teveten---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule31
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-320mg---secondary/output
  ccu002_01-hypertension-slozem---secondary:
    run: ccu002_01-hypertension-slozem---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule32
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-teveten---secondary/output
  ccu002_01-hypertension-nifedipine---secondary:
    run: ccu002_01-hypertension-nifedipine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule33
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-slozem---secondary/output
  ccu002_01-hypertension-tablet---secondary:
    run: ccu002_01-hypertension-tablet---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule34
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-nifedipine---secondary/output
  ccu002_01-hypertension-zemret---secondary:
    run: ccu002_01-hypertension-zemret---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule35
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-tablet---secondary/output
  ccu002_01-hypertension-metoprolol---secondary:
    run: ccu002_01-hypertension-metoprolol---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule36
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-zemret---secondary/output
  ccu002_01-hypertension-lopresor---secondary:
    run: ccu002_01-hypertension-lopresor---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule37
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-metoprolol---secondary/output
  ccu002_01-hypertension-chlorothiazide---secondary:
    run: ccu002_01-hypertension-chlorothiazide---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule38
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-lopresor---secondary/output
  ccu002_01-hypertension-cardene---secondary:
    run: ccu002_01-hypertension-cardene---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule39
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-chlorothiazide---secondary/output
  ccu002_01-hypertension-400mg---secondary:
    run: ccu002_01-hypertension-400mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule40
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-cardene---secondary/output
  ccu002_01-hypertension-veratil---secondary:
    run: ccu002_01-hypertension-veratil---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule41
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-400mg---secondary/output
  ccu002_01-hypertension-betacardone---secondary:
    run: ccu002_01-hypertension-betacardone---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule42
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-veratil---secondary/output
  ccu002_01-hypertension-sacubitril---secondary:
    run: ccu002_01-hypertension-sacubitril---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule43
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-betacardone---secondary/output
  ccu002_01-hypertension-adalat---secondary:
    run: ccu002_01-hypertension-adalat---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule44
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-sacubitril---secondary/output
  ccu002_01-hypertension-dilzem---secondary:
    run: ccu002_01-hypertension-dilzem---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule45
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-adalat---secondary/output
  ccu002_01-hypertension-300microgram---secondary:
    run: ccu002_01-hypertension-300microgram---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule46
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-dilzem---secondary/output
  ccu002_01-hypertension-hytrin---secondary:
    run: ccu002_01-hypertension-hytrin---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule47
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-300microgram---secondary/output
  ccu002_01-hypertension-trandate---secondary:
    run: ccu002_01-hypertension-trandate---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule48
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-hytrin---secondary/output
  ccu002_01-hypertension-telmisartan---secondary:
    run: ccu002_01-hypertension-telmisartan---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule49
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-trandate---secondary/output
  ccu002_01-hypertension-150mg---secondary:
    run: ccu002_01-hypertension-150mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule50
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-telmisartan---secondary/output
  ccu002_01-hypertension-500mg---secondary:
    run: ccu002_01-hypertension-500mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule51
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-150mg---secondary/output
  ccu002_01-hypertension-103mg---secondary:
    run: ccu002_01-hypertension-103mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule52
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-500mg---secondary/output
  ccu002_01-hypertension-deliv---secondary:
    run: ccu002_01-hypertension-deliv---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule53
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-103mg---secondary/output
  ccu002_01-hypertension-timolol---secondary:
    run: ccu002_01-hypertension-timolol---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule54
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-deliv---secondary/output
  ccu002_01-hypertension-cardura---secondary:
    run: ccu002_01-hypertension-cardura---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule55
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-timolol---secondary/output
  sectral-ccu002_01-hypertension---secondary:
    run: sectral-ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule56
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-cardura---secondary/output
  ccu002_01-hypertension-adipine---secondary:
    run: ccu002_01-hypertension-adipine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule57
      potentialCases:
        id: potentialCases
        source: sectral-ccu002_01-hypertension---secondary/output
  ccu002_01-hypertension-erbumine---secondary:
    run: ccu002_01-hypertension-erbumine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule58
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-adipine---secondary/output
  ccu002_01-hypertension-candesartan---secondary:
    run: ccu002_01-hypertension-candesartan---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule59
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-erbumine---secondary/output
  ccu002_01-hypertension-exforge---secondary:
    run: ccu002_01-hypertension-exforge---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule60
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-candesartan---secondary/output
  ccu002_01-hypertension-adanif---secondary:
    run: ccu002_01-hypertension-adanif---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule61
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-exforge---secondary/output
  ccu002_01-hypertension-bicarzem---secondary:
    run: ccu002_01-hypertension-bicarzem---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule62
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-adanif---secondary/output
  lisoretic-ccu002_01-hypertension---secondary:
    run: lisoretic-ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule63
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-bicarzem---secondary/output
  ccu002_01-hypertension-lisinopril---secondary:
    run: ccu002_01-hypertension-lisinopril---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule64
      potentialCases:
        id: potentialCases
        source: lisoretic-ccu002_01-hypertension---secondary/output
  ccu002_01-hypertension-nifedipress---secondary:
    run: ccu002_01-hypertension-nifedipress---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule65
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-lisinopril---secondary/output
  ccu002_01-hypertension-eplerenone---secondary:
    run: ccu002_01-hypertension-eplerenone---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule66
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-nifedipress---secondary/output
  ccu002_01-hypertension-rasilez---secondary:
    run: ccu002_01-hypertension-rasilez---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule67
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-eplerenone---secondary/output
  ccu002_01-hypertension-zemtard---secondary:
    run: ccu002_01-hypertension-zemtard---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule68
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-rasilez---secondary/output
  ccu002_01-hypertension-240mg---secondary:
    run: ccu002_01-hypertension-240mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule69
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-zemtard---secondary/output
  ccu002_01-hypertension-plendil---secondary:
    run: ccu002_01-hypertension-plendil---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule70
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-240mg---secondary/output
  ccu002_01-hypertension-codiovan---secondary:
    run: ccu002_01-hypertension-codiovan---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule71
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-plendil---secondary/output
  ccu002_01-hypertension-parmid---secondary:
    run: ccu002_01-hypertension-parmid---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule72
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-codiovan---secondary/output
  ccu002_01-hypertension-riociguat---secondary:
    run: ccu002_01-hypertension-riociguat---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule73
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-parmid---secondary/output
  ccu002_01-hypertension-quinapril---secondary:
    run: ccu002_01-hypertension-quinapril---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule74
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-riociguat---secondary/output
  ccu002_01-hypertension-100mg---secondary:
    run: ccu002_01-hypertension-100mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule75
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-quinapril---secondary/output
  ccu002_01-hypertension-adizemxl---secondary:
    run: ccu002_01-hypertension-adizemxl---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule76
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-100mg---secondary/output
  ccu002_01-hypertension-terazosin---secondary:
    run: ccu002_01-hypertension-terazosin---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule77
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-adizemxl---secondary/output
  ccu002_01-hypertension-cardilate---secondary:
    run: ccu002_01-hypertension-cardilate---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule78
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-terazosin---secondary/output
  ccu002_01-hypertension-400microgram---secondary:
    run: ccu002_01-hypertension-400microgram---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule79
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-cardilate---secondary/output
  ccu002_01-hypertension-360mg---secondary:
    run: ccu002_01-hypertension-360mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule80
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-400microgram---secondary/output
  ccu002_01-hypertension-imidapril---secondary:
    run: ccu002_01-hypertension-imidapril---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule81
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-360mg---secondary/output
  alkapamid-ccu002_01-hypertension---secondary:
    run: alkapamid-ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule82
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-imidapril---secondary/output
  ccu002_01-hypertension-coracten---secondary:
    run: ccu002_01-hypertension-coracten---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule83
      potentialCases:
        id: potentialCases
        source: alkapamid-ccu002_01-hypertension---secondary/output
  ccu002_01-hypertension-ifirmasta---secondary:
    run: ccu002_01-hypertension-ifirmasta---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule84
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-coracten---secondary/output
  ccu002_01-hypertension-coversyl---secondary:
    run: ccu002_01-hypertension-coversyl---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule85
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-ifirmasta---secondary/output
  ccu002_01-hypertension-zanidip---secondary:
    run: ccu002_01-hypertension-zanidip---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule86
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-coversyl---secondary/output
  ccu002_01-hypertension-labetalol---secondary:
    run: ccu002_01-hypertension-labetalol---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule87
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-zanidip---secondary/output
  ccu002_01-hypertension-capsule---secondary:
    run: ccu002_01-hypertension-capsule---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule88
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-labetalol---secondary/output
  ccu002_01-hypertension-ramipril---secondary:
    run: ccu002_01-hypertension-ramipril---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule89
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-capsule---secondary/output
  ccu002_01-hypertension-diltiazem---secondary:
    run: ccu002_01-hypertension-diltiazem---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule90
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-ramipril---secondary/output
  ccu002_01-hypertension-trandolapril---secondary:
    run: ccu002_01-hypertension-trandolapril---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule91
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-diltiazem---secondary/output
  ccu002_01-hypertension-160mg---secondary:
    run: ccu002_01-hypertension-160mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule92
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-trandolapril---secondary/output
  ccu002_01-hypertension-verapress---secondary:
    run: ccu002_01-hypertension-verapress---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule93
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-160mg---secondary/output
  ccu002_01-hypertension-tanatril---secondary:
    run: ccu002_01-hypertension-tanatril---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule94
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-verapress---secondary/output
  ccu002_01-hypertension-300mg---secondary:
    run: ccu002_01-hypertension-300mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule95
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-tanatril---secondary/output
  ccu002_01-hypertension-folpik---secondary:
    run: ccu002_01-hypertension-folpik---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule96
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-300mg---secondary/output
  ccu002_01-hypertension-securon---secondary:
    run: ccu002_01-hypertension-securon---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule97
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-folpik---secondary/output
  ccu002_01-hypertension-noyada---secondary:
    run: ccu002_01-hypertension-noyada---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule98
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-securon---secondary/output
  ccu002_01-hypertension-catapre---secondary:
    run: ccu002_01-hypertension-catapre---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule99
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-noyada---secondary/output
  ccu002_01-hypertension-triapin---secondary:
    run: ccu002_01-hypertension-triapin---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule100
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-catapre---secondary/output
  ccu002_01-hypertension-univer---secondary:
    run: ccu002_01-hypertension-univer---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule101
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-triapin---secondary/output
  ccu002_01-hypertension-celectol---secondary:
    run: ccu002_01-hypertension-celectol---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule102
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-univer---secondary/output
  ccu002_01-hypertension-istin---secondary:
    run: ccu002_01-hypertension-istin---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule103
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-celectol---secondary/output
  ccu002_01-hypertension-valni---secondary:
    run: ccu002_01-hypertension-valni---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule104
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-istin---secondary/output
  ccu002_01-hypertension-adizemsr---secondary:
    run: ccu002_01-hypertension-adizemsr---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule105
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-valni---secondary/output
  ccu002_01-hypertension-hydralazine---secondary:
    run: ccu002_01-hypertension-hydralazine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule106
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-adizemsr---secondary/output
  ccu002_01-hypertension-tritace---secondary:
    run: ccu002_01-hypertension-tritace---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule107
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-hydralazine---secondary/output
  ccu002_01-hypertension-titration---secondary:
    run: ccu002_01-hypertension-titration---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule108
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-tritace---secondary/output
  ccu002_01-hypertension-viazem---secondary:
    run: ccu002_01-hypertension-viazem---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule109
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-titration---secondary/output
  ccu002_01-hypertension-bisoprolol---secondary:
    run: ccu002_01-hypertension-bisoprolol---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule110
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-viazem---secondary/output
  ccu002_01-hypertension-olmesartan---secondary:
    run: ccu002_01-hypertension-olmesartan---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule111
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-bisoprolol---secondary/output
  ccu002_01-hypertension-celiprolol---secondary:
    run: ccu002_01-hypertension-celiprolol---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule112
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-olmesartan---secondary/output
  ccu002_01-hypertension-carace---secondary:
    run: ccu002_01-hypertension-carace---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule113
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-celiprolol---secondary/output
  ccu002_01-hypertension-innovace---secondary:
    run: ccu002_01-hypertension-innovace---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule114
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-carace---secondary/output
  ccu002_01-hypertension-minoxidil---secondary:
    run: ccu002_01-hypertension-minoxidil---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule115
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-innovace---secondary/output
  ccu002_01-hypertension-inspra---secondary:
    run: ccu002_01-hypertension-inspra---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule116
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-minoxidil---secondary/output
  ccu002_01-hypertension-tenormin---secondary:
    run: ccu002_01-hypertension-tenormin---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule117
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-inspra---secondary/output
  ccu002_01-hypertension-olmetec---secondary:
    run: ccu002_01-hypertension-olmetec---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule118
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-tenormin---secondary/output
  ccu002_01-hypertension-amlostin---secondary:
    run: ccu002_01-hypertension-amlostin---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule119
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-olmetec---secondary/output
  ccu002_01-hypertension-edarbi---secondary:
    run: ccu002_01-hypertension-edarbi---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule120
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-amlostin---secondary/output
  ccu002_01-hypertension-angitil---secondary:
    run: ccu002_01-hypertension-angitil---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule121
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-edarbi---secondary/output
  ccu002_01-hypertension-capoten---secondary:
    run: ccu002_01-hypertension-capoten---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule122
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-angitil---secondary/output
  ccu002_01-hypertension-volibri---secondary:
    run: ccu002_01-hypertension-volibri---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule123
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-capoten---secondary/output
  ccu002_01-hypertension-aliskiren---secondary:
    run: ccu002_01-hypertension-aliskiren---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule124
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-volibri---secondary/output
  ccu002_01-hypertension-tensipine---secondary:
    run: ccu002_01-hypertension-tensipine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule125
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-aliskiren---secondary/output
  ccu002_01-hypertension-nifopress---secondary:
    run: ccu002_01-hypertension-nifopress---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule126
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-tensipine---secondary/output
  ccu002_01-hypertension-betaloc---secondary:
    run: ccu002_01-hypertension-betaloc---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule127
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-nifopress---secondary/output
  ccu002_01-hypertension-felotens---secondary:
    run: ccu002_01-hypertension-felotens---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule128
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-betaloc---secondary/output
  ccu002_01-hypertension-accupro---secondary:
    run: ccu002_01-hypertension-accupro---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule129
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-felotens---secondary/output
  ccu002_01-hypertension-loniten---secondary:
    run: ccu002_01-hypertension-loniten---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule130
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-accupro---secondary/output
  ccu002_01-hypertension-sotacor---secondary:
    run: ccu002_01-hypertension-sotacor---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule131
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-loniten---secondary/output
  ccu002_01-hypertension-kenzem---secondary:
    run: ccu002_01-hypertension-kenzem---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule132
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-sotacor---secondary/output
  ccu002_01-hypertension-aldomet---secondary:
    run: ccu002_01-hypertension-aldomet---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule133
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-kenzem---secondary/output
  ccu002_01-hypertension-doxadura---secondary:
    run: ccu002_01-hypertension-doxadura---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule134
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-aldomet---secondary/output
  ccu002_01-hypertension-hypovase---secondary:
    run: ccu002_01-hypertension-hypovase---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule135
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-doxadura---secondary/output
  ccu002_01-hypertension-natrilix---secondary:
    run: ccu002_01-hypertension-natrilix---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule136
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-hypovase---secondary/output
  ccu002_01-hypertension-acebutolol---secondary:
    run: ccu002_01-hypertension-acebutolol---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule137
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-natrilix---secondary/output
  ccu002_01-hypertension-vascalpha---secondary:
    run: ccu002_01-hypertension-vascalpha---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule138
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-acebutolol---secondary/output
  ccu002_01-hypertension-600mg---secondary:
    run: ccu002_01-hypertension-600mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule139
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-vascalpha---secondary/output
  ccu002_01-hypertension-tolura---secondary:
    run: ccu002_01-hypertension-tolura---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule140
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-600mg---secondary/output
  ccu002_01-hypertension-625mg---secondary:
    run: ccu002_01-hypertension-625mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule141
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-tolura---secondary/output
  ccu002_01-hypertension-180mg---secondary:
    run: ccu002_01-hypertension-180mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule142
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-625mg---secondary/output
  ccu002_01-hypertension-irbesartan---secondary:
    run: ccu002_01-hypertension-irbesartan---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule143
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-180mg---secondary/output
  ccu002_01-hypertension-tosilate---secondary:
    run: ccu002_01-hypertension-tosilate---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule144
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-irbesartan---secondary/output
  ccu002_01-hypertension-enalapril---secondary:
    run: ccu002_01-hypertension-enalapril---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule145
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-tosilate---secondary/output
  ccu002_01-hypertension-cardicor---secondary:
    run: ccu002_01-hypertension-cardicor---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule146
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-enalapril---secondary/output
  ccu002_01-hypertension-sotalol---secondary:
    run: ccu002_01-hypertension-sotalol---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule147
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-cardicor---secondary/output
  ccu002_01-hypertension-oxprenolol---secondary:
    run: ccu002_01-hypertension-oxprenolol---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule148
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-sotalol---secondary/output
  ccu002_01-hypertension-methyldopa---secondary:
    run: ccu002_01-hypertension-methyldopa---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule149
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-oxprenolol---secondary/output
  ccu002_01-hypertension-congescor---secondary:
    run: ccu002_01-hypertension-congescor---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule150
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-methyldopa---secondary/output
  ccu002_01-hypertension-aprovel---secondary:
    run: ccu002_01-hypertension-aprovel---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule151
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-congescor---secondary/output
  ccu002_01-hypertension-cabren---secondary:
    run: ccu002_01-hypertension-cabren---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule152
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-aprovel---secondary/output
  ccu002_01-hypertension-lacidipine---secondary:
    run: ccu002_01-hypertension-lacidipine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule153
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-cabren---secondary/output
  ccu002_01-hypertension-motens---secondary:
    run: ccu002_01-hypertension-motens---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule154
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-lacidipine---secondary/output
  ccu002_01-hypertension-200microgram---secondary:
    run: ccu002_01-hypertension-200microgram---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule155
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-motens---secondary/output
  ccu002_01-hypertension-vastarel---secondary:
    run: ccu002_01-hypertension-vastarel---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule156
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-200microgram---secondary/output
  ccu002_01-hypertension-250mg---secondary:
    run: ccu002_01-hypertension-250mg---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule157
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-vastarel---secondary/output
  ccu002_01-hypertension-lercanidipine---secondary:
    run: ccu002_01-hypertension-lercanidipine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule158
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-250mg---secondary/output
  ccu002_01-hypertension-felogen---secondary:
    run: ccu002_01-hypertension-felogen---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule159
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-lercanidipine---secondary/output
  ccu002_01-hypertension-calchan---secondary:
    run: ccu002_01-hypertension-calchan---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule160
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-felogen---secondary/output
  ccu002_01-hypertension-atenolol---secondary:
    run: ccu002_01-hypertension-atenolol---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule161
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-calchan---secondary/output
  ccu002_01-hypertension-losartan---secondary:
    run: ccu002_01-hypertension-losartan---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule162
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-atenolol---secondary/output
  ccu002_01-hypertension-cozidocapt---secondary:
    run: ccu002_01-hypertension-cozidocapt---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule163
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-losartan---secondary/output
  ccu002_01-hypertension-trimetazidine---secondary:
    run: ccu002_01-hypertension-trimetazidine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule164
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-cozidocapt---secondary/output
  zestoretic-ccu002_01-hypertension---secondary:
    run: zestoretic-ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule165
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-trimetazidine---secondary/output
  ccu002_01-hypertension-zaroxolyn---secondary:
    run: ccu002_01-hypertension-zaroxolyn---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule166
      potentialCases:
        id: potentialCases
        source: zestoretic-ccu002_01-hypertension---secondary/output
  ccu002_01-hypertension-entresto---secondary:
    run: ccu002_01-hypertension-entresto---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule167
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-zaroxolyn---secondary/output
  ccu002_01-hypertension-nidef---secondary:
    run: ccu002_01-hypertension-nidef---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule168
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-entresto---secondary/output
  ccu002_01-hypertension-cotenidone---secondary:
    run: ccu002_01-hypertension-cotenidone---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule169
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-nidef---secondary/output
  ccu002_01-hypertension-azilsartan---secondary:
    run: ccu002_01-hypertension-azilsartan---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule170
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-cotenidone---secondary/output
  ccu002_01-hypertension-dilcardia---secondary:
    run: ccu002_01-hypertension-dilcardia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule171
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-azilsartan---secondary/output
  ccu002_01-hypertension-bosentan---secondary:
    run: ccu002_01-hypertension-bosentan---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule172
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-dilcardia---secondary/output
  ccu002_01-hypertension-sildenafil---secondary:
    run: ccu002_01-hypertension-sildenafil---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule173
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-bosentan---secondary/output
  ccu002_01-hypertension-spironolactone---secondary:
    run: ccu002_01-hypertension-spironolactone---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule174
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-sildenafil---secondary/output
  ccu002_01-hypertension-amlodipine---secondary:
    run: ccu002_01-hypertension-amlodipine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule175
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-spironolactone---secondary/output
  ccu002_01-hypertension-nadolol---secondary:
    run: ccu002_01-hypertension-nadolol---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule176
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-amlodipine---secondary/output
  ccu002_01-hypertension-nebivolol---secondary:
    run: ccu002_01-hypertension-nebivolol---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule177
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-nadolol---secondary/output
  ccu002_01-hypertension-felodipine---secondary:
    run: ccu002_01-hypertension-felodipine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule178
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-nebivolol---secondary/output
  ccu002_01-hypertension-indapamide---secondary:
    run: ccu002_01-hypertension-indapamide---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule179
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-felodipine---secondary/output
  ccu002_01-hypertension-micardi---secondary:
    run: ccu002_01-hypertension-micardi---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule180
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-indapamide---secondary/output
  ccu002_01-hypertension-aldactone---secondary:
    run: ccu002_01-hypertension-aldactone---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule181
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-micardi---secondary/output
  ccu002_01-hypertension-neofel---secondary:
    run: ccu002_01-hypertension-neofel---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule182
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-aldactone---secondary/output
  ccu002_01-hypertension-neozipine---secondary:
    run: ccu002_01-hypertension-neozipine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule183
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-neofel---secondary/output
  ccu002_01-hypertension-cardioplen---secondary:
    run: ccu002_01-hypertension-cardioplen---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule184
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-neozipine---secondary/output
  ccu002_01-hypertension-zestril---secondary:
    run: ccu002_01-hypertension-zestril---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule185
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-cardioplen---secondary/output
  ccu002_01-hypertension-arginine---secondary:
    run: ccu002_01-hypertension-arginine---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule186
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-zestril---secondary/output
  ccu002_01-hypertension-revatio---secondary:
    run: ccu002_01-hypertension-revatio---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule187
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-arginine---secondary/output
  ccu002_01-hypertension-retard---secondary:
    run: ccu002_01-hypertension-retard---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule188
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-revatio---secondary/output
  ccu002_01-hypertension-ambrisentan---secondary:
    run: ccu002_01-hypertension-ambrisentan---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule189
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-retard---secondary/output
  ccu002_01-hypertension-modifiedrelease---secondary:
    run: ccu002_01-hypertension-modifiedrelease---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule190
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-ambrisentan---secondary/output
  ccu002_01-hypertension-compl---secondary:
    run: ccu002_01-hypertension-compl---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule191
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-modifiedrelease---secondary/output
  ccu002_01-hypertension-context---secondary:
    run: ccu002_01-hypertension-context---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule192
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-compl---secondary/output
  ccu002_01-hypertension-reaction---secondary:
    run: ccu002_01-hypertension-reaction---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule193
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-context---secondary/output
  ccu002_01-hypertension-review---secondary:
    run: ccu002_01-hypertension-review---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule194
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-reaction---secondary/output
  ccu002_01-hypertension-childbth---secondary:
    run: ccu002_01-hypertension-childbth---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule195
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-review---secondary/output
  ccu002_01-hypertension-control---secondary:
    run: ccu002_01-hypertension-control---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule196
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-childbth---secondary/output
  ccu002_01-hypertension-resolved---secondary:
    run: ccu002_01-hypertension-resolved---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule197
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-control---secondary/output
  adverse-ccu002_01-hypertension---secondary:
    run: adverse-ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule198
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-resolved---secondary/output
  hypertension---secondary:
    run: hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule199
      potentialCases:
        id: potentialCases
        source: adverse-ccu002_01-hypertension---secondary/output
  ccu002_01-hypertension-treatment---secondary:
    run: ccu002_01-hypertension-treatment---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule200
      potentialCases:
        id: potentialCases
        source: hypertension---secondary/output
  obstetric-ccu002_01-hypertension---secondary:
    run: obstetric-ccu002_01-hypertension---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule201
      potentialCases:
        id: potentialCases
        source: ccu002_01-hypertension-treatment---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule202
      potentialCases:
        id: potentialCases
        source: obstetric-ccu002_01-hypertension---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
  inputModule22:
    id: inputModule22
    doc: Python implementation unit
    type: File
  inputModule23:
    id: inputModule23
    doc: Python implementation unit
    type: File
  inputModule24:
    id: inputModule24
    doc: Python implementation unit
    type: File
  inputModule25:
    id: inputModule25
    doc: Python implementation unit
    type: File
  inputModule26:
    id: inputModule26
    doc: Python implementation unit
    type: File
  inputModule27:
    id: inputModule27
    doc: Python implementation unit
    type: File
  inputModule28:
    id: inputModule28
    doc: Python implementation unit
    type: File
  inputModule29:
    id: inputModule29
    doc: Python implementation unit
    type: File
  inputModule30:
    id: inputModule30
    doc: Python implementation unit
    type: File
  inputModule31:
    id: inputModule31
    doc: Python implementation unit
    type: File
  inputModule32:
    id: inputModule32
    doc: Python implementation unit
    type: File
  inputModule33:
    id: inputModule33
    doc: Python implementation unit
    type: File
  inputModule34:
    id: inputModule34
    doc: Python implementation unit
    type: File
  inputModule35:
    id: inputModule35
    doc: Python implementation unit
    type: File
  inputModule36:
    id: inputModule36
    doc: Python implementation unit
    type: File
  inputModule37:
    id: inputModule37
    doc: Python implementation unit
    type: File
  inputModule38:
    id: inputModule38
    doc: Python implementation unit
    type: File
  inputModule39:
    id: inputModule39
    doc: Python implementation unit
    type: File
  inputModule40:
    id: inputModule40
    doc: Python implementation unit
    type: File
  inputModule41:
    id: inputModule41
    doc: Python implementation unit
    type: File
  inputModule42:
    id: inputModule42
    doc: Python implementation unit
    type: File
  inputModule43:
    id: inputModule43
    doc: Python implementation unit
    type: File
  inputModule44:
    id: inputModule44
    doc: Python implementation unit
    type: File
  inputModule45:
    id: inputModule45
    doc: Python implementation unit
    type: File
  inputModule46:
    id: inputModule46
    doc: Python implementation unit
    type: File
  inputModule47:
    id: inputModule47
    doc: Python implementation unit
    type: File
  inputModule48:
    id: inputModule48
    doc: Python implementation unit
    type: File
  inputModule49:
    id: inputModule49
    doc: Python implementation unit
    type: File
  inputModule50:
    id: inputModule50
    doc: Python implementation unit
    type: File
  inputModule51:
    id: inputModule51
    doc: Python implementation unit
    type: File
  inputModule52:
    id: inputModule52
    doc: Python implementation unit
    type: File
  inputModule53:
    id: inputModule53
    doc: Python implementation unit
    type: File
  inputModule54:
    id: inputModule54
    doc: Python implementation unit
    type: File
  inputModule55:
    id: inputModule55
    doc: Python implementation unit
    type: File
  inputModule56:
    id: inputModule56
    doc: Python implementation unit
    type: File
  inputModule57:
    id: inputModule57
    doc: Python implementation unit
    type: File
  inputModule58:
    id: inputModule58
    doc: Python implementation unit
    type: File
  inputModule59:
    id: inputModule59
    doc: Python implementation unit
    type: File
  inputModule60:
    id: inputModule60
    doc: Python implementation unit
    type: File
  inputModule61:
    id: inputModule61
    doc: Python implementation unit
    type: File
  inputModule62:
    id: inputModule62
    doc: Python implementation unit
    type: File
  inputModule63:
    id: inputModule63
    doc: Python implementation unit
    type: File
  inputModule64:
    id: inputModule64
    doc: Python implementation unit
    type: File
  inputModule65:
    id: inputModule65
    doc: Python implementation unit
    type: File
  inputModule66:
    id: inputModule66
    doc: Python implementation unit
    type: File
  inputModule67:
    id: inputModule67
    doc: Python implementation unit
    type: File
  inputModule68:
    id: inputModule68
    doc: Python implementation unit
    type: File
  inputModule69:
    id: inputModule69
    doc: Python implementation unit
    type: File
  inputModule70:
    id: inputModule70
    doc: Python implementation unit
    type: File
  inputModule71:
    id: inputModule71
    doc: Python implementation unit
    type: File
  inputModule72:
    id: inputModule72
    doc: Python implementation unit
    type: File
  inputModule73:
    id: inputModule73
    doc: Python implementation unit
    type: File
  inputModule74:
    id: inputModule74
    doc: Python implementation unit
    type: File
  inputModule75:
    id: inputModule75
    doc: Python implementation unit
    type: File
  inputModule76:
    id: inputModule76
    doc: Python implementation unit
    type: File
  inputModule77:
    id: inputModule77
    doc: Python implementation unit
    type: File
  inputModule78:
    id: inputModule78
    doc: Python implementation unit
    type: File
  inputModule79:
    id: inputModule79
    doc: Python implementation unit
    type: File
  inputModule80:
    id: inputModule80
    doc: Python implementation unit
    type: File
  inputModule81:
    id: inputModule81
    doc: Python implementation unit
    type: File
  inputModule82:
    id: inputModule82
    doc: Python implementation unit
    type: File
  inputModule83:
    id: inputModule83
    doc: Python implementation unit
    type: File
  inputModule84:
    id: inputModule84
    doc: Python implementation unit
    type: File
  inputModule85:
    id: inputModule85
    doc: Python implementation unit
    type: File
  inputModule86:
    id: inputModule86
    doc: Python implementation unit
    type: File
  inputModule87:
    id: inputModule87
    doc: Python implementation unit
    type: File
  inputModule88:
    id: inputModule88
    doc: Python implementation unit
    type: File
  inputModule89:
    id: inputModule89
    doc: Python implementation unit
    type: File
  inputModule90:
    id: inputModule90
    doc: Python implementation unit
    type: File
  inputModule91:
    id: inputModule91
    doc: Python implementation unit
    type: File
  inputModule92:
    id: inputModule92
    doc: Python implementation unit
    type: File
  inputModule93:
    id: inputModule93
    doc: Python implementation unit
    type: File
  inputModule94:
    id: inputModule94
    doc: Python implementation unit
    type: File
  inputModule95:
    id: inputModule95
    doc: Python implementation unit
    type: File
  inputModule96:
    id: inputModule96
    doc: Python implementation unit
    type: File
  inputModule97:
    id: inputModule97
    doc: Python implementation unit
    type: File
  inputModule98:
    id: inputModule98
    doc: Python implementation unit
    type: File
  inputModule99:
    id: inputModule99
    doc: Python implementation unit
    type: File
  inputModule100:
    id: inputModule100
    doc: Python implementation unit
    type: File
  inputModule101:
    id: inputModule101
    doc: Python implementation unit
    type: File
  inputModule102:
    id: inputModule102
    doc: Python implementation unit
    type: File
  inputModule103:
    id: inputModule103
    doc: Python implementation unit
    type: File
  inputModule104:
    id: inputModule104
    doc: Python implementation unit
    type: File
  inputModule105:
    id: inputModule105
    doc: Python implementation unit
    type: File
  inputModule106:
    id: inputModule106
    doc: Python implementation unit
    type: File
  inputModule107:
    id: inputModule107
    doc: Python implementation unit
    type: File
  inputModule108:
    id: inputModule108
    doc: Python implementation unit
    type: File
  inputModule109:
    id: inputModule109
    doc: Python implementation unit
    type: File
  inputModule110:
    id: inputModule110
    doc: Python implementation unit
    type: File
  inputModule111:
    id: inputModule111
    doc: Python implementation unit
    type: File
  inputModule112:
    id: inputModule112
    doc: Python implementation unit
    type: File
  inputModule113:
    id: inputModule113
    doc: Python implementation unit
    type: File
  inputModule114:
    id: inputModule114
    doc: Python implementation unit
    type: File
  inputModule115:
    id: inputModule115
    doc: Python implementation unit
    type: File
  inputModule116:
    id: inputModule116
    doc: Python implementation unit
    type: File
  inputModule117:
    id: inputModule117
    doc: Python implementation unit
    type: File
  inputModule118:
    id: inputModule118
    doc: Python implementation unit
    type: File
  inputModule119:
    id: inputModule119
    doc: Python implementation unit
    type: File
  inputModule120:
    id: inputModule120
    doc: Python implementation unit
    type: File
  inputModule121:
    id: inputModule121
    doc: Python implementation unit
    type: File
  inputModule122:
    id: inputModule122
    doc: Python implementation unit
    type: File
  inputModule123:
    id: inputModule123
    doc: Python implementation unit
    type: File
  inputModule124:
    id: inputModule124
    doc: Python implementation unit
    type: File
  inputModule125:
    id: inputModule125
    doc: Python implementation unit
    type: File
  inputModule126:
    id: inputModule126
    doc: Python implementation unit
    type: File
  inputModule127:
    id: inputModule127
    doc: Python implementation unit
    type: File
  inputModule128:
    id: inputModule128
    doc: Python implementation unit
    type: File
  inputModule129:
    id: inputModule129
    doc: Python implementation unit
    type: File
  inputModule130:
    id: inputModule130
    doc: Python implementation unit
    type: File
  inputModule131:
    id: inputModule131
    doc: Python implementation unit
    type: File
  inputModule132:
    id: inputModule132
    doc: Python implementation unit
    type: File
  inputModule133:
    id: inputModule133
    doc: Python implementation unit
    type: File
  inputModule134:
    id: inputModule134
    doc: Python implementation unit
    type: File
  inputModule135:
    id: inputModule135
    doc: Python implementation unit
    type: File
  inputModule136:
    id: inputModule136
    doc: Python implementation unit
    type: File
  inputModule137:
    id: inputModule137
    doc: Python implementation unit
    type: File
  inputModule138:
    id: inputModule138
    doc: Python implementation unit
    type: File
  inputModule139:
    id: inputModule139
    doc: Python implementation unit
    type: File
  inputModule140:
    id: inputModule140
    doc: Python implementation unit
    type: File
  inputModule141:
    id: inputModule141
    doc: Python implementation unit
    type: File
  inputModule142:
    id: inputModule142
    doc: Python implementation unit
    type: File
  inputModule143:
    id: inputModule143
    doc: Python implementation unit
    type: File
  inputModule144:
    id: inputModule144
    doc: Python implementation unit
    type: File
  inputModule145:
    id: inputModule145
    doc: Python implementation unit
    type: File
  inputModule146:
    id: inputModule146
    doc: Python implementation unit
    type: File
  inputModule147:
    id: inputModule147
    doc: Python implementation unit
    type: File
  inputModule148:
    id: inputModule148
    doc: Python implementation unit
    type: File
  inputModule149:
    id: inputModule149
    doc: Python implementation unit
    type: File
  inputModule150:
    id: inputModule150
    doc: Python implementation unit
    type: File
  inputModule151:
    id: inputModule151
    doc: Python implementation unit
    type: File
  inputModule152:
    id: inputModule152
    doc: Python implementation unit
    type: File
  inputModule153:
    id: inputModule153
    doc: Python implementation unit
    type: File
  inputModule154:
    id: inputModule154
    doc: Python implementation unit
    type: File
  inputModule155:
    id: inputModule155
    doc: Python implementation unit
    type: File
  inputModule156:
    id: inputModule156
    doc: Python implementation unit
    type: File
  inputModule157:
    id: inputModule157
    doc: Python implementation unit
    type: File
  inputModule158:
    id: inputModule158
    doc: Python implementation unit
    type: File
  inputModule159:
    id: inputModule159
    doc: Python implementation unit
    type: File
  inputModule160:
    id: inputModule160
    doc: Python implementation unit
    type: File
  inputModule161:
    id: inputModule161
    doc: Python implementation unit
    type: File
  inputModule162:
    id: inputModule162
    doc: Python implementation unit
    type: File
  inputModule163:
    id: inputModule163
    doc: Python implementation unit
    type: File
  inputModule164:
    id: inputModule164
    doc: Python implementation unit
    type: File
  inputModule165:
    id: inputModule165
    doc: Python implementation unit
    type: File
  inputModule166:
    id: inputModule166
    doc: Python implementation unit
    type: File
  inputModule167:
    id: inputModule167
    doc: Python implementation unit
    type: File
  inputModule168:
    id: inputModule168
    doc: Python implementation unit
    type: File
  inputModule169:
    id: inputModule169
    doc: Python implementation unit
    type: File
  inputModule170:
    id: inputModule170
    doc: Python implementation unit
    type: File
  inputModule171:
    id: inputModule171
    doc: Python implementation unit
    type: File
  inputModule172:
    id: inputModule172
    doc: Python implementation unit
    type: File
  inputModule173:
    id: inputModule173
    doc: Python implementation unit
    type: File
  inputModule174:
    id: inputModule174
    doc: Python implementation unit
    type: File
  inputModule175:
    id: inputModule175
    doc: Python implementation unit
    type: File
  inputModule176:
    id: inputModule176
    doc: Python implementation unit
    type: File
  inputModule177:
    id: inputModule177
    doc: Python implementation unit
    type: File
  inputModule178:
    id: inputModule178
    doc: Python implementation unit
    type: File
  inputModule179:
    id: inputModule179
    doc: Python implementation unit
    type: File
  inputModule180:
    id: inputModule180
    doc: Python implementation unit
    type: File
  inputModule181:
    id: inputModule181
    doc: Python implementation unit
    type: File
  inputModule182:
    id: inputModule182
    doc: Python implementation unit
    type: File
  inputModule183:
    id: inputModule183
    doc: Python implementation unit
    type: File
  inputModule184:
    id: inputModule184
    doc: Python implementation unit
    type: File
  inputModule185:
    id: inputModule185
    doc: Python implementation unit
    type: File
  inputModule186:
    id: inputModule186
    doc: Python implementation unit
    type: File
  inputModule187:
    id: inputModule187
    doc: Python implementation unit
    type: File
  inputModule188:
    id: inputModule188
    doc: Python implementation unit
    type: File
  inputModule189:
    id: inputModule189
    doc: Python implementation unit
    type: File
  inputModule190:
    id: inputModule190
    doc: Python implementation unit
    type: File
  inputModule191:
    id: inputModule191
    doc: Python implementation unit
    type: File
  inputModule192:
    id: inputModule192
    doc: Python implementation unit
    type: File
  inputModule193:
    id: inputModule193
    doc: Python implementation unit
    type: File
  inputModule194:
    id: inputModule194
    doc: Python implementation unit
    type: File
  inputModule195:
    id: inputModule195
    doc: Python implementation unit
    type: File
  inputModule196:
    id: inputModule196
    doc: Python implementation unit
    type: File
  inputModule197:
    id: inputModule197
    doc: Python implementation unit
    type: File
  inputModule198:
    id: inputModule198
    doc: Python implementation unit
    type: File
  inputModule199:
    id: inputModule199
    doc: Python implementation unit
    type: File
  inputModule200:
    id: inputModule200
    doc: Python implementation unit
    type: File
  inputModule201:
    id: inputModule201
    doc: Python implementation unit
    type: File
  inputModule202:
    id: inputModule202
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
