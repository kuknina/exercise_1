# note: I understand that this is not exactly as the ER diagram describes,
# but rather how the questions are asked


# hospitals identification
hospitals = sc.textFile("hospitals.csv")

hospitals2 = hospitals.map( lambda l: l.split(';'))

hospitals3 = hospitals2.map( lambda p: (p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10]))


HospSchemaString = 'PROVIDERID HOSPITALNAME ADDRESS CITY STATE ZIPCODE COUNTYNAME PHONENUMBER HOSPITALTYPE HOSPITALOWNERSHIP EMERGENCYSERVICES'

HospFields = [StructField( field_name, StringType(), True) for field_name in HospSchemaString.split()]

SchemaHosp = StructType( HospFields)

sqlContext = SQLContext(sc)

SchemaHospitals = sqlContext.createDataFrame( hospitals3, SchemaHosp)

SchemaHospitals.registerTempTable('SchemaHospitals')

sc.parallelize(SchemaHospitals).saveAsTextFile("SchemaHospitalsPar")



# survey responses

surveys_responses = sc.textFile("surveys_responses.csv")

surveys_responses2 = surveys_responses.map( lambda l: l.split(';'))

survey_results3 = surveys_responses2.map( lambda p: (p[0], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15], p[16], p[17], p[18], p[19], p[20], p[21], p[22], p[23], p[24], p[25], p[26], p[27], p[28], p[29], p[30], p[31], p[32]))


SurResString = 'PROVIDERID NURSES_ACH NURSES_IMP NURSES_DIM DOCTORS_ACH DOCTORS_IMP DOCTORS_DIM RES_STAFF_ACH RES_STAFF_IMP RES_STAFF_DIM PAIN_MAN_ACH PAIN_MAN_IMP PAIN_MAN_DIM COMM_MED_ACH COMM_MED_IMP COMM_MED_DIM ENV_ACH ENV_IMP ENV_DIM DIS_INF_ACG DIS_INF_IMP DIS_INF_DIM OVERALL_ACH OVERALL_IMP OVERALL_DIM HCAHPS_BASE HCAHPS_CON'

SurResFields = [StructField( field_name, StringType(), True) for field_name in SurResString.split()]

SchemaSur = StructType( SurResFields)

sqlContext = SQLContext(sc)

SchemaSurResp = sqlContext.createDataFrame( survey_results3, SchemaSur)

SchemaSurResp.registerTempTable('SchemaSurResp')

sc.parallelize(SchemaSurResp).saveAsTextFile("SchemaSurResp2")


# readmissions

readmissions = sc.textFile("readmissions.csv")

readmissions2 = readmissions.map( lambda l: l.split(';'))

readmissions3 = readmissions2.map( lambda p: (p[0], p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15], p[16]))


ReadsString = 'PROVIDERID MEASURE_NAME MEASURE_ID COMP_TO_NAT DENOMINATOR SC_LOWER_EST SC_HIGHER_EST FOOTNOTE MEASURE_START_DATE MEASURE_END_DATE'

ReadsFields = [StructField( field_name, StringType(), True) for field_name in ReadsString.split()]

SchemaReads = StructType( ReadsFields)

sqlContext = SQLContext(sc)

SchemaReadmissions = sqlContext.createDataFrame( readmissions3, SchemaReads)

SchemaReadmissions.registerTempTable('SchemaReadmissions')

sc.parallelize(SchemaReadmissions).saveAsTextFile("SchemaReadmissions")
