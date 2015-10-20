# get best hospitals

CREATE TABLE procedures AS
	SELECT Measure_ID as Procedure_ID,
		Measure_Name as Procedure_Name,
		Provider_ID,
		State,
		Score
	FROM effective_care;

CREATE TABLE pre_survey AS
	SELECT  Provider_ID
			regexp_extract(Overall_Ach, "([0-9]+) out of ([0-9]+)", 1) / regexp_extract(Overall_Ach, "([0-9]+) out of ([0-9]+)", 2) as Overall_Ach,
			regexp_extract(Overall_Imp, "([0-9]+) out of ([0-9]+)", 1) / regexp_extract(Overall_Imp, "([0-9]+) out of ([0-9]+)", 2) as Overall_Imp,
			regexp_extract(HCAHPS_Base_Score,'\"([0-9]*)\"',1) as HC_Base_Score,
			regexp_extract(HCAHPS_Con,'\"([0-9]*)\"',1) as HC_Consist_Score

	FROM survey_responses;

CREATE TABLE survey_e AS
	SELECT  a.Hospital_ID,
			a.Overall_Ach,
			a.Overall_Imp,
			(a.HC_Base_Score- b.Base_avg) / b.Base_std_dev as Base_zscore,
			(a.Consist_Score - b.Consist_avg) / b.Consist_std_dev as Consist_zscore

	FROM pre_survey a
	CROSS JOIN (
		SELECT  AVG(Base_Score) as Base_avg,
				STDDEV_POP(Base_Score) as Base_std_dev,
				AVG(Consist_Score) as Consist_avg,
				STDDEV_POP(Consist_Score) as Consist_std_dev
		FROM pre_survey_e
		) b;

CREATE TABLE all_hospitals AS
	SELECT Provider_ID,
		Hospital_Name,
		State,
		Hospital_Type;
	FROM hospitals;

CREATE TABLE hosp_rating AS
	SELECT HOSPITAL_ID, NTILE(10) OVER (PARTITION BY Score) as ranking_procedure
	FROM procedures
	WHERE CASE(regexp_extract(Score, '\"([0-9]*)\"',1) as INT) IS NOT NULL;

CREATE TABLE top_hospitals AS
	SELECT a.Hospital_ID, b.Hospital_Name, a.med_score
	FROM (
		SELECT Hospital_ID, PERCENTILE(ranking_procedure, 0.5)) as med_score,
		FROM hosp_rating
		GROUP BY Hospital_ID
		) a
	LEFT JOIN all_hospitals b
		on a.Hospital_ID = b.Hospital_ID
	ORDER BY median_score DESC;
