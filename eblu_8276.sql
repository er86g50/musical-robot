select  o.mrn, ti.confdate,   tc.name_
,lh.bagsdisp
,ps.payor
,PS2.payor
,PS3.payor
	FROM CPRSQL.dbo.OT	O
	join [CPRSQL].[dbo].[TICKC] TC  
		ON TC.OTNO = o.NO
		AND TC.DELFLAG = 0
	JOIN [CPRSQL].[dbo].[TICKCI] TI 
		ON TC.TICKNO = TI.TICKNO  
	
		AND TI.DELFLAG = 0
	JOIN [CPRSQL].[dbo].PARTS P 
		ON P.NO = O.INVNO
		AND P.ISITRX  = 'y'
		AND P.DELFLAG = 0
		and p.no not in (1717,735,800)
			JOIN [CPRSQL].[dbo].HR H 
		ON H.MRN = O.MRN
		AND H.LAST_NAME NOT IN ('TEST','SAMPLE')
		AND H.DELFLAG = 0
		LEFT JOIN CPRSQL.dbo.PATINS PS 
			ON PS.MRN=H.mrn
			
				AND ps.delflag =0
				and ps.rank = '1.0'
				and ps.insno <> 0
				and ps.status ='Active'
		LEFT JOIN CPRSQL.dbo.INSCOMP IC
			ON PS.INSNO = IC.[NO]	
	LEFT JOIN CPRSQL.dbo.PATINS PS2 
			ON PS2.MRN=H.mrn
				--AND ps2.CPK_PATINS=O.PI_NO 
				AND ps2.delflag =0
				and ps2.rank = '2.0'
				and ps2.insno <> 0
				and ps2.status ='Active'
		LEFT JOIN CPRSQL.dbo.INSCOMP IC2
			ON PS2.INSNO = IC2.[NO]
				LEFT JOIN CPRSQL.dbo.PATINS PS3 
			ON PS3.MRN=H.mrn
				--AND ps2.CPK_PATINS=O.PI_NO 
				AND ps3.delflag =0
				and ps3.rank = '3.0'
				and ps3.insno <> 0
				and ps3.status ='Active'
		LEFT JOIN CPRSQL.dbo.INSCOMP IC3
			ON PS3.INSNO = IC3.[NO]
		LEFT JOIN [CPRSQL].[dbo].[TRACKING] TR 
		ON TC.TICKNO = TR.TICKNO 
		AND TR.DELFLAG=0	
		LEFT JOIN CPRSQL.DBO.LABLOG LA
             ON LA.CPK_LABLOG=TC.LABLOGNO 
                AND LA.LINK=TC.MRN
        LEFT JOIN CPRSQL.DBO.LABELSHISTORY LH 
             ON LH.CPK_LABELSHISTORY=LA.CFK_LABELSHISTORY 
                AND LA.LINK=LH.LINK
where o.mrn=ti.mrn
and o.status = 'active'
  --and o.descrip not like 'paraguard%'
  and o.siteno not in ( 2,5)
  and tc.name_ not in ('COVID19','New Patient Folder', 'Texas Patient Insert','Refrigerate', 'Direct Signature Required','Alcohol Prep Pad'
  ,'Sharp Container 1.4qt 305557' ,'Sharp Container 1.4qt  305557', 'GA/IA Temp Monitor', 'Caregiver Instruction Form', 'Wisconsin Patient Insert'
  ,'Revlimid Medication Guide', 'Pomalyst Med Guide', 'Turalio Med Guide', 'Lenalidomide Med Guide','Ayvakit Brochure - Advanced SM'
  ,'VENCLEXTA CLL Kit','VENCLEXTA  MedGuide','Tasigna MedGuide', 'Indirect Signature Required','Caprelsa  Med Guide', 'Saturday Delivery'
  ,'Lynparza Med Guide','Desiccant', 'Calquence CLL Starter Kit')

  	AND TI.CONFDATE  >= getdate()-60

     
  	 group by
	 o.mrn, ti.confdate,   
	 tc.name_,
lh.bagsdisp
,ps.payor
,PS2.payor
,PS3.payor
  order by 	 o.mrn, ti.confdate,   tc.name_
,lh.bagsdisp
,ps.payor
,PS2.payor
,PS3.payor


--60=45856
--31=27284